// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sets_dao.dart';

// ignore_for_file: type=lint
mixin _$SetsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SetsTable get sets => attachedDatabase.sets;
  $WorkoutExercisesTable get workoutExercises =>
      attachedDatabase.workoutExercises;
  $WorkoutsTable get workouts => attachedDatabase.workouts;
  SetsDaoManager get managers => SetsDaoManager(this);
}

class SetsDaoManager {
  final _$SetsDaoMixin _db;
  SetsDaoManager(this._db);
  $$SetsTableTableManager get sets =>
      $$SetsTableTableManager(_db.attachedDatabase, _db.sets);
  $$WorkoutExercisesTableTableManager get workoutExercises =>
      $$WorkoutExercisesTableTableManager(
          _db.attachedDatabase, _db.workoutExercises);
  $$WorkoutsTableTableManager get workouts =>
      $$WorkoutsTableTableManager(_db.attachedDatabase, _db.workouts);
}
