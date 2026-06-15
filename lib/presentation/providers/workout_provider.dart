import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../ai/gemma_service.dart';
import '../../ai/workout_parser.dart';
import '../../core/utils/preferences_provider.dart';
import '../../data/repositories/exercise_repository_impl.dart';
import '../../data/repositories/workout_repository_impl.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_set.dart';
import '../providers/auth_provider.dart';

part 'workout_provider.g.dart';

/// One exercise being tracked in the current workout session.
class ActiveExercise {
  const ActiveExercise({
    required this.workoutExerciseId,
    required this.exerciseId,
    required this.exerciseName,
    required this.sets,
    this.previousSets = const [],
  });

  final String workoutExerciseId;
  final int exerciseId;
  final String exerciseName;
  final List<WorkoutSet> sets;
  final List<WorkoutSet> previousSets;

  double get totalVolume => sets.fold(0.0, (s, ws) => s + ws.volume);

  ActiveExercise copyWith({
    List<WorkoutSet>? sets,
    List<WorkoutSet>? previousSets,
  }) =>
      ActiveExercise(
        workoutExerciseId: workoutExerciseId,
        exerciseId: exerciseId,
        exerciseName: exerciseName,
        sets: sets ?? this.sets,
        previousSets: previousSets ?? this.previousSets,
      );
}

class WorkoutState {
  const WorkoutState({
    this.workoutId,
    this.workoutName,
    this.isActive = false,
    this.startedAt,
    this.exercises = const [],
    this.preferredUnit = 'kg',
    this.restStartMs,
    this.restDurationSecs = 90,
    this.parsingError,
  });

  final String? workoutId;
  final String? workoutName;
  final bool isActive;
  final DateTime? startedAt;
  final List<ActiveExercise> exercises;
  final String preferredUnit;
  final int? restStartMs;
  final int restDurationSecs;
  final String? parsingError;

  bool get isResting => restStartMs != null;

  int get restRemainingSeconds {
    if (!isResting || restStartMs == null) return 0;
    final elapsed =
        (DateTime.now().millisecondsSinceEpoch - restStartMs!) ~/ 1000;
    return (restDurationSecs - elapsed).clamp(0, restDurationSecs);
  }

  double get totalVolumeKg =>
      exercises.fold(0.0, (s, e) => s + e.totalVolume);

  Duration get elapsed =>
      startedAt != null ? DateTime.now().difference(startedAt!) : Duration.zero;

  WorkoutState copyWith({
    String? workoutId,
    String? workoutName,
    bool? isActive,
    DateTime? startedAt,
    List<ActiveExercise>? exercises,
    String? preferredUnit,
    int? restStartMs,
    bool clearRest = false,
    int? restDurationSecs,
    String? parsingError,
    bool clearParsingError = false,
  }) =>
      WorkoutState(
        workoutId: workoutId ?? this.workoutId,
        workoutName: workoutName ?? this.workoutName,
        isActive: isActive ?? this.isActive,
        startedAt: startedAt ?? this.startedAt,
        exercises: exercises ?? this.exercises,
        preferredUnit: preferredUnit ?? this.preferredUnit,
        restStartMs: clearRest ? null : (restStartMs ?? this.restStartMs),
        restDurationSecs: restDurationSecs ?? this.restDurationSecs,
        parsingError: clearParsingError
            ? null
            : (parsingError ?? this.parsingError),
      );
}

@Riverpod(keepAlive: true)
class WorkoutNotifier extends _$WorkoutNotifier {
  @override
  WorkoutState build() {
    final prefs = ref.read(sharedPreferencesProvider);
    return WorkoutState(
      preferredUnit: prefs.getString('preferred_unit') ?? 'kg',
    );
  }

  Future<String> startAdHoc(String name) async {
    final userId = ref.read(authProvider).userId ?? 'anon';
    final workoutId = await ref.read(workoutRepositoryProvider).createWorkout(
      userId,
      name,
      isAdHoc: true,
    );
    state = WorkoutState(
      workoutId: workoutId,
      workoutName: name,
      isActive: true,
      startedAt: DateTime.now(),
      preferredUnit: state.preferredUnit,
    );
    return workoutId;
  }

  Future<void> addExercise(Exercise exercise) async {
    final workoutId = state.workoutId;
    if (workoutId == null) return;

    final repo = ref.read(workoutRepositoryProvider);
    final weId = await repo.addExerciseToWorkout(
      workoutId,
      exercise.id,
      state.exercises.length,
    );

    final userId = ref.read(authProvider).userId ?? 'anon';
    final prevSets = await repo.getPreviousSessionSets(exercise.id, userId);

    state = state.copyWith(
      exercises: [
        ...state.exercises,
        ActiveExercise(
          workoutExerciseId: weId,
          exerciseId: exercise.id,
          exerciseName: exercise.name,
          sets: const [],
          previousSets: prevSets,
        ),
      ],
    );
  }

