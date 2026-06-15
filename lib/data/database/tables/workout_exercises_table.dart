import 'package:drift/drift.dart';

/// WorkoutExercises — an exercise instance within a workout (ordered, may be
/// grouped into supersets). See CLAUDE.md §7.
@DataClassName('WorkoutExerciseData')
class WorkoutExercises extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get workoutId => text()(); // FK → workouts.id
  IntColumn get exerciseId => integer()(); // FK → exercises.id
  IntColumn get orderIndex => integer()(); // Position in workout
  IntColumn get supersetGroup => integer().nullable()(); // Groups supersets
  TextColumn get notes => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}
