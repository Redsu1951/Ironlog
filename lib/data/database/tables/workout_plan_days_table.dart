import 'package:drift/drift.dart';

/// WorkoutPlanDays — one row per day-of-week within a plan. See CLAUDE.md §7.
@DataClassName('WorkoutPlanDayData')
class WorkoutPlanDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get planId => text()(); // FK → workout_plans.id
  IntColumn get dayOfWeek => integer()(); // 0=Monday, 6=Sunday
  TextColumn get name => text()(); // e.g. 'Chest & Triceps'
  TextColumn get muscleGroupIds =>
      text().withDefault(const Constant('[]'))(); // JSON int array
  BoolColumn get isRestDay => boolean().withDefault(const Constant(false))();
}
