import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/utils/preferences_provider.dart';
import '../../../domain/entities/exercise.dart';
import '../../providers/analytics_provider.dart';
import '../../providers/exercise_provider.dart';
import '../../widgets/ironlog_card.dart';
import '../../widgets/shimmer_loader.dart';
import '../../widgets/volume_badge.dart';
import 'exercise_chart_widget.dart';

/// 3-tab analytics screen: Exercise / Muscle / Full Body.
/// All charts are wrapped in RepaintBoundary for 120Hz performance.
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Analytics',
              style: AppTypography.screenTitle
                  .copyWith(color: scheme.onSurface)),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'EXERCISE'),
              Tab(text: 'MUSCLE'),
              Tab(text: 'FULL BODY'),
            ],
            labelStyle: AppTypography.button,
            indicatorColor: scheme.primary,
          ),
        ),
        body: const TabBarView(
          children: [
            _ExerciseTab(),
            _MuscleTab(),
            _FullBodyTab(),
          ],
        ),
      ),
    );
  }
}

// ── Exercise tab ──────────────────────────────────────────────────────────────

class _ExerciseTab extends ConsumerStatefulWidget {
  const _ExerciseTab();

  @override
  ConsumerState<_ExerciseTab> createState() => _ExerciseTabState();
}

class _ExerciseTabState extends ConsumerState<_ExerciseTab> {
  Exercise? _selectedExercise;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final unit =
        ref.read(sharedPreferencesProvider).getString('preferred_unit') ??
            'kg';

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Exercise picker chip
        IronLogCard(
          onTap: () async {
            final ex = await showSearch<Exercise?>(
              context: context,
              delegate: _ExerciseSearchDelegate(),
            );
            if (ex != null && mounted) setState(() => _selectedExercise = ex);
          },
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(Icons.fitness_center, size: 18, color: scheme.primary),
              const SizedBox(width: 12),
              Text(
                _selectedExercise?.name ?? 'Select an exercise…',
                style: AppTypography.bodyMedium.copyWith(
                  color: _selectedExercise != null
                      ? scheme.onSurface
                      : scheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              const Spacer(),
              Icon(Icons.arrow_drop_down, color: scheme.onSurface),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (_selectedExercise != null) ...[
          Text(
            _selectedExercise!.name,
            style: AppTypography.bodySemiBold
                .copyWith(color: scheme.onSurface),
          ),
          const SizedBox(height: 4),
          Text(
            'Volume per session (last 52 sessions)',
            style: AppTypography.caption
                .copyWith(color: scheme.onSurface.withValues(alpha: 0.5)),
          ),
          const SizedBox(height: 12),
          Consumer(
            builder: (context, ref, _) {
              final history = ref.watch(
                  exerciseVolumeHistoryProvider(_selectedExercise!.id));
              return history.when(
                loading: () => const ShimmerCard(height: 200),
                error: (_, __) => const _ChartError(),
                data: (data) => ExerciseChartWidget(data: data, unit: unit),
              );
            },
          ),
        ] else
          IronLogCard(
            child: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.bar_chart,
                        size: 48,
                        color: scheme.onSurface.withValues(alpha: 0.15)),
                    const SizedBox(height: 12),
                    Text(
                      'Select an exercise to see\nyour volume history',
                      style: AppTypography.caption.copyWith(
                          color:
                              scheme.onSurface.withValues(alpha: 0.4)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ── Muscle tab ────────────────────────────────────────────────────────────────

class _MuscleTab extends ConsumerWidget {
  const _MuscleTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(analyticsProvider);
    final scheme = Theme.of(context).colorScheme;
    final unit =
        ref.read(sharedPreferencesProvider).getString('preferred_unit') ??
            'kg';

    return summary.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('Could not load data')),
      data: (s) {
        final thisWeek = s.trend.isNotEmpty ? s.trend.last : null;
        final byMuscle = thisWeek?.byMuscleGroup ?? <String, double>{};

        if (byMuscle.isEmpty) {
          return Center(
            child: Text(
              'No workouts this week yet.\nStart training to see muscle breakdown.',
              style: AppTypography.body.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.5)),
              textAlign: TextAlign.center,
            ),
          );
        }

        final sorted = byMuscle.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        final maxVal = sorted.first.value;

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: sorted.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            if (i == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'THIS WEEK BY MUSCLE',
                  style: AppTypography.sectionLabel.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.5)),
                ),
              );
            }
            final entry = sorted[i - 1];
            final fraction = maxVal > 0 ? (entry.value / maxVal) : 0.0;
            final vol = unit == 'lbs'
                ? entry.value * 2.20462
                : entry.value;
            final volLabel =
                '${vol.toStringAsFixed(0)} $unit';

