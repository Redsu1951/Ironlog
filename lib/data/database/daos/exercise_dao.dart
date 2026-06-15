import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/exercises_table.dart';
import '../tables/muscle_groups_table.dart';

part 'exercise_dao.g.dart';

/// Exercise catalogue access. Signatures per CLAUDE.md §8.
@DriftAccessor(tables: [Exercises, MuscleGroups])
class ExerciseDao extends DatabaseAccessor<AppDatabase>
    with _$ExerciseDaoMixin {
  ExerciseDao(super.db);

  Future<List<ExerciseData>> getAllExercises() {
    return (select(exercises)..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .get();
  }

  /// Case-insensitive match against name and the JSON `aliases` blob.
  Future<List<ExerciseData>> searchExercises(String query) {
    final q = '%${query.toLowerCase()}%';
    return (select(exercises)
          ..where((t) => t.name.lower().like(q) | t.aliases.lower().like(q))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .get();
  }

  /// Exercises whose primary muscle is [muscleGroupId]. (Secondary muscles are
  /// JSON-encoded; filtering on those happens in the repository layer.)
  Future<List<ExerciseData>> getExercisesByMuscleGroup(int muscleGroupId) {
    return (select(exercises)
          ..where((t) => t.primaryMuscleId.equals(muscleGroupId))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .get();
  }

  Future<ExerciseData?> getExerciseById(int id) {
    return (select(exercises)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertExercise(ExercisesCompanion exercise) {
    return into(exercises).insert(exercise);
  }

  Future<void> batchInsertExercises(List<ExercisesCompanion> rows) async {
    await batch((b) => b.insertAll(exercises, rows));
  }
}