  Future<String> logSet(
    String workoutExerciseId,
    int reps,
    double weight, {
    String setType = 'working',
  }) async {
    final exIdx = state.exercises
        .indexWhere((e) => e.workoutExerciseId == workoutExerciseId);
    if (exIdx == -1) return '';

    final exercise = state.exercises[exIdx];
    final setNumber = exercise.sets.length + 1;
    final unit = state.preferredUnit;

    final placeholder = WorkoutSet(
      id: '',
      workoutExerciseId: workoutExerciseId,
      setNumber: setNumber,
      reps: reps,
      weight: weight,
      weightUnit: unit,
      setType: setType,
      completedAt: DateTime.now(),
    );

    final setId =
        await ref.read(workoutRepositoryProvider).logSet(workoutExerciseId, placeholder);

    final completedSet = WorkoutSet(
      id: setId,
      workoutExerciseId: workoutExerciseId,
      setNumber: setNumber,
      reps: reps,
      weight: weight,
      weightUnit: unit,
      setType: setType,
      completedAt: placeholder.completedAt,
    );

    final updated = List<ActiveExercise>.from(state.exercises);
    updated[exIdx] = exercise.copyWith(sets: [...exercise.sets, completedSet]);
    state = state.copyWith(exercises: updated);
    return setId;
  }

  Future<void> deleteSet(String workoutExerciseId, String setId) async {
    await ref.read(workoutRepositoryProvider).deleteSet(setId);

    final exIdx = state.exercises
        .indexWhere((e) => e.workoutExerciseId == workoutExerciseId);
    if (exIdx == -1) return;

    final exercise = state.exercises[exIdx];
    // Remove set and renumber remaining.
    final remaining = exercise.sets.where((s) => s.id != setId).toList();
    final renumbered = [
      for (var i = 0; i < remaining.length; i++)
        WorkoutSet(
          id: remaining[i].id,
          workoutExerciseId: workoutExerciseId,
          setNumber: i + 1,
          reps: remaining[i].reps,
          weight: remaining[i].weight,
          weightUnit: remaining[i].weightUnit,
          setType: remaining[i].setType,
          restSeconds: remaining[i].restSeconds,
          rpe: remaining[i].rpe,
          notes: remaining[i].notes,
          completedAt: remaining[i].completedAt,
        ),
    ];

    final updated = List<ActiveExercise>.from(state.exercises);
    updated[exIdx] = exercise.copyWith(sets: renumbered);
    state = state.copyWith(exercises: updated);
  }

  void startRest({int durationSeconds = 90}) {
    state = state.copyWith(
      restStartMs: DateTime.now().millisecondsSinceEpoch,
      restDurationSecs: durationSeconds,
    );
  }

  void stopRest() => state = state.copyWith(clearRest: true);

  /// Parses NL text, finds/adds the exercise, and logs the sets.
  /// Returns an error string on failure, or null on success.
  Future<String?> parseAndLog(String text) async {
    final parser = WorkoutParser(ref.read(gemmaServiceProvider));
    final parsed = await parser.parseNaturalLanguage(text.trim());
    if (parsed == null) return 'Could not understand that input.';

    final exName = parsed.exerciseName;
    final exercises = await ref
        .read(exerciseRepositoryProvider)
        .searchExercises(exName);
    if (exercises.isEmpty) {
      return 'Exercise "$exName" not found. Try adding it manually.';
    }

    final exercise = exercises.first;

    // Find the exercise in the current workout or add it.
    var activeEx = state.exercises.firstWhere(
      (e) => e.exerciseId == exercise.id,
      orElse: () => const ActiveExercise(
        workoutExerciseId: '',
        exerciseId: -1,
        exerciseName: '',
        sets: [],
      ),
    );

    if (activeEx.exerciseId == -1) {
      await addExercise(exercise);
      activeEx = state.exercises
          .firstWhere((e) => e.exerciseId == exercise.id);
    }

    final setsCount = parsed.sets ?? 1;
    final reps = parsed.reps ?? 0;
    final weight = parsed.weight ?? 0.0;
    final setType = parsed.setType ?? 'working';

    for (var i = 0; i < setsCount; i++) {
      await logSet(activeEx.workoutExerciseId, reps, weight, setType: setType);
    }

    return null;
  }

  Future<void> end() async {
    final id = state.workoutId;
    if (id == null) return;

    final repo = ref.read(workoutRepositoryProvider);
    await repo.updateWorkout(id, totalVolumeKg: state.totalVolumeKg);
    await repo.endWorkout(id);

    state = WorkoutState(preferredUnit: state.preferredUnit);
  }
}
