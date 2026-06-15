import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/database/app_database.dart';
import '../../data/database/daos/exercise_dao.dart';
import '../../data/datasources/local/database_helper.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/repositories/exercise_repository.dart';

part 'exercise_repository_impl.g.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  const ExerciseRepositoryImpl(this._dao);
  final ExerciseDao _dao;

  @override
  Future<List<Exercise>> getAllExercises() async =>
      (await _dao.getAllExercises()).map(_toEntity).toList();

  @override
  Future<List<Exercise>> searchExercises(String query) async =>
      (await _dao.searchExercises(query)).map(_toEntity).toList();

  @override
  Future<List<Exercise>> getExercisesByMuscleGroup(int muscleGroupId) async =>
      (await _dao.getExercisesByMuscleGroup(muscleGroupId))
          .map(_toEntity)
          .toList();

  @override
  Future<Exercise?> getExerciseById(int id) async {
    final d = await _dao.getExerciseById(id);
    return d == null ? null : _toEntity(d);
  }

  @override
  Future<int> insertExercise(Exercise exercise) {
    return _dao.insertExercise(ExercisesCompanion.insert(
      name: exercise.name,
      primaryMuscleId: exercise.primaryMuscleId,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      wgerId: Value(exercise.wgerId),
      description: Value(exercise.description),
      secondaryMuscleIds:
          Value(jsonEncode(exercise.secondaryMuscleIds)),
      equipment: Value(jsonEncode(exercise.equipment)),
      category: Value(exercise.category),
      isCustom: Value(exercise.isCustom),
      instructions: Value(exercise.instructions),
      aliases: Value(jsonEncode(exercise.aliases)),
    ));
  }

  static Exercise _toEntity(ExerciseData d) => Exercise(
        id: d.id,
        wgerId: d.wgerId,
        name: d.name,
        description: d.description,
        primaryMuscleId: d.primaryMuscleId,
        secondaryMuscleIds:
            (jsonDecode(d.secondaryMuscleIds) as List).cast<int>(),
        equipment: (jsonDecode(d.equipment) as List).cast<String>(),
        category: d.category,
        isCustom: d.isCustom,
        instructions: d.instructions,
        aliases: (jsonDecode(d.aliases) as List).cast<String>(),
      );
}

@riverpod
ExerciseRepository exerciseRepository(Ref ref) {
  return ExerciseRepositoryImpl(ref.read(appDatabaseProvider).exerciseDao);
}
