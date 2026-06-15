import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/constants/ai_prompts.dart';
import '../data/database/app_database.dart';
import '../data/models/insight_context.dart';
import 'gemma_service.dart';

part 'insights_engine.g.dart';

/// One day of an AI-suggested split.
class PlannedDay {
  const PlannedDay({
    required this.dayOfWeek,
    required this.name,
    required this.muscleGroups,
    required this.isRestDay,
  });
  final int dayOfWeek; // 0=Monday
  final String name;
  final List<String> muscleGroups;
  final bool isRestDay;
}

/// An AI-suggested weekly split (CLAUDE.md §4 Step 4.4 / §9 PLAN_SUGGESTION).
class PlannedSplit {
  const PlannedSplit({
    required this.planName,
    required this.description,
    required this.days,
  });
  final String planName;
  final String description;
  final List<PlannedDay> days;
}

/// Generates coaching insights, plan suggestions, and nudges. Uses Gemma when
/// loaded; otherwise produces specific, numeric template text from the computed
/// stats so the experience never goes blank offline (CLAUDE.md §3 fallback).
class InsightsEngine {
  InsightsEngine(this._gemma);

  final GemmaService _gemma;

  Future<String> generateInsight(InsightContext context) async {
    if (_gemma.isInitialized) {
      try {
        final out = await _gemma.generate(
          AiPrompts.insight(
            goalDescription: context.goalDescription,
            weeksTraining: context.weeksTraining,
            weeklyJson: context.weeklyJson,
          ),
          maxTokens: 220,
        );
        if (out.trim().isNotEmpty) return out.trim();
      } catch (_) {
        // Fall through to the template.
      }
    }
    return _templateInsight(context);
  }

  /// Suggests a split from recent history. Returns null if Gemma is unavailable
  /// or its output can't be parsed (the UI then offers the manual builder).
  Future<PlannedSplit?> suggestPlan(
      List<WorkoutData> history, String goalDescription) async {
    if (!_gemma.isInitialized) return null;
    try {
      final raw = await _gemma.generate(
        AiPrompts.planSuggestion(
          historyJson: _serializeHistory(history),
          goalDescription: goalDescription,
        ),
        maxTokens: 512,
      );
      return _parsePlan(raw);
    } catch (_) {
      return null;
    }
  }

  Future<String> generateAdHocNudge(int adHocCount) async {
    if (_gemma.isInitialized) {
      try {
        final out =
            await _gemma.generate(AiPrompts.adHocNudge(adHocCount), maxTokens: 160);
        if (out.trim().isNotEmpty) return out.trim();
      } catch (_) {
        // Fall through to the template.
      }
    }
    return "You've logged $adHocCount workouts without a plan. A structured "
        'weekly split spreads volume evenly across muscle groups and drives '
        'better hypertrophy than ad-hoc sessions. '
        'Want me to build a plan based on what you’ve been training?';
  }

  // ── Template fallbacks ────────────────────────────────────────────────

  String _templateInsight(InsightContext c) {
    final unit = c.unit;
    final tw = c.totalVolumeThisWeek;
    final lw = c.totalVolumeLastWeek;

    if (tw <= 0 && lw <= 0) {
      return 'Log a few sets to unlock volume trends — every rep counts toward '
          '${c.goalDescription}.';
    }
    if (lw <= 0) {
      return 'Strong start: ${_fmt(tw)} $unit of volume this week. Keep the '
          'momentum toward ${c.goalDescription}.';
    }

    final delta = ((tw - lw) / lw) * 100;
    final dir = delta >= 0 ? 'up' : 'down';
    final lead = 'You moved ${_fmt(tw)} $unit this week, $dir '
        '${delta.abs().toStringAsFixed(0)}% vs last week (${_fmt(lw)} $unit).';

    final top = _topMuscle(c.volumeByMuscle);
    final detail = top != null
        ? ' ${top.key} led your volume at ${_fmt(top.value)} $unit — keep it '
            'balanced with the rest.'
        : ' Aim for a steady, sustainable climb under 15% week over week.';
    return lead + detail;
  }

  MapEntry<String, double>? _topMuscle(Map<String, double> byMuscle) {
    if (byMuscle.isEmpty) return null;
    return byMuscle.entries.reduce((a, b) => a.value >= b.value ? a : b);
  }

  String _serializeHistory(List<WorkoutData> history) {
    final items = history
        .map((w) => {
              'name': w.name,
              'started_at': w.startedAt,
              'total_volume': w.totalVolumeKg,
              'is_ad_hoc': w.isAdHoc,
            })
        .toList();
    return json.encode(items);
  }

  PlannedSplit? _parsePlan(String raw) {
    final start = raw.indexOf('{');
    final end = raw.lastIndexOf('}');
    if (start < 0 || end <= start) return null;
    try {
      final map = json.decode(raw.substring(start, end + 1));
      if (map is! Map<String, dynamic>) return null;
      final daysRaw = (map['days'] as List?) ?? const [];
      final days = daysRaw.whereType<Map<String, dynamic>>().map((d) {
        return PlannedDay(
          dayOfWeek: (d['day_of_week'] as num?)?.toInt() ?? 0,
          name: (d['name'] as String?) ?? '',
          muscleGroups: ((d['muscle_groups'] as List?) ?? const [])
              .map((e) => e.toString())
              .toList(),
          isRestDay: d['is_rest_day'] as bool? ?? false,
        );
      }).toList();
      if (days.isEmpty) return null;
      return PlannedSplit(
        planName: (map['plan_name'] as String?) ?? 'AI Split',
        description: (map['description'] as String?) ?? '',
        days: days,
      );
    } catch (_) {
      return null;
    }
  }

  String _fmt(double v) {
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(1)}k';
    return v.toStringAsFixed(0);
  }
}

@riverpod
InsightsEngine insightsEngine(Ref ref) {
  return InsightsEngine(ref.watch(gemmaServiceProvider));
}