            return IronLogCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(entry.key, style: AppTypography.body),
                      ),
                      Text(
                        volLabel,
                        style: AppTypography.stat.copyWith(
                          fontSize: 14,
                          color: scheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: fraction,
                      minHeight: 6,
                      backgroundColor:
                          scheme.primary.withValues(alpha: 0.12),
                      valueColor: AlwaysStoppedAnimation(
                        scheme.primary.withValues(
                            alpha: 0.4 + 0.6 * fraction),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

// ── Full Body tab ─────────────────────────────────────────────────────────────

class _FullBodyTab extends ConsumerWidget {
  const _FullBodyTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(analyticsProvider);
    final scheme = Theme.of(context).colorScheme;
    final unit =
        ref.read(sharedPreferencesProvider).getString('preferred_unit') ??
            'kg';

    return summary.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) =>
          const Center(child: Text('Could not load trend data')),
      data: (s) {
        final trend = s.trend;
        final nonZero = trend.where((w) => w.volume > 0).toList();

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Summary card
            Row(
              children: [
                Expanded(
                  child: IronLogCard(
                    padding: const EdgeInsets.all(16),
                    child: VolumeBadge(
                      volumeKg: s.weeklyVolume,
                      unit: unit,
                      label: 'This Week',
                      large: true,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: IronLogCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nonZero.length.toString(),
                          style: AppTypography.statLarge
                              .copyWith(color: scheme.primary),
                        ),
                        Text(
                          'Active weeks',
                          style: AppTypography.caption.copyWith(
                              color: scheme.onSurface.withValues(alpha: 0.6)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('12-WEEK TREND',
                style: AppTypography.sectionLabel.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.5))),
            const SizedBox(height: 8),
            IronLogCard(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 16, 8),
                child: trend.isEmpty
                    ? SizedBox(
                        height: 180,
                        child: Center(
                          child: Text(
                            'No data yet — log your first workout!',
                            style: AppTypography.caption.copyWith(
                                color: scheme.onSurface.withValues(alpha: 0.4)),
                          ),
                        ),
                      )
                    : _TrendChart(trend: trend, scheme: scheme),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TrendChart extends StatelessWidget {
  const _TrendChart({required this.trend, required this.scheme});
  final List<dynamic> trend;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    final maxY = trend
            .map((w) => (w.volume as double))
            .reduce(max) *
        1.15;

    return RepaintBoundary(
      child: SizedBox(
        height: 180,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: trend
                    .asMap()
                    .entries
                    .map((e) => FlSpot(
                        e.key.toDouble(), (e.value.volume as double)))
                    .toList(),
                isCurved: true,
                curveSmoothness: 0.3,
                color: scheme.primary,
                barWidth: 2.5,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      scheme.primary.withValues(alpha: 0.2),
                      scheme.primary.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ],
            minY: 0,
            maxY: maxY == 0 ? 100 : maxY,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
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
                  sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false)),
            ),
          ),
        ),
      ),
    );
  }

  String _compact(double v) {
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(1)}k';
    return v.toStringAsFixed(0);
  }
}

// ── Exercise search delegate ──────────────────────────────────────────────────

class _ExerciseSearchDelegate extends SearchDelegate<Exercise?> {
  _ExerciseSearchDelegate();

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) =>
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => _buildList(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildList(context);

  Widget _buildList(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final exercises = ref.watch(exerciseProvider);
        return exercises.when(
          loading: () =>
              const Center(child: CircularProgressIndicator()),
          error: (_, __) =>
              const Center(child: Text('Could not load exercises')),
          data: (list) {
            final filtered = query.isEmpty
                ? list
                : list
                    .where((e) => e.name
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();
            return ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(filtered[i].name),
                onTap: () => close(context, filtered[i]),
              ),
            );
          },
        );
      },
    );
  }
}

// ── Error widget ──────────────────────────────────────────────────────────────

class _ChartError extends StatelessWidget {
  const _ChartError();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 200,
        child: Center(
          child: Text(
            'Could not load chart data',
            style: AppTypography.caption.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.4)),
          ),
        ),
      );
}
