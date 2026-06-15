import 'package:drift/drift.dart';

/// Sets — one logged set. `weight` is stored in the user's preferred unit
/// (`weightUnit`). Volume = reps × weight per row (CLAUDE.md §12).
/// `@DataClassName('SetData')` avoids a clash with `dart:core`'s `Set`.
@DataClassName('SetData')
class Sets extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get workoutExerciseId => text()(); // FK → workout_exercises.id
  IntColumn get setNumber => integer()(); // 1-based
  IntColumn get reps => integer()();
  RealColumn get weight => real()(); // In user's preferred unit
  TextColumn get weightUnit => text()(); // 'kg' | 'lbs'
  TextColumn get setType => text().withDefault(const Constant('working'))();
  // setType: 'warmup' | 'working' | 'dropset' | 'amrap' | 'failure'
  IntColumn get restSeconds => integer().nullable()(); // Actual rest taken
  RealColumn get rpe => real().nullable()(); // Rate of Perceived Exertion 1-10
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get completedAt => integer()(); // Unix ms

  @override
  Set<Column> get primaryKey => {id};
}
