// Single source of truth for the volume formula (CLAUDE.md §4/§12).
// Volume = Sets × Reps × Weight — never one-rep-max.
abstract final class VolumeCalculator {
  static double calculate(int sets, int reps, double weight) =>
      sets * reps * weight;
}
