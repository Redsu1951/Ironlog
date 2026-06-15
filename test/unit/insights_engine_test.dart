import 'package:flutter_test/flutter_test.dart';
import 'package:ironlog/ai/gemma_service.dart';
import 'package:ironlog/ai/insights_engine.dart';
import 'package:ironlog/data/models/insight_context.dart';

/// Phase 4 validation: insight/nudge template fallbacks produce specific,
/// numeric text with the model absent, and suggestPlan declines without Gemma.
void main() {
  final engine = InsightsEngine(GemmaService());

  test('template insight reports week-over-week change with numbers', () async {
    const ctx = InsightContext(
      goalDescription: 'Bulk to 80kg',
      weeksTraining: 6,
      weeklyJson: '{}',
      totalVolumeThisWeek: 12000,
      totalVolumeLastWeek: 10000,
      unit: 'kg',
      volumeByMuscle: {'Chest': 5000, 'Back': 4000},
    );
    final insight = await engine.generateInsight(ctx);
    expect(insight, contains('up'));
    expect(insight, contains('20%'));
    expect(insight, contains('Chest'));
  });

  test('template insight handles a first week (no prior data)', () async {
    const ctx = InsightContext(
      goalDescription: 'Get stronger',
      weeksTraining: 1,
      weeklyJson: '{}',
      totalVolumeThisWeek: 3000,
      totalVolumeLastWeek: 0,
    );
    final insight = await engine.generateInsight(ctx);
    expect(insight.toLowerCase(), contains('start'));
  });

  test('ad-hoc nudge includes the count and the CTA question', () async {
    final nudge = await engine.generateAdHocNudge(3);
    expect(nudge, contains('3'));
    expect(nudge, contains('?'));
  });

  test('suggestPlan returns null without a loaded model', () async {
    final plan = await engine.suggestPlan(const [], 'Bulk');
    expect(plan, isNull);
  });
}
