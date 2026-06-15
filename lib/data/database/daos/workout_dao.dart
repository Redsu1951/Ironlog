import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../app_database.dart';
import '../tables/workouts_table.dart';

part 'workout_dao.g.dart';

/// Workout session access. Signatures per CLAUDE.md §8.
@DriftAccessor(tables: [Workouts])
class WorkoutDao extends DatabaseAccessor<AppDatabase> with _$WorkoutDaoMixin {
  WorkoutDao(super.db);

  static const _uuid = Uuid();

  /// Inserts a workout, generating a UUID when the companion omits `id`.
  /// Returns the workout's id.
  Future<String> createWorkout(WorkoutsCompanion workout) async {
    final id = workout.id.present ? workout.id.value : _uuid.v4();
    await into(workouts).insert(workout.copyWith(id: Value(id)));
    return id;
  }

  Future<void> updateWorkout(WorkoutsCompanion workout) async {
    assert(workout.id.present, 'updateWorkout requires id');
    await (update(workouts)..where((t) => t.id.equals(workout.id.value)))
        .write(workout);
  }

  Future<WorkoutData?> getWorkoutById(String id) {
    return (select(workouts)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<WorkoutData>> getRecentWorkouts({int limit = 20}) {
    return (select(workouts)
          ..orderBy([
            (t) => OrderingTerm(expression: t.startedAt, mode: OrderingMode.desc),
          ])
          ..limit(limit))
        .get();
  }

  Future<List<WorkoutData>> getWorkoutsByDateRange(
      DateTime start, DateTime end) {
    return (select(workouts)
          ..where((t) => t.startedAt.isBetweenValues(
              start.millisecondsSinceEpoch, end.millisecondsSinceEpoch))
          ..orderBy([
            (t) => OrderingTerm(expression: t.startedAt, mode: OrderingMode.desc),
          ]))
        .get();
  }

  /// Number of *consecutive* most-recent ad-hoc (planless) workouts. Drives the
  /// plan-suggestion nudge once it reaches 3 (CLAUDE.md §12).
  Future<int> getAdHocWorkoutCount() async {
    final recent = await (select(workouts)
          ..orderBy([
            (t) => OrderingTerm(expression: t.startedAt, mode: OrderingMode.desc),
          ]))
        .get();
    var count = 0;
    for (final w in recent) {
      if (w.isAdHoc) {
        count++;
      } else {
        break;
      }
    }
    return count;
  }
}
