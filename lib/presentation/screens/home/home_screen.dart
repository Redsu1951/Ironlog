import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../ai/gemma_service.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/preferences_provider.dart';
import '../../../data/models/insight_context.dart';
import '../../providers/ai_provider.dart';
import '../../providers/analytics_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/ai_insight_card.dart';
import '../../widgets/ironlog_button.dart';
import '../../widgets/ironlog_card.dart';
import '../../widgets/shimmer_loader.dart';
import '../../widgets/volume_badge.dart';

/// Dashboard home — shows volume summary + AI coaching insight.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _insightRequested = false;

  void _triggerInsight() {
    if (_insightRequested) return;
    final analytics = ref.read(analyticsProvider).asData?.value;
    if (analytics == null) return;
    _insightRequested = true;
    final prefs = ref.read(sharedPreferencesProvider);
    final unit = prefs.getString('preferred_unit') ?? 'kg';
    final goal =
        prefs.getString('draft_goal_desc') ?? 'Build strength and muscle';
    final lastWeek = analytics.trend.length > 1
        ? analytics.trend[analytics.trend.length - 2].volume
        : 0.0;
    final ctx = InsightContext(
      goalDescription: goal,
      weeksTraining: analytics.trend.where((w) => w.volume > 0).length,
      weeklyJson: '{}',
      totalVolumeThisWeek: analytics.weeklyVolume,
      totalVolumeLastWeek: lastWeek,
      unit: unit,
    );
    ref.read(aiProvider.notifier).generateInsight(ctx);
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final analytics = ref.watch(analyticsProvider);
    final ai = ref.watch(aiProvider);
    final prefs = ref.read(sharedPreferencesProvider);
    final unit = prefs.getString('preferred_unit') ?? 'kg';
    final scheme = Theme.of(context).colorScheme;
    final modelSkipped = prefs.getBool('model_download_skipped') ?? false;

    // Trigger insight once analytics data is available.
    ref.listen(analyticsProvider, (_, next) {
      if (next.hasValue) _triggerInsight();
    });
    // Also re-trigger once Gemma finishes loading (in case analytics loaded first).
    ref.listen(gemmaInitProvider, (_, next) {
      if (next.asData?.value == true) _triggerInsight();
    });

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'IRONLOG',
                      style: AppTypography.headerLarge.copyWith(
                        fontSize: 28,
                        color: scheme.primary,
                        letterSpacing: 2,
                      ),
                    ),
                    if (auth.displayName != null)
                      Text(
                        'Hey, ${auth.displayName!.split(' ').first}',
                        style: AppTypography.body.copyWith(
                            color: scheme.onSurface.withValues(alpha: 0.6)),
                      ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline),
                  onPressed: () => context.go('/profile'),
                ),
              ],
            ),

            // AI model banner if skipped
            if (modelSkipped) ...[
              const SizedBox(height: 12),
              IronLogCard(
                onTap: () => context.push('/onboarding/model-download'),
                child: Row(
                  children: [
                    Icon(Icons.psychology_outlined,
                        color: scheme.tertiary, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Tap to set up AI coaching (1.1 GB, one-time)',
                        style: AppTypography.body
                            .copyWith(color: scheme.onSurface),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: scheme.onSurface),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 20),

            // Start workout CTA
            IronLogButton(
              label: 'Start Workout',
              icon: Icons.fitness_center,
              onPressed: () => context.push('/workout/active'),
            ),

            const SizedBox(height: 24),

            // This-week volume
            Text('THIS WEEK',
                style: AppTypography.sectionLabel
                    .copyWith(color: scheme.onSurface.withValues(alpha: 0.5))),
            const SizedBox(height: 8),
            IronLogCard(
              child: analytics.when(
                loading: () => const ShimmerCard(height: 60),
                error: (_, __) => Text(
                  'Volume data unavailable',
                  style: AppTypography.caption,
                ),
                data: (summary) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VolumeBadge(
                      volumeKg: summary.weeklyVolume,
                      unit: unit,
                      label: 'Total Volume',
                      large: true,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          summary.trend
                              .where((w) => w.volume > 0)
                              .length
                              .toString(),
                          style: AppTypography.statLarge
                              .copyWith(color: scheme.primary),
                        ),
                        Text('Active weeks',
                            style: AppTypography.caption.copyWith(
                                color: scheme.onSurface.withValues(alpha: 0.6))),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // AI insight
            Text('AI COACHING',
                style: AppTypography.sectionLabel
                    .copyWith(color: scheme.onSurface.withValues(alpha: 0.5))),
            const SizedBox(height: 8),
            AIInsightCard(
              insight: ai.lastInsight,
              isLoading: ai.isGenerating,
            ),

            const SizedBox(height: 24),

            // Quick-nav cards
            Text('EXPLORE',
                style: AppTypography.sectionLabel
                    .copyWith(color: scheme.onSurface.withValues(alpha: 0.5))),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: IronLogCard(
                    onTap: () => context.go('/analytics'),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.bar_chart, color: scheme.primary),
                        const SizedBox(height: 8),
                        Text('Analytics',
                            style: AppTypography.sectionLabel
                                .copyWith(color: scheme.onSurface)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: IronLogCard(
                    onTap: () => context.go('/history'),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.history, color: scheme.primary),
                        const SizedBox(height: 8),
                        Text('History',
                            style: AppTypography.sectionLabel
                                .copyWith(color: scheme.onSurface)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
