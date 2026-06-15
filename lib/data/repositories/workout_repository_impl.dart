import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/datasources/local/database_helper.dart';
import '../../domain/entities/workout.dart';
import '../../domain/entities/workout_set.dart';
import '../../domain/repositories/workout_repository.dart';

part 'workout_repository_impl.g.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  WorkoutRepositoryImpl(this._db);
  final AppDatabase _db;

  static const _uuid = Uuid();

  @override
  Future<String> createWorkout(
    String userId,
    String name, {
    String? planId,
    int? planDayId,
    bool isAdHoc = false,
  }) {
    // Use unnamed WorkoutsCompanion constructor — the DAO fills in the UUID.
    return _db.workoutDao.createWorkout(WorkoutsCompanion(
      userId: Value(userId),
      name: Value(name),
      startedAt: Value(DateTime.now().millisecondsSinceEpoch),
      planId: Value(planId),
      planDayId: Value(planDayId),
      isAdHoc: Value(isAdHoc),
    ));
  }

  @override
  Future<void> endWorkout(String workoutId) => _db.workoutDao.updateWorkout(
        WorkoutsCompanion(
          id: Value(workoutId),
          endedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );

  @override
  Future<void> updateWorkout(String workoutId,
      {String? notes, double? totalVolumeKg}) {
    return _db.workoutDao.updateWorkout(WorkoutsCompanion(
      id: Value(workoutId),
      notes: notes != null ? Value(notes) : const Value.absent(),
      totalVolumeKg:
          totalVolumeKg != null ? Value(totalVolumeKg) : const Value.absent(),
    ));
  }

  @override
  Future<Workout?> getWorkoutById(String id) async {
    final d = await _db.workoutDao.getWorkoutById(id);
    return d == null ? null : _toEntity(d);
  }

  @override
  Future<List<Workout>> getRecentWorkouts({int limit = 20}) async =>
      (await _db.workoutDao.getRecentWorkouts(limit: limit))
          .map(_toEntity)
          .toList();

  @override
  Future<List<Workout>> getWorkoutsByDateRange(
          DateTime start, DateTime end) async =>
      (await _db.workoutDao.getWorkoutsByDateRange(start, end))
          .map(_toEntity)
          .toList();

  @override
  Future<int> getAdHocWorkoutCount() => _db.workoutDao.getAdHocWorkoutCount();

  @override
  Future<String> addExerciseToWorkout(
      String workoutId, int exerciseId, int orderIndex) async {
    final id = _uuid.v4();
    await _db.into(_db.workoutExercises).insert(
          WorkoutExercisesCompanion.insert(
            id: id,
            workoutId: workoutId,
            exerciseId: exerciseId,
            orderIndex: orderIndex,
          ),
        );
    return id;
  }

  @override
  Future<String> logSet(String workoutExerciseId, WorkoutSet set) {
    return _db.setsDao.insertSet(SetsCompanion(
      workoutExerciseId: Value(workoutExerciseId),
      setNumber: Value(set.setNumber),
      reps: Value(set.reps),
      weight: Value(set.weight),
      weightUnit: Value(set.weightUnit),
      setType: Value(set.setType),
      restSeconds: Value(set.restSeconds),
      rpe: Value(set.rpe),
      notes: Value(set.notes),
      completedAt: Value(set.completedAt.millisecondsSinceEpoch),
    ));
  }

  @override
  Future<void> updateSet(WorkoutSet set) => _db.setsDao.updateSet(SetsCompanion(
        id: Value(set.id),
        reps: Value(set.reps),
        weight: Value(set.weight),
        weightUnit: Value(set.weightUnit),
        setType: Value(set.setType),
        restSeconds: Value(set.restSeconds),
        rpe: Value(set.rpe),
        notes: Value(set.notes),
      ));

  @override
  Future<void> deleteSet(String setId) => _db.setsDao.deleteSet(setId);

  @override
  Future<List<WorkoutSet>> getSetsForExercise(String workoutExerciseId) async =>
      (await _db.setsDao.getSetsForWorkoutExercise(workoutExerciseId))
          .map(_setToEntity)
          .toList();

  @override
  Future<List<WorkoutSet>> getPreviousSessionSets(
          int exerciseId, String userId) async =>
      (await _db.setsDao.getPreviousSessionSets(exerciseId, userId))
          .map(_setToEntity)
          .toList();

  static Workout _toEntity(WorkoutData d) => Workout(
        id: d.id,
        userId: d.userId,
        planId: d.planId,
        planDayId: d.planDayId,
        name: d.name,
        startedAt: DateTime.fromMillisecondsSinceEpoch(d.startedAt),
        endedAt: d.endedAt != null
            ? DateTime.fromMillisecondsSinceEpoch(d.endedAt!)
            : null,
        notes: d.notes,
        totalVolumeKg: d.totalVolumeKg,
        isAdHoc: d.isAdHoc,
      );

  static WorkoutSet _setToEntity(SetData d) => WorkoutSet(
        id: d.id,
        workoutExerciseId: d.workoutExerciseId,
        setNumber: d.setNumber,
        reps: d.reps,
        weight: d.weight,
        weightUnit: d.weightUnit,
        setType: d.setType,
        restSeconds: d.restSeconds,
        rpe: d.rpe,
        notes: d.notes,
        completedAt: DateTime.fromMillisecondsSinceEpoch(d.completedAt),
      );
}

@riverpod
WorkoutRepository workoutRepository(Ref ref) =>
    WorkoutRepositoryImpl(ref.read(appDatabaseProvider));
