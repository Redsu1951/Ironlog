/// kg ↔ lbs conversion helpers.
abstract final class UnitConverter {
  static const double _kgToLbs = 2.20462;
  static const double _lbsToKg = 0.453592;

  static double kgToLbs(double kg) => kg * _kgToLbs;
  static double lbsToKg(double lbs) => lbs * _lbsToKg;

  /// Convert [kg] value to the user's preferred unit.
  static double toPreferred(double kg, String unit) =>
      unit == 'lbs' ? kgToLbs(kg) : kg;

  /// Convert a value in [unit] to kg.
  static double toKg(double value, String unit) =>
      unit == 'lbs' ? lbsToKg(value) : value;
}
