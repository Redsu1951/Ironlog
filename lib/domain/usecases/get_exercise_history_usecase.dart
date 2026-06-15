import '../entities/workout_set.dart';
import '../repositories/workout_repository.dart';

/// Returns the sets from the most recent completed workout where this exercise
/// appeared — used to show previous-session context while logging (CLAUDE.md §12).
class GetExerciseHistoryUseCase {
  const GetExerciseHistoryUseCase(this._repository);
  final WorkoutRepository _repository;

  Future<List<WorkoutSet>> call(int exerciseId, String userId) =>
      _repository.getPreviousSessionSets(exerciseId, userId);
}
