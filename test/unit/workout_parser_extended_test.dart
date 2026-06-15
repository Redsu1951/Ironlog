import 'package:flutter_test/flutter_test.dart';
import 'package:ironlog/ai/gemma_service.dart';
import 'package:ironlog/ai/workout_parser.dart';

/// Extended regex-fallback tests covering voice-input phrasings, edge cases,
/// and the formats users actually say ("did bicep curls", "ohp", etc.).
/// All run without the Gemma model — GemmaService is uninitialized so the
/// regex path is always taken (isInitialized == false).
void main() {
  late WorkoutParser parser;

  setUp(() => parser = WorkoutParser(GemmaService()));

  // ── Basic formats (already in workout_parser_test.dart) ──────────────────

  test('canonical CLAUDE.md §17 phrase', () async {
    final r = await parser
        .parseNaturalLanguage('I did 3 sets of 12 reps squats with 135 pounds');
    expect(r, isNotNull);
    expect(r!.exerciseName, 'Squats');
    expect(r.sets, 3);
    expect(r.reps, 12);
    expect(r.weight, 135.0);
    expect(r.weightUnit, 'lbs');
    expect(r.isRegexFallback, isTrue);
  });

  test('"NxM at weight" shorthand', () async {
    final r = await parser.parseNaturalLanguage('overhead press 4x6 at 135');
    expect(r!.exerciseName, 'Overhead Press');
    expect(r.sets, 4);
    expect(r.reps, 6);
    expect(r.weight, 135.0);
  });

  test('"NxM weight unit" shorthand', () async {
    final r = await parser.parseNaturalLanguage('squat 5x5 100kg');
    expect(r!.sets, 5);
    expect(r.reps, 5);
    expect(r.weight, 100.0);
    expect(r.weightUnit, 'kg');
  });

  // ── Unit normalisation ───────────────────────────────────────────────────

  test('"kilogram" and "kg" both normalise to kg', () async {
    final a = await parser.parseNaturalLanguage('deadlift 3x5 100kg');
    final b = await parser.parseNaturalLanguage('deadlift 3x5 100 kilograms');
    expect(a!.weightUnit, 'kg');
    expect(b!.weightUnit, 'kg');
  });

  test('"pound", "pounds", "lb", "lbs" all normalise to lbs', () async {
    for (final u in ['pound', 'pounds', 'lb', 'lbs']) {
      final r = await parser.parseNaturalLanguage('bench press 3x8 225 $u');
      expect(r!.weightUnit, 'lbs',
          reason: 'unit "$u" should normalise to lbs');
    }
  });

  test('no unit defaults to lbs (CLAUDE.md §9)', () async {
    final r = await parser.parseNaturalLanguage('squat 3x8 at 200');
    expect(r!.weightUnit, 'lbs');
  });

  // ── Set type detection ───────────────────────────────────────────────────

  test('dropset detected', () async {
    final r =
        await parser.parseNaturalLanguage('chest fly dropset 3x15 30 lbs');
    expect(r!.setType, 'dropset');
  });

  test('amrap detected', () async {
    final r =
        await parser.parseNaturalLanguage('pull ups amrap bodyweight');
    expect(r!.setType, 'amrap');
  });

  test('failure detected', () async {
    final r = await parser.parseNaturalLanguage('curls to failure 25 lbs');
    expect(r!.setType, 'failure');
  });

  test('warm up (two words) detected', () async {
    final r =
        await parser.parseNaturalLanguage('bench press warm up 135 lbs 1x10');
    expect(r!.setType, 'warmup');
  });

  test('unspecified set type defaults to working', () async {
    final r = await parser.parseNaturalLanguage('squat 3x5 315');
    expect(r!.setType, 'working');
  });

  // ── Decimal weights ──────────────────────────────────────────────────────

  test('decimal weight parsed', () async {
    final r = await parser
        .parseNaturalLanguage('lateral raise 3x15 7.5 kg');
    expect(r!.weight, 7.5);
    expect(r.weightUnit, 'kg');
  });

  // ── No weight ────────────────────────────────────────────────────────────

  test('exercise name extracted even without weight', () async {
    final r = await parser.parseNaturalLanguage('pull ups 3 sets of 10');
    expect(r!.exerciseName, isNotNull);
    expect(r.sets, 3);
    expect(r.reps, 10);
    expect(r.weight, isNull);
  });

  // ── Voice phrasing quirks ────────────────────────────────────────────────

  test('"sets of N" fills reps when no explicit reps keyword', () async {
    final r = await parser
        .parseNaturalLanguage('bench press 4 sets of 8 at 185 lbs');
    expect(r!.sets, 4);
    expect(r.reps, 8);
  });

  test('reps before sets', () async {
    final r = await parser
        .parseNaturalLanguage('12 reps deadlift 315 lbs 3 sets');
    expect(r!.reps, 12);
    expect(r.sets, 3);
    expect(r.weight, 315.0);
  });

  // ── Edge cases ───────────────────────────────────────────────────────────

  test('whitespace-only input returns null', () async {
    expect(await parser.parseNaturalLanguage('   \t\n'), isNull);
  });

  test('numbers-only input returns null (no exercise name)', () async {
    expect(await parser.parseNaturalLanguage('3 8 135'), isNull);
  });

  test('confidence is 0.6 for regex fallback', () async {
    final r = await parser.parseNaturalLanguage('squat 3x5 315');
    expect(r!.confidence, 0.6);
  });

  // ── Multi-word exercise names ────────────────────────────────────────────

  test('incline dumbbell press parsed', () async {
    final r = await parser
        .parseNaturalLanguage('incline dumbbell press 3x12 50 lbs');
    expect(r!.exerciseName, isNotEmpty);
    expect(r.exerciseName.toLowerCase(), contains('incline'));
    expect(r.exerciseName.toLowerCase(), contains('press'));
  });

  test('romanian deadlift parsed', () async {
    final r = await parser
        .parseNaturalLanguage('romanian deadlift 3x10 at 135 lbs');
    expect(r!.exerciseName.toLowerCase(), contains('romanian'));
    expect(r.exerciseName.toLowerCase(), contains('deadlift'));
  });
}
