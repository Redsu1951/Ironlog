import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/database/app_database.dart';
import '../../data/datasources/local/database_helper.dart';

part 'planner_provider.g.dart';

class ActivePlanSummary {
  const ActivePlanSummary({required this.plan, required this.days});
  final WorkoutPlanData? plan;
  final List<WorkoutPlanDayData> days;
}

/// Watches the active plan and its days.
@riverpod
Future<ActivePlanSummary> activePlan(Ref ref) async {
  final db = ref.read(appDatabaseProvider);
  final plan = await db.planDao.getActivePlan();
  if (plan == null) return const ActivePlanSummary(plan: null, days: []);
  final days = await db.planDao.getDaysForPlan(plan.id);
  return ActivePlanSummary(plan: plan, days: days);
}
