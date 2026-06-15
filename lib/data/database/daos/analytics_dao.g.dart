// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_dao.dart';

// ignore_for_file: type=lint
mixin _$AnalyticsDaoMixin on DatabaseAccessor<AppDatabase> {
  $WorkoutsTable get workouts => attachedDatabase.workouts;
  $WorkoutExercisesTable get workoutExercises =>
      attachedDatabase.workoutExercises;
  $SetsTable get sets => attachedDatabase.sets;
  $ExercisesTable get exercises => attachedDatabase.exercises;
  $MuscleGroupsTable get muscleGroups => attachedDatabase.muscleGroups;
  AnalyticsDaoManager get managers => AnalyticsDaoManager(this);
}

class AnalyticsDaoManager {
  final _$AnalyticsDaoMixin _db;
  AnalyticsDaoManager(this._db);
  $$WorkoutsTableTableManager get workouts =>
      $$WorkoutsTableTableManager(_db.attachedDatabase, _db.workouts);
  $$WorkoutExercisesTableTableManager get workoutExercises =>
      $$WorkoutExercisesTableTableManager(
          _db.attachedDatabase, _db.workoutExercises);
  $$SetsTableTableManager get sets =>
      $$SetsTableTableManager(_db.attachedDatabase, _db.sets);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db.attachedDatabase, _db.exercises);
  $$MuscleGroupsTableTableManager get muscleGroups =>
      $$MuscleGroupsTableTableManager(_db.attachedDatabase, _db.muscleGroups);
}
