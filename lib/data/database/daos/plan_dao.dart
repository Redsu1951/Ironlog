import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../app_database.dart';
import '../tables/workout_plan_days_table.dart';
import '../tables/workout_plans_table.dart';

part 'plan_dao.g.dart';

/// Workout-plan access. Signatures per CLAUDE.md §8.
@DriftAccessor(tables: [WorkoutPlans, WorkoutPlanDays])
class PlanDao extends DatabaseAccessor<AppDatabase> with _$PlanDaoMixin {
  PlanDao(super.db);

  static const _uuid = Uuid();

  Future<WorkoutPlanData?> getActivePlan() {
    return (select(workoutPlans)..where((t) => t.isActive.equals(true)))
        .getSingleOrNull();
  }

  /// Activates [planId] and deactivates all others, atomically.
  Future<void> setActivePlan(String planId) async {
    await transaction(() async {
      await (update(workoutPlans)
            ..where((t) => t.isActive.equals(true)))
          .write(const WorkoutPlansCompanion(isActive: Value(false)));
      await (update(workoutPlans)..where((t) => t.id.equals(planId)))
          .write(const WorkoutPlansCompanion(isActive: Value(true)));
    });
  }

  Future<String> createPlan(WorkoutPlansCompanion plan) async {
    final id = plan.id.present ? plan.id.value : _uuid.v4();
    await into(workoutPlans).insert(plan.copyWith(id: Value(id)));
    return id;
  }

  /// The plan day matching today's weekday (0=Monday … 6=Sunday).
  Future<WorkoutPlanDayData?> getPlanDayForToday(String planId) {
    final todayDow = DateTime.now().weekday - 1; // 1=Mon..7=Sun → 0..6
    return (select(workoutPlanDays)
          ..where((t) => t.planId.equals(planId) & t.dayOfWeek.equals(todayDow)))
        .getSingleOrNull();
  }

  Future<List<WorkoutPlanDayData>> getDaysForPlan(String planId) {
    return (select(workoutPlanDays)
          ..where((t) => t.planId.equals(planId))
          ..orderBy([(t) => OrderingTerm(expression: t.dayOfWeek)]))
        .get();
  }
}
