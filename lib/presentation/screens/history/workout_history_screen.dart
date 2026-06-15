import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/utils/preferences_provider.dart';
import '../../../domain/entities/workout.dart';
import '../../providers/analytics_provider.dart';
import '../../widgets/ironlog_card.dart';
import '../../widgets/shimmer_loader.dart';
import '../../widgets/volume_badge.dart';

class WorkoutHistoryScreen extends ConsumerWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(workoutHistoryProvider);
    final scheme = Theme.of(context).colorScheme;
    final unit =
        ref.read(sharedPreferencesProvider).getString('preferred_unit') ?? 'kg';

    return Scaffold(
      appBar: AppBar(
        title: Text('History',
            style: AppTypography.screenTitle.copyWith(color: scheme.onSurface)),
      ),
      body: historyAsync.when(
        loading: () => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 6,
          itemBuilder: (_, __) => const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: ShimmerCard(height: 80),
          ),
        ),
        error: (_, __) => Center(
          child: Text('Could not load history',
              style: AppTypography.body
                  .copyWith(color: scheme.onSurface.withValues(alpha: 0.4))),
        ),
        data: (workouts) {
          if (workouts.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.history,
                      size: 64,
                      color: scheme.onSurface.withValues(alpha: 0.15)),
                  const SizedBox(height: 16),
                  Text(
                    'No workouts yet.\nStart your first session!',
                    style: AppTypography.body.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.4)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          final groups = _groupByDate(workouts);
          final dates = groups.keys.toList()..sort((a, b) => b.compareTo(a));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: dates.length,
            itemBuilder: (_, i) {
              final date = dates[i];
              final dayWorkouts = groups[date]!;
              return _DateGroup(
                date: date,
                workouts: dayWorkouts,
                unit: unit,
              );
            },
          );
        },
      ),
    );
  }

  Map<DateTime, List<Workout>> _groupByDate(List<Workout> workouts) {
    final map = <DateTime, List<Workout>>{};
    for (final w in workouts) {
      final d = DateTime(
          w.startedAt.year, w.startedAt.month, w.startedAt.day);
      map.putIfAbsent(d, () => []).add(w);
    }
    return map;
  }
}

class _DateGroup extends StatelessWidget {
  const _DateGroup({
    required this.date,
    required this.workouts,
    required this.unit,
  });

  final DateTime date;
  final List<Workout> workouts;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    String label;
    if (date == today) {
      label = 'TODAY';
    } else if (date == yesterday) {
      label = 'YESTERDAY';
    } else {
      label = DateFormat('EEE, d MMM').format(date).toUpperCase();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            label,
            style: AppTypography.sectionLabel.copyWith(
                color: scheme.onSurface.withValues(alpha: 0.45),
                fontSize: 13),
          ),
        ),
        ...workouts.map((w) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _WorkoutCard(workout: w, unit: unit),
            )),
      ],
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  const _WorkoutCard({required this.workout, required this.unit});

  final Workout workout;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final duration = workout.elapsed;
    final durationStr = duration.inMinutes > 0
        ? '${duration.inMinutes} min'
        : '< 1 min';

    return IronLogCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left — name + meta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(workout.name,
                    style: AppTypography.bodySemiBold
                        .copyWith(color: scheme.onSurface)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.timer_outlined,
                        size: 13,
                        color: scheme.onSurface.withValues(alpha: 0.5)),
                    const SizedBox(width: 4),
                    Text(durationStr,
                        style: AppTypography.caption.copyWith(
                            color:
                                scheme.onSurface.withValues(alpha: 0.5))),
                    if (workout.isAdHoc) ...[
                      const SizedBox(width: 8),
                      Text('Ad-hoc',
                          style: AppTypography.caption.copyWith(
                              color: scheme.tertiary)),
                    ],
                  ],
                ),
              ],
            ),
          ),
          // Right — volume
          VolumeBadge(volumeKg: workout.totalVolumeKg, unit: unit),
        ],
      ),
    );
  }
}
