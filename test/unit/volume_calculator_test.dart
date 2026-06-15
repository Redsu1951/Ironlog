import 'package:flutter_test/flutter_test.dart';
import 'package:ironlog/core/utils/volume_calculator.dart';

void main() {
  group('VolumeCalculator.calculate', () {
    test('basic: 3 × 10 × 100 = 3000', () {
      expect(VolumeCalculator.calculate(3, 10, 100), 3000);
    });

    test('1 set × 1 rep × 1 weight = 1', () {
      expect(VolumeCalculator.calculate(1, 1, 1), 1);
    });

    test('zero reps gives 0', () {
      expect(VolumeCalculator.calculate(3, 0, 100), 0);
    });

    test('zero weight gives 0', () {
      expect(VolumeCalculator.calculate(4, 8, 0), 0);
    });

    test('decimal weight: 3 × 10 × 22.5 = 675', () {
      expect(VolumeCalculator.calculate(3, 10, 22.5), 675);
    });

    test('large numbers: 5 × 5 × 315 = 7875', () {
      expect(VolumeCalculator.calculate(5, 5, 315), 7875);
    });
  });
}
