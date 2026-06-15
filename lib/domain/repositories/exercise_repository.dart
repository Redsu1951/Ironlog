import '../entities/exercise.dart';

abstract interface class ExerciseRepository {
  Future<List<Exercise>> getAllExercises();
  Future<List<Exercise>> searchExercises(String query);
  Future<List<Exercise>> getExercisesByMuscleGroup(int muscleGroupId);
  Future<Exercise?> getExerciseById(int id);
  Future<int> insertExercise(Exercise exercise);
}
