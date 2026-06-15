/// ⚠️ ALL Gemma prompt templates live here and ONLY here (CLAUDE.md §4/§9).
/// Never define a prompt string anywhere else in the codebase.
abstract final class AiPrompts {
  /// Natural-language workout log → strict JSON. (WORKOUT_PARSER_PROMPT)
  static String workoutParser(String input) => '''
You are a gym log parser. Extract workout data from the user's natural language input.
Respond ONLY with a single valid JSON object. No explanation. No markdown. No preamble.

User input: "$input"

JSON schema (use null for unknown fields):
{
  "exercise_name": "string — the exercise name as said by user",
  "sets": number | null,
  "reps": number | null,
  "weight": number | null,
  "weight_unit": "lbs" | "kg" | null,
  "set_type": "warmup" | "working" | "dropset" | "amrap" | "failure" | null,
  "confidence": 0.0 to 1.0
}

Rules:
- Weight unit defaults to "lbs" if the user says "pounds" or uses American units or doesn't specify
- "set_type" defaults to "working" if not mentioned
- If reps/sets/weight are not mentioned, use null
- confidence = how sure you are the parse is correct (0.0-1.0)''';

  /// Coaching insight from weekly data. (INSIGHT_PROMPT)
  static String insight({
    required String goalDescription,
    required int weeksTraining,
    required String weeklyJson,
  }) =>
      '''
You are IronLog's personal coaching AI. Be direct, specific, and motivating. Max 3 sentences.

Athlete profile:
- Goal: $goalDescription
- Training for: $weeksTraining weeks

This week's data:
$weeklyJson

Provide ONE coaching insight focusing on: volume trends, plateaus, goal proximity, or muscle imbalances.
Use specific numbers. Never mention one-rep-max. Volume = Sets × Reps × Weight.''';

  /// Week-over-week safety check. Returns "SAFE" or a warning. (SAFETY_CHECK_PROMPT)
  static String safetyCheck({
    required String muscleGroup,
    required double prevVolume,
    required double newVolume,
    required double pctChange,
    required String unit,
  }) =>
      '''
Gym safety check. Answer in 1-2 sentences only.

Muscle group: $muscleGroup
Last week's total volume: ${_num(prevVolume)} $unit
This week's total volume: ${_num(newVolume)} $unit
Increase: ${_num(pctChange)}%

If the increase exceeds 15%, warn the athlete about injury risk and suggest a safer increment.
If 15% or under, respond with exactly: SAFE''';

  /// Weekly split suggestion from history → JSON. (PLAN_SUGGESTION_PROMPT)
  static String planSuggestion({
    required String historyJson,
    required String goalDescription,
  }) =>
      '''
You are IronLog's workout planner AI. Based on the athlete's recent workout history, suggest a structured weekly split.

Recent workout history (last 14 days):
$historyJson

Athlete goal: $goalDescription

Respond ONLY with valid JSON:
{
  "plan_name": "string",
  "description": "string — 1 sentence",
  "days": [
    {
      "day_of_week": 0-6 (0=Monday),
      "name": "string e.g. Push Day",
      "muscle_groups": ["string"],
      "is_rest_day": boolean
    }
  ]
}''';

  /// Nudge after repeated unplanned workouts. (ADHOC_NUDGE_PROMPT)
  static String adHocNudge(int count) => '''
The athlete has logged $count workouts without a structured plan.

Briefly explain (2-3 sentences) why a structured weekly split improves hypertrophy results.
End with: "Want me to build a plan based on what you've been training?"
Be encouraging, not preachy.''';

  static String _num(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);
}
