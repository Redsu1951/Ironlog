import 'package:drift/drift.dart';

/// Goals — user targets (volume/reps/bodyweight/measurement). See CLAUDE.md §7.
@DataClassName('GoalData')
class Goals extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get userId => text()();
  TextColumn get type =>
      text()(); // 'volume'|'reps'|'bodyweight'|'measurement'
  TextColumn get description => text()();
  RealColumn get targetValue => real()();
  RealColumn get currentValue => real().withDefault(const Constant(0.0))();
  IntColumn get exerciseId => integer().nullable()();
  IntColumn get muscleGroupId => integer().nullable()();
  IntColumn get deadline => integer().nullable()(); // Unix ms
  IntColumn get createdAt => integer()();
  IntColumn get achievedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
