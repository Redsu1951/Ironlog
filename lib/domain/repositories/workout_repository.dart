import '../entities/workout.dart';
import '../entities/workout_set.dart';

abstract interface class WorkoutRepository {
  Future<String> createWorkout(
    String userId,
    String name, {
    String? planId,
    int? planDayId,
    bool isAdHoc,
  });
  Future<void> endWorkout(String workoutId);
  Future<void> updateWorkout(String workoutId, {String? notes, double? totalVolumeKg});
  Future<Workout?> getWorkoutById(String id);
  Future<List<Workout>> getRecentWorkouts({int limit});
  Future<List<Workout>> getWorkoutsByDateRange(DateTime start, DateTime end);
  Future<int> getAdHocWorkoutCount();

  Future<String> addExerciseToWorkout(String workoutId, int exerciseId, int orderIndex);

  Future<String> logSet(String workoutExerciseId, WorkoutSet set);
  Future<void> updateSet(WorkoutSet set);
  Future<void> deleteSet(String setId);
  Future<List<WorkoutSet>> getSetsForExercise(String workoutExerciseId);
  Future<List<WorkoutSet>> getPreviousSessionSets(int exerciseId, String userId);
}
