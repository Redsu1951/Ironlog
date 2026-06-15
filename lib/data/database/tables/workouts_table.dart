import 'package:drift/drift.dart';

/// Workouts — a single training session. `isAdHoc` drives the plan-nudge
/// threshold (CLAUDE.md §12). See CLAUDE.md §7.
@DataClassName('WorkoutData')
class Workouts extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get userId => text()(); // FK → users.id
  TextColumn get planId => text().nullable()(); // FK → workout_plans.id
  IntColumn get planDayId => integer().nullable()(); // FK → workout_plan_days.id
  TextColumn get name => text()();
  IntColumn get startedAt => integer()(); // Unix ms
  IntColumn get endedAt => integer().nullable()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  RealColumn get totalVolumeKg =>
      real().withDefault(const Constant(0.0))();
  BoolColumn get isAdHoc => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
