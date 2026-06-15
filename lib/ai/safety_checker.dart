import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/constants/ai_prompts.dart';
import 'gemma_service.dart';

part 'safety_checker.g.dart';

/// Result of the week-over-week volume safety check (CLAUDE.md §4 Step 4.5).
/// Carries the volumes so [SafetyChecker.generateWarning] can build its prompt
/// from the result alone.
class SafetyResult {
  const SafetyResult({
    required this.isSafe,
    required this.percentageIncrease,
    required this.muscleGroup,
    required this.prevVolume,
    required this.newVolume,
    required this.unit,
  });

  final bool isSafe;
  final double percentageIncrease;
  final String muscleGroup;
  final double prevVolume;
  final double newVolume;
  final String unit;
}

/// Flags >15% week-over-week volume jumps per muscle group. The check itself is
/// pure math (no AI, always available); only the warning *message* uses Gemma,
/// with a template fallback.
class SafetyChecker {
  const SafetyChecker();

  /// CLAUDE.md §12 threshold.
  static const double thresholdPct = 15.0;

  SafetyResult checkVolumeIncrease({
    required double prevVolume,
    required double newVolume,
    required String muscleGroup,
    required String unit,
  }) {
    // No prior-week baseline → nothing to compare; treat as safe.
    if (prevVolume <= 0) {
      return SafetyResult(
        isSafe: true,
        percentageIncrease: 0,
        muscleGroup: muscleGroup,
        prevVolume: prevVolume,
        newVolume: newVolume,
        unit: unit,
      );
    }
    final pct = ((newVolume - prevVolume) / prevVolume) * 100;
    return SafetyResult(
      isSafe: pct <= thresholdPct,
      percentageIncrease: pct,
      muscleGroup: muscleGroup,
      prevVolume: prevVolume,
      newVolume: newVolume,
      unit: unit,
    );
  }

  /// Returns null when safe; otherwise a 1–2 sentence warning (Gemma or template).
  Future<String?> generateWarning(SafetyResult result, GemmaService gemma) async {
    if (result.isSafe) return null;

    if (gemma.isInitialized) {
      try {
        final out = await gemma.generate(
          AiPrompts.safetyCheck(
            muscleGroup: result.muscleGroup,
            prevVolume: result.prevVolume,
            newVolume: result.newVolume,
            pctChange: result.percentageIncrease,
            unit: result.unit,
          ),
        );
        final trimmed = out.trim();
        if (trimmed.isNotEmpty && trimmed.toUpperCase() != 'SAFE') {
          return trimmed;
        }
      } catch (_) {
        // Fall through to the template.
      }
    }
    return _template(result);
  }

  String _template(SafetyResult r) {
    final pct = r.percentageIncrease.toStringAsFixed(0);
    return '⚠️ Your ${r.muscleGroup} volume jumped $pct% this week. '
        'Consider easing back to a ≤15% increase to reduce injury risk.';
  }
}

@riverpod
SafetyChecker safetyChecker(Ref ref) => const SafetyChecker();
