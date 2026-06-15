import 'package:flutter/material.dart';

import '../../core/theme/app_typography.dart';
import 'ironlog_card.dart';
import 'shimmer_loader.dart';

/// Shows a Gemma-generated coaching insight with shimmer while loading.
class AIInsightCard extends StatelessWidget {
  const AIInsightCard({
    super.key,
    this.insight,
    this.isLoading = false,
  });

  final String? insight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (isLoading) {
      return const ShimmerCard(height: 80);
    }

    final text = insight ?? 'AI coach is ready. Log your first workout!';

    return IronLogCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.psychology_outlined,
              color: scheme.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTypography.aiInsight
                  .copyWith(color: scheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
