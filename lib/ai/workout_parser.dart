import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/constants/ai_prompts.dart';
import '../data/models/parsed_workout_entry.dart';
import 'gemma_service.dart';

part 'workout_parser.g.dart';

/// Turns natural-language input ("3 sets of 12 squats with 135 lbs") into a
/// [ParsedWorkoutEntry]. Uses Gemma when loaded; otherwise — or when Gemma's
/// output is low-confidence/invalid — falls back to a regex parser so logging
/// always works offline (CLAUDE.md §3/§4).
class WorkoutParser {
  WorkoutParser(this._gemma);

  final GemmaService _gemma;

  static const double _minConfidence = 0.7;

  Future<ParsedWorkoutEntry?> parseNaturalLanguage(String input) async {
    final trimmed = input.trim();
    if (trimmed.isEmpty) return null;

    if (_gemma.isInitialized) {
      try {
        final raw = await _gemma.generate(
          AiPrompts.workoutParser(trimmed),
          maxTokens: 256,
        );
        final parsed = _parseJson(raw);
        if (parsed != null && parsed.confidence >= _minConfidence) {
          return parsed;
        }
      } catch (_) {
        // Fall through to the regex fallback on any model/JSON error.
      }
    }
    return _regexFallback(trimmed);
  }

  /// Extracts and validates the JSON object Gemma is asked to return.
  ParsedWorkoutEntry? _parseJson(String raw) {
    final start = raw.indexOf('{');
    final end = raw.lastIndexOf('}');
    if (start < 0 || end <= start) return null;
    try {
      final map = json.decode(raw.substring(start, end + 1));
      if (map is! Map<String, dynamic>) return null;
      final name = (map['exercise_name'] as String?)?.trim();
      if (name == null || name.isEmpty) return null;
      return ParsedWorkoutEntry(
        exerciseName: name,
        sets: (map['sets'] as num?)?.toInt(),
        reps: (map['reps'] as num?)?.toInt(),
        weight: (map['weight'] as num?)?.toDouble(),
        weightUnit: _normalizeUnit(map['weight_unit'] as String?),
        setType: (map['set_type'] as String?) ?? 'working',
        confidence: (map['confidence'] as num?)?.toDouble() ?? 0.0,
        isRegexFallback: false,
      );
    } catch (_) {
      return null;
    }
  }

  /// Regex parser for common phrasings:
  ///   "15 reps bench press 215 lbs 2 sets"
  ///   "bench press 3x8 at 100kg"
  ///   "did 4 sets of 10 deadlifts with 315"
  ///   "I did 3 sets of 12 reps squats with 135 pounds"
  ParsedWorkoutEntry? _regexFallback(String input) {
    final text = input.toLowerCase();

    int? sets;
    int? reps;
    double? weight;
    String? unit;

    // "3x8", "3 x 8", "3×8" → sets × reps.
    final nxn = RegExp(r'(\d+)\s*[x×]\s*(\d+)').firstMatch(text);
    if (nxn != null) {
      sets = int.parse(nxn.group(1)!);
      reps = int.parse(nxn.group(2)!);
    }

    // "N sets" / "N set".
    final setsM = RegExp(r'(\d+)\s*sets?\b').firstMatch(text);
    if (setsM != null) sets = int.parse(setsM.group(1)!);

    // "N reps" / "N rep".
    final repsM = RegExp(r'(\d+)\s*reps?\b').firstMatch(text);
    if (repsM != null) reps = int.parse(repsM.group(1)!);

    // "sets of N" supplies reps when not otherwise given.
    final setsOf = RegExp(r'sets?\s+of\s+(\d+)').firstMatch(text);
    if (setsOf != null) reps ??= int.parse(setsOf.group(1)!);

    // Weight with explicit unit.
    final wUnit =
        RegExp(r'(\d+(?:\.\d+)?)\s*(kgs?|kilograms?|lbs?|pounds?|pound)\b')
            .firstMatch(text);
    if (wUnit != null) {
      weight = double.parse(wUnit.group(1)!);
      unit = _normalizeUnit(wUnit.group(2));
    } else {
      // Weight after "with"/"at" without a unit.
      final wAt = RegExp(r'(?:with|at)\s+(\d+(?:\.\d+)?)').firstMatch(text);
      if (wAt != null) weight = double.parse(wAt.group(1)!);
    }
    unit ??= 'lbs'; // American default per CLAUDE.md §9.

    final setType = _detectSetType(text);
    final name = _extractExerciseName(text);
    if (name == null) return null;

    return ParsedWorkoutEntry(
      exerciseName: name,
      sets: sets,
      reps: reps,
      weight: weight,
      weightUnit: unit,
      setType: setType,
      confidence: 0.6,
      isRegexFallback: true,
    );
  }

  String _detectSetType(String text) {
    if (text.contains('warmup') ||
        text.contains('warm up') ||
        text.contains('warm-up')) {
      return 'warmup';
    }
    if (text.contains('dropset') || text.contains('drop set')) return 'dropset';
    if (text.contains('amrap')) return 'amrap';
    if (text.contains('failure')) return 'failure';
    return 'working';
  }

  /// Strips numbers, units, and stopwords, leaving the exercise name (title-cased).
  String? _extractExerciseName(String text) {
    const stop = {
      'x', 'set', 'sets', 'rep', 'reps', 'with', 'at', 'of', 'lb', 'lbs',
      'kg', 'kgs', 'kilogram', 'kilograms', 'pound', 'pounds', 'did', 'i',
      'for', 'the', 'a', 'an', 'and', 'warmup', 'warm', 'up', 'dropset',
      'drop', 'amrap', 'failure', 'to', 'my', 'some', 'then', 'do',
    };
    final words = text
        .replaceAll(RegExp(r'\d+(?:\.\d+)?'), ' ')
        .replaceAll(RegExp(r'[^a-z\s-]'), ' ')
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty && !stop.contains(w))
        .toList();
    if (words.isEmpty) return null;
    return words
        .map((w) => '${w[0].toUpperCase()}${w.substring(1)}')
        .join(' ');
  }

  String? _normalizeUnit(String? raw) {
    if (raw == null) return null;
    final r = raw.toLowerCase();
    if (r.startsWith('kg') || r.startsWith('kilogram')) return 'kg';
    if (r.startsWith('lb') || r.startsWith('pound')) return 'lbs';
    return null;
  }
}

/// AI parser bound to the shared GemmaService.
@riverpod
WorkoutParser workoutParser(Ref ref) {
  return WorkoutParser(ref.watch(gemmaServiceProvider));
}
