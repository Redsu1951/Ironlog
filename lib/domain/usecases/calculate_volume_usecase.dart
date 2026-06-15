import '../../core/utils/volume_calculator.dart';
import '../entities/workout_set.dart';

/// Thin domain wrapper around VolumeCalculator (CLAUDE.md §4/§12).
/// Volume = Sets × Reps × Weight — never one-rep-max.
class CalculateVolumeUseCase {
  const CalculateVolumeUseCase();

  double call(int sets, int reps, double weight) =>
      VolumeCalculator.calculate(sets, reps, weight);

  double fromSets(List<WorkoutSet> sets) =>
      sets.fold(0.0, (sum, s) => sum + s.volume);
}
