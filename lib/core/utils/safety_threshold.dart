/// Shared math for week-over-week volume safety checks (CLAUDE.md §12).
/// The >15% rule is duplicated verbatim in SafetyChecker — never deviate.
abstract final class SafetyThreshold {
  /// Max safe week-over-week volume increase per muscle group (CLAUDE.md §12).
  static const double maxIncreasePercent = 15.0;

  /// Returns true when the increase from [prev] to [curr] is within limits.
  /// A zero [prev] baseline is always considered safe (first week).
  static bool isSafe(double prev, double curr) {
    if (prev <= 0) return true;
    return percentageIncrease(prev, curr) <= maxIncreasePercent;
  }

  /// Percentage increase from [prev] to [curr] (clamped ≥ 0).
  static double percentageIncrease(double prev, double curr) {
    if (prev <= 0) return 0;
    return ((curr - prev) / prev * 100).clamp(0.0, double.infinity);
  }
}
