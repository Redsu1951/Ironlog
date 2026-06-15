import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/database/daos/analytics_dao.dart';
import '../../data/datasources/local/database_helper.dart';
import '../../data/repositories/workout_repository_impl.dart';
import '../../domain/entities/workout.dart';

part 'analytics_provider.g.dart';

class AnalyticsSummary {
  const AnalyticsSummary({
    required this.weeklyVolume,
    required this.trend,
  });

  final double weeklyVolume;
  final List<WeeklyVolumeSummary> trend;
}

@riverpod
class AnalyticsNotifier extends _$AnalyticsNotifier {
  @override
  Future<AnalyticsSummary> build() async {
    final db = ref.read(appDatabaseProvider);
    final now = DateTime.now();
    final weekStart = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 7));

    final volume =
        await db.analyticsDao.getTotalBodyVolume(weekStart, weekEnd);
    final trend = await db.analyticsDao.getWeeklyVolumeTrend();
    return AnalyticsSummary(weeklyVolume: volume, trend: trend);
  }

  void refresh() => ref.invalidateSelf();
}

/// Volume history for a single exercise (family provider).
@riverpod
Future<List<VolumeDataPoint>> exerciseVolumeHistory(
    Ref ref, int exerciseId) async {
  return ref
      .read(appDatabaseProvider)
      .analyticsDao
      .getExerciseVolumeHistory(exerciseId);
}

/// Recent 50 workouts for the history screen.
@riverpod
Future<List<Workout>> workoutHistory(Ref ref) {
  return ref.read(workoutRepositoryProvider).getRecentWorkouts(limit: 50);
}
