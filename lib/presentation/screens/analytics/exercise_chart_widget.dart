import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_typography.dart';
import '../../../data/database/daos/analytics_dao.dart';

/// Volume-over-time line chart for a single exercise.
/// Wrapped in RepaintBoundary per CLAUDE.md §10.
class ExerciseChartWidget extends StatelessWidget {
  const ExerciseChartWidget({super.key, required this.data, this.unit = 'kg'});

  final List<VolumeDataPoint> data;
  final String unit;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return _EmptyChart(message: 'Log this exercise to see progress here');
    }

    final scheme = Theme.of(context).colorScheme;
    final maxY =
        data.map((d) => d.totalVolume).reduce(max) * 1.15;
    final showDots = data.length <= 16;

    return RepaintBoundary(
      child: SizedBox(
        height: 200,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: data
                    .asMap()
                    .entries
                    .map((e) => FlSpot(
                        e.key.toDouble(), e.value.totalVolume))
                    .toList(),
                isCurved: true,
                curveSmoothness: 0.35,
                color: scheme.primary,
                barWidth: 2.5,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: showDots,
                  getDotPainter: (_, __, ___, ____) =>
                      FlDotCirclePainter(
                    radius: 3,
                    color: scheme.primary,
                    strokeWidth: 1.5,
                    strokeColor: scheme.surface,
                  ),
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      scheme.primary.withValues(alpha: 0.18),
                      scheme.primary.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ],
            minY: 0,
            maxY: maxY,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: max(maxY / 4, 1),
              getDrawingHorizontalLine: (_) => FlLine(
                color: scheme.onSurface.withValues(alpha: 0.07),
                strokeWidth: 1,
              ),
            ),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 52,
                  interval: max(maxY / 4, 1),
                  getTitlesWidget: (v, meta) {
                    if (v == meta.max || v < 0) return const SizedBox();
                    return Text(
                      _compact(v),
                      style: AppTypography.caption.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.4),
                      ),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (_) =>
                    scheme.surfaceContainerHighest,
                getTooltipItems: (spots) => spots
                    .map(
                      (s) => LineTooltipItem(
                        '${_compact(s.y)} $unit',
                        AppTypography.caption
                            .copyWith(color: scheme.onSurface),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _compact(double v) {
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(1)}k';
    return v == v.roundToDouble()
        ? v.toStringAsFixed(0)
        : v.toStringAsFixed(1);
  }
}

class _EmptyChart extends StatelessWidget {
  const _EmptyChart({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 200,
      child: Center(
        child: Text(
          message,
          style: AppTypography.caption
              .copyWith(color: scheme.onSurface.withValues(alpha: 0.4)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
