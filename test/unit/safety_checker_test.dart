import 'package:flutter_test/flutter_test.dart';
import 'package:ironlog/ai/gemma_service.dart';
import 'package:ironlog/ai/safety_checker.dart';

/// Phase 4 validation: the >15% week-over-week check is pure math, and the
/// warning message falls back to a template when Gemma is absent (CLAUDE.md §12).
void main() {
  const checker = SafetyChecker();

  SafetyResult check(double prev, double curr) => checker.checkVolumeIncrease(
        prevVolume: prev,
        newVolume: curr,
        muscleGroup: 'Chest',
        unit: 'kg',
      );

  test('>15% increase is flagged unsafe', () {
    final r = check(1000, 1200); // +20%
    expect(r.isSafe, isFalse);
    expect(r.percentageIncrease, 20);
  });

  test('exactly 15% is safe (boundary inclusive)', () {
    expect(check(1000, 1150).isSafe, isTrue);
  });

  test('<15% increase is safe', () {
    expect(check(1000, 1100).isSafe, isTrue);
  });

  test('no prior-week baseline is treated as safe', () {
    final r = check(0, 800);
    expect(r.isSafe, isTrue);
    expect(r.percentageIncrease, 0);
  });

  test('generateWarning returns null when safe', () async {
    final warning = await checker.generateWarning(check(1000, 1050), GemmaService());
    expect(warning, isNull);
  });

  test('generateWarning falls back to a numeric template when unsafe', () async {
    final warning =
        await checker.generateWarning(check(1000, 1300), GemmaService());
    expect(warning, isNotNull);
    expect(warning, contains('Chest'));
    expect(warning, contains('30%'));
  });
}
