import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/exercise_repository_impl.dart';
import '../../domain/entities/exercise.dart';

part 'exercise_provider.g.dart';

/// Manages the exercise catalogue list displayed in ExercisePickerScreen.
/// Works with domain Exercise entities (not raw Drift ExerciseData).
@riverpod
class ExerciseNotifier extends _$ExerciseNotifier {
  @override
  Future<List<Exercise>> build() async {
    return ref.read(exerciseRepositoryProvider).getAllExercises();
  }

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      state = AsyncData(
          await ref.read(exerciseRepositoryProvider).getAllExercises());
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(exerciseRepositoryProvider).searchExercises(query));
  }

  Future<void> filterByMuscle(int muscleGroupId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref
        .read(exerciseRepositoryProvider)
        .getExercisesByMuscleGroup(muscleGroupId));
  }

  void reset() => ref.invalidateSelf();
}
