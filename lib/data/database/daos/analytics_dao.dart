import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/exercises_table.dart';
import '../tables/muscle_groups_table.dart';
import '../tables/sets_table.dart';
import '../tables/workout_exercises_table.dart';
import '../tables/workouts_table.dart';

part 'analytics_dao.g.dart';

/// A single (date, volume) sample for charting.
class VolumeDataPoint {
  const VolumeDataPoint({required this.date, required this.totalVolume});
  final DateTime date;
  final double totalVolume;
}

/// One week's volume, with a per-muscle-group breakdown.
class WeeklyVolumeSummary {
  const WeeklyVolumeSummary({
    required this.weekStart,
    required this.volume,
    required this.byMuscleGroup,
  });
  final DateTime weekStart;
  final double volume;
  final Map<String, double> byMuscleGroup;
}

/// Read-only analytics aggregations. Volume = reps × weight summed over set rows
/// (never one-rep-max — CLAUDE.md §4/§12). Signatures per CLAUDE.md §8.
@DriftAccessor(
    tables: [Workouts, WorkoutExercises, Sets, Exercises, MuscleGroups])
class AnalyticsDao extends DatabaseAccessor<AppDatabase>
    with _$AnalyticsDaoMixin {
  AnalyticsDao(super.db);

  /// Per-session volume for a muscle group (by primary muscle) over a window.
  Future<List<VolumeDataPoint>> getVolumeByMuscleGroup(
      int muscleGroupId, DateTime start, DateTime end) async {
    final rows = await customSelect(
      '''
      SELECT w.started_at AS started_at, SUM(s.reps * s.weight) AS vol
      FROM sets s
      JOIN workout_exercises we ON we.id = s.workout_exercise_id
      JOIN workouts w ON w.id = we.workout_id
      JOIN exercises e ON e.id = we.exercise_id
      WHERE e.primary_muscle_id = ?
        AND w.started_at BETWEEN ? AND ?
      GROUP BY w.id
      ORDER BY w.started_at ASC
      ''',
      variables: [
        Variable.withInt(muscleGroupId),
        Variable.withInt(start.millisecondsSinceEpoch),
        Variable.withInt(end.millisecondsSinceEpoch),
      ],
      readsFrom: {sets, workoutExercises, workouts, exercises},
    ).get();
    return rows.map(_toPoint).toList();
  }

  /// Per-session volume history for a single exercise (most-recent [limit]
  /// sessions, returned oldest→newest for charting).
  Future<List<VolumeDataPoint>> getExerciseVolumeHistory(int exerciseId,
      {int limit = 52}) async {
    final rows = await customSelect(
      '''
      SELECT w.started_at AS started_at, SUM(s.reps * s.weight) AS vol
      FROM sets s
      JOIN workout_exercises we ON we.id = s.workout_exercise_id
      JOIN workouts w ON w.id = we.workout_id
      WHERE we.exercise_id = ?
      GROUP BY w.id
      ORDER BY w.started_at DESC
      LIMIT ?
      ''',
      variables: [Variable.withInt(exerciseId), Variable.withInt(limit)],
      readsFrom: {sets, workoutExercises, workouts},
    ).get();
    return rows.reversed.map(_toPoint).toList();
  }

  /// Total body volume across all sets in a window.
  Future<double> getTotalBodyVolume(DateTime start, DateTime end) async {
    final row = await customSelect(
      '''
      SELECT COALESCE(SUM(s.reps * s.weight), 0.0) AS vol
      FROM sets s
      JOIN workout_exercises we ON we.id = s.workout_exercise_id
      JOIN workouts w ON w.id = we.workout_id
      WHERE w.started_at BETWEEN ? AND ?
      ''',
      variables: [
        Variable.withInt(start.millisecondsSinceEpoch),
        Variable.withInt(end.millisecondsSinceEpoch),
      ],
      readsFrom: {sets, workoutExercises, workouts},
    ).getSingle();
    return row.read<double>('vol');
  }

  /// Weekly volume buckets (last [weeks] weeks), each with a per-muscle-group
  /// breakdown. Bucketed by ISO week (Monday 00:00) in Dart.
  Future<List<WeeklyVolumeSummary>> getWeeklyVolumeTrend(
      {int weeks = 12}) async {
    final cutoff = _weekStart(DateTime.now())
        .subtract(Duration(days: 7 * (weeks - 1)));
    final rows = await customSelect(
      '''
      SELECT w.started_at AS started_at,
             (s.reps * s.weight) AS vol,
             mg.name AS muscle
      FROM sets s
      JOIN workout_exercises we ON we.id = s.workout_exercise_id
      JOIN workouts w ON w.id = we.workout_id
      JOIN exercises e ON e.id = we.exercise_id
      JOIN muscle_groups mg ON mg.id = e.primary_muscle_id
      WHERE w.started_at >= ?
      ''',
      variables: [Variable.withInt(cutoff.millisecondsSinceEpoch)],
      readsFrom: {sets, workoutExercises, workouts, exercises, muscleGroups},
    ).get();

    // Aggregate into week buckets.
    final mutable = <int, Map<String, double>>{};
    final totals = <int, double>{};
    for (final r in rows) {
      final ts = r.read<int>('started_at');
      final vol = r.read<double>('vol');
      final muscle = r.read<String>('muscle');
      final wkStart =
          _weekStart(DateTime.fromMillisecondsSinceEpoch(ts));
      final key = wkStart.millisecondsSinceEpoch;
      totals[key] = (totals[key] ?? 0) + vol;
      final byMg = mutable.putIfAbsent(key, () => {});
      byMg[muscle] = (byMg[muscle] ?? 0) + vol;
    }

    // Emit a row for every week in the window, including empty ones.
    final result = <WeeklyVolumeSummary>[];
    for (var i = 0; i < weeks; i++) {
      final wkStart = cutoff.add(Duration(days: 7 * i));
      final key = wkStart.millisecondsSinceEpoch;
      result.add(WeeklyVolumeSummary(
        weekStart: wkStart,
        volume: totals[key] ?? 0,
        byMuscleGroup: mutable[key] ?? const {},
      ));
    }
    return result;
  }

  VolumeDataPoint _toPoint(QueryRow r) => VolumeDataPoint(
        date: DateTime.fromMillisecondsSinceEpoch(r.read<int>('started_at')),
        totalVolume: r.read<double>('vol'),
      );

  /// Monday 00:00 of the week containing [d] (local time).
  static DateTime _weekStart(DateTime d) {
    final day = DateTime(d.year, d.month, d.day);
    return day.subtract(Duration(days: day.weekday - 1));
  }
}
