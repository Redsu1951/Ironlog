import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../app_database.dart';
import '../tables/sets_table.dart';
import '../tables/workout_exercises_table.dart';
import '../tables/workouts_table.dart';

part 'sets_dao.g.dart';

/// Set-level access, including the "previous session" lookup that powers the
/// historical-context row on the active workout screen. Signatures per
/// CLAUDE.md §8.
@DriftAccessor(tables: [Sets, WorkoutExercises, Workouts])
class SetsDao extends DatabaseAccessor<AppDatabase> with _$SetsDaoMixin {
  SetsDao(super.db);

  static const _uuid = Uuid();

  Future<String> insertSet(SetsCompanion set) async {
    final id = set.id.present ? set.id.value : _uuid.v4();
    await into(sets).insert(set.copyWith(id: Value(id)));
    return id;
  }

  Future<void> updateSet(SetsCompanion set) async {
    assert(set.id.present, 'updateSet requires id');
    await (update(sets)..where((t) => t.id.equals(set.id.value))).write(set);
  }

  Future<void> deleteSet(String id) async {
    await (delete(sets)..where((t) => t.id.equals(id))).go();
  }

  Future<List<SetData>> getSetsForWorkoutExercise(String workoutExerciseId) {
    return (select(sets)
          ..where((t) => t.workoutExerciseId.equals(workoutExerciseId))
          ..orderBy([(t) => OrderingTerm(expression: t.setNumber)]))
        .get();
  }

  /// Sets from the most recent *completed* workout in which [exerciseId] appears
  /// for [userId]. Returns an empty list if the exercise has no prior session.
  Future<List<SetData>> getPreviousSessionSets(
      int exerciseId, String userId) async {
    final query = select(workoutExercises).join([
      innerJoin(
          workouts, workouts.id.equalsExp(workoutExercises.workoutId)),
    ])
      ..where(workoutExercises.exerciseId.equals(exerciseId) &
          workouts.userId.equals(userId) &
          workouts.endedAt.isNotNull())
      ..orderBy([
        OrderingTerm(expression: workouts.startedAt, mode: OrderingMode.desc),
      ])
      ..limit(1);

    final row = await query.getSingleOrNull();
    if (row == null) return [];
    final we = row.readTable(workoutExercises);

    return (select(sets)
          ..where((t) => t.workoutExerciseId.equals(we.id))
          ..orderBy([(t) => OrderingTerm(expression: t.setNumber)]))
        .get();
  }
}
