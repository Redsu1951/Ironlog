// Pure Dart — zero Flutter / Firebase imports (CLAUDE.md §6).
// Volume = reps × weight (never one-rep-max — CLAUDE.md §4/§12).
class WorkoutSet {
  const WorkoutSet({
    required this.id,
    required this.workoutExerciseId,
    required this.setNumber,
    required this.reps,
    required this.weight,
    required this.weightUnit,
    required this.completedAt,
    this.setType = 'working',
    this.restSeconds,
    this.rpe,
    this.notes = '',
  });

  final String id;
  final String workoutExerciseId;
  final int setNumber;
  final int reps;
  final double weight;
  final String weightUnit;
  final String setType;
  final int? restSeconds;
  final double? rpe;
  final String notes;
  final DateTime completedAt;

  // Volume = reps × weight (CLAUDE.md §4).
  double get volume => reps * weight;

  @override
  bool operator ==(Object other) => other is WorkoutSet && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
