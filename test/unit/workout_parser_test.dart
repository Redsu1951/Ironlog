import 'package:flutter_test/flutter_test.dart';
import 'package:ironlog/ai/gemma_service.dart';
import 'package:ironlog/ai/workout_parser.dart';

/// Phase 4 validation: the regex fallback parses the formats from CLAUDE.md
/// §4/§17 with the model absent (GemmaService uninitialised → always fallback).
void main() {
  final parser = WorkoutParser(GemmaService());

  test('"I did 3 sets of 12 reps squats with 135 pounds"', () async {
    final r = await parser.parseNaturalLanguage(
        'I did 3 sets of 12 reps squats with 135 pounds');
    expect(r, isNotNull);
    expect(r!.exerciseName, 'Squats');
    expect(r.sets, 3);
    expect(r.reps, 12);
    expect(r.weight, 135);
    expect(r.weightUnit, 'lbs');
    expect(r.isRegexFallback, isTrue);
  });

  test('"bench press 3x8 at 225" (no unit → lbs default)', () async {
    final r = await parser.parseNaturalLanguage('bench press 3x8 at 225');
    expect(r!.exerciseName, 'Bench Press');
    expect(r.sets, 3);
    expect(r.reps, 8);
    expect(r.weight, 225);
    expect(r.weightUnit, 'lbs');
  });

  test('"bench press 3x8 at 100kg" (metric)', () async {
    final r = await parser.parseNaturalLanguage('bench press 3x8 at 100kg');
    expect(r!.weight, 100);
    expect(r.weightUnit, 'kg');
  });

  test('"did 4 sets of 10 deadlifts with 315"', () async {
    final r = await parser
        .parseNaturalLanguage('did 4 sets of 10 deadlifts with 315');
    expect(r!.exerciseName, 'Deadlifts');
    expect(r.sets, 4);
    expect(r.reps, 10);
    expect(r.weight, 315);
  });

  test('"15 reps bench press 215 lbs 2 sets" (reps/sets in any order)',
      () async {
    final r = await parser
        .parseNaturalLanguage('15 reps bench press 215 lbs 2 sets');
    expect(r!.exerciseName, 'Bench Press');
    expect(r.reps, 15);
    expect(r.sets, 2);
    expect(r.weight, 215);
    expect(r.weightUnit, 'lbs');
  });

  test('detects set type keyword', () async {
    final r =
        await parser.parseNaturalLanguage('incline bench press 3x10 warmup');
    expect(r!.setType, 'warmup');
    expect(r.exerciseName, 'Incline Bench Press');
  });

  test('empty input returns null', () async {
    expect(await parser.parseNaturalLanguage('   '), isNull);
  });
}
