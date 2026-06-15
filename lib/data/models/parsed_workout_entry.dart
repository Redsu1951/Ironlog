import 'package:freezed_annotation/freezed_annotation.dart';

part 'parsed_workout_entry.freezed.dart';

/// Structured output of the workout NL parser (CLAUDE.md §4 Step 4.3).
/// `isRegexFallback` records whether this came from Gemma or the regex fallback.
@freezed
abstract class ParsedWorkoutEntry with _$ParsedWorkoutEntry {
  const factory ParsedWorkoutEntry({
    required String exerciseName,
    int? sets,
    int? reps,
    double? weight,
    String? weightUnit, // 'lbs' | 'kg'
    String? setType, // 'working' | 'warmup' | 'dropset' | 'amrap' | 'failure'
    required double confidence,
    required bool isRegexFallback,
  }) = _ParsedWorkoutEntry;
}
