import '../entities/workout_set.dart';
import '../repositories/workout_repository.dart';

class LogSetUseCase {
  const LogSetUseCase(this._repository);
  final WorkoutRepository _repository;

  Future<String> call({
    required String workoutExerciseId,
    required int setNumber,
    required int reps,
    required double weight,
    required String weightUnit,
    String setType = 'working',
    int? restSeconds,
    double? rpe,
    String notes = '',
  }) {
    final set = WorkoutSet(
      id: '',
      workoutExerciseId: workoutExerciseId,
      setNumber: setNumber,
      reps: reps,
      weight: weight,
      weightUnit: weightUnit,
      setType: setType,
      restSeconds: restSeconds,
      rpe: rpe,
      notes: notes,
      completedAt: DateTime.now(),
    );
    return _repository.logSet(workoutExerciseId, set);
  }
}
