import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_typography.dart';

/// Horizontal bar chart showing relative volume per muscle group.
/// Wrapped in RepaintBoundary for 120Hz performance (CLAUDE.md §10).
class MuscleHeatmapWidget extends StatelessWidget {
  const MuscleHeatmapWidget({
    super.key,
    required this.volumeByMuscle,
    this.unit = 'kg',
  });

  final Map<String, double> volumeByMuscle;
  final String unit;

  @override
  Widget build(BuildContext context) {
    if (volumeByMuscle.isEmpty) {
      return SizedBox(
        height: 120,
        child: Center(
          child: Text(
            'No muscle data this week',
            style: AppTypography.caption.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.4)),
          ),
        ),
      );
    }

    final scheme = Theme.of(context).colorScheme;
    final sorted = volumeByMuscle.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final maxVal = sorted.map((e) => e.value).reduce(max);

    return RepaintBoundary(
      child: SizedBox(
        height: sorted.length * 40.0 + 16,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: (_) => scheme.surfaceContainerHighest,
                getTooltipItem: (group, gi, rod, ri) {
                  final label = sorted[group.x].key;
                  final val = rod.toY;
                  final display = val >= 1000
                      ? '${(val / 1000).toStringAsFixed(1)}k'
                      : val.toStringAsFixed(0);
                  return BarTooltipItem(
                    '$label\n$display $unit',
                    AppTypography.caption
                        .copyWith(color: scheme.onSurface),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 80,
                  getTitlesWidget: (v, m) {
                    final idx = v.round();
                    if (idx < 0 || idx >= sorted.length) {
                      return const SizedBox();
                    }
                    final name = sorted[idx].key;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        name.length > 14
                            ? '${name.substring(0, 13)}…'
                            : name,
                        style: AppTypography.caption
                            .copyWith(color: scheme.onSurface),
                        textAlign: TextAlign.right,
                      ),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            maxY: maxVal * 1.2,
            barGroups: sorted.asMap().entries.map((e) {
              final intensity = 0.3 + 0.7 * (e.value.value / maxVal);
              return BarChartGroupData(
                x: e.key,
                barRods: [
                  BarChartRodData(
                    toY: e.value.value,
                    color: scheme.primary.withValues(alpha: intensity),
                    width: 18,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(4),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
