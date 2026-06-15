import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_typography.dart';
import '../../../data/database/app_database.dart';
import '../../providers/planner_provider.dart';
import '../../widgets/ironlog_button.dart';
import '../../widgets/ironlog_card.dart';
import '../../widgets/shimmer_loader.dart';

/// 7-day plan grid + today's session overview.
class WeeklyPlannerScreen extends ConsumerWidget {
  const WeeklyPlannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planAsync = ref.watch(activePlanProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Planner',
            style:
                AppTypography.screenTitle.copyWith(color: scheme.onSurface)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/planner/builder'),
            tooltip: 'Build a split',
          ),
        ],
      ),
      body: planAsync.when(
        loading: () => ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            ShimmerCard(height: 120),
            SizedBox(height: 16),
            ShimmerCard(height: 200),
          ],
        ),
        error: (_, __) => const Center(child: Text('Could not load plan')),
        data: (summary) {
          if (summary.plan == null) {
            return _EmptyPlanView(onBuild: () => context.push('/planner/builder'));
          }
          return _PlanView(plan: summary.plan!, days: summary.days);
        },
      ),
    );
  }
}

// ── No plan state ─────────────────────────────────────────────────────────────

class _EmptyPlanView extends StatelessWidget {
  const _EmptyPlanView({required this.onBuild});
  final VoidCallback onBuild;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_month_outlined,
                size: 72,
                color: scheme.onSurface.withValues(alpha: 0.15)),
            const SizedBox(height: 24),
            Text(
              'No plan yet',
              style: AppTypography.screenTitle.copyWith(color: scheme.onSurface),
            ),
            const SizedBox(height: 12),
            Text(
              'A structured weekly split helps you build muscle more efficiently than ad-hoc sessions.',
              style: AppTypography.body.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.5)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            IronLogButton(
              label: 'Build a Split',
              icon: Icons.auto_awesome,
              onPressed: onBuild,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Plan view ─────────────────────────────────────────────────────────────────

class _PlanView extends StatelessWidget {
  const _PlanView({required this.plan, required this.days});
  final WorkoutPlanData plan;
  final List<WorkoutPlanDayData> days;

  static const _dayLabels = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final todayDow = DateTime.now().weekday - 1; // 0=Mon

    // Build a quick lookup: dayOfWeek → plan day.
    final dayMap = {for (final d in days) d.dayOfWeek: d};

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Plan name header
        Text(
          plan.name,
          style: AppTypography.screenTitle.copyWith(color: scheme.onSurface),
        ),
        if (plan.description.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(plan.description,
              style: AppTypography.body
                  .copyWith(color: scheme.onSurface.withValues(alpha: 0.55))),
        ],
        const SizedBox(height: 20),

        // 7-day grid
        IronLogCard(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (i) {
              final planDay = dayMap[i];
              final isToday = i == todayDow;
              final isRest = planDay?.isRestDay ?? false;

              return _DayChip(
                label: _dayLabels[i],
                name: planDay?.name ?? '—',
                isToday: isToday,
                isRest: isRest,
                hasContent: planDay != null,
              );
            }),
          ),
        ),

        const SizedBox(height: 20),

        // Today's session card
        Text('TODAY',
            style: AppTypography.sectionLabel.copyWith(
                color: scheme.onSurface.withValues(alpha: 0.5))),
        const SizedBox(height: 8),
        _TodayCard(planDay: dayMap[todayDow]),

        const SizedBox(height: 20),

        // All days list
        Text('THIS WEEK',
            style: AppTypography.sectionLabel
                .copyWith(color: scheme.onSurface.withValues(alpha: 0.5))),
        const SizedBox(height: 8),
        ...days.map((d) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _DayCard(day: d, isToday: d.dayOfWeek == todayDow),
            )),

        const SizedBox(height: 12),
        IronLogButton(
          label: 'Replace Plan',
          icon: Icons.refresh,
          onPressed: () => context.push('/planner/builder'),
        ),
      ],
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.label,
    required this.name,
    required this.isToday,
    required this.isRest,
    required this.hasContent,
  });

  final String label;
  final String name;
  final bool isToday;
  final bool isRest;
  final bool hasContent;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = isToday
        ? scheme.primary
        : hasContent && !isRest
            ? scheme.primaryContainer
            : Colors.transparent;
    final fg = isToday
        ? scheme.onPrimary
        : scheme.onSurface.withValues(alpha: hasContent ? 0.8 : 0.3);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            border: hasContent && !isToday
                ? Border.all(
                    color: scheme.primary.withValues(alpha: 0.4), width: 1.5)
                : null,
          ),
          child: Center(
            child: Text(
              label.substring(0, 1),
              style: AppTypography.bodySemiBold
                  .copyWith(color: fg, fontSize: 13),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTypography.caption
              .copyWith(color: scheme.onSurface.withValues(alpha: 0.4)),
        ),
      ],
    );
  }
}

class _TodayCard extends StatelessWidget {
  const _TodayCard({this.planDay});
  final WorkoutPlanDayData? planDay;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (planDay == null) {
      return IronLogCard(
        child: Row(
          children: [
            Icon(Icons.hotel, color: scheme.onSurface.withValues(alpha: 0.4)),
            const SizedBox(width: 12),
            Text('Rest day — no session planned',
                style: AppTypography.body
                    .copyWith(color: scheme.onSurface.withValues(alpha: 0.5))),
          ],
        ),
      );
    }

    if (planDay!.isRestDay) {
      return IronLogCard(
        child: Row(
          children: [
            Icon(Icons.hotel, color: scheme.primary.withValues(alpha: 0.7)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(planDay!.name,
                      style: AppTypography.bodySemiBold
                          .copyWith(color: scheme.onSurface)),
                  Text('Rest & recovery',
                      style: AppTypography.caption.copyWith(
                          color:
                              scheme.onSurface.withValues(alpha: 0.5))),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return IronLogCard(
      child: Row(
        children: [
          Icon(Icons.fitness_center, color: scheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(planDay!.name,
                    style: AppTypography.bodySemiBold
                        .copyWith(color: scheme.onSurface)),
                Text("Today's session",
                    style: AppTypography.caption.copyWith(
                        color: scheme.primary)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard({required this.day, required this.isToday});
  final WorkoutPlanDayData day;
  final bool isToday;

  static const _dayNames = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday',
    'Friday', 'Saturday', 'Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final dayName = day.dayOfWeek < _dayNames.length
        ? _dayNames[day.dayOfWeek]
        : 'Day ${day.dayOfWeek + 1}';

    return IronLogCard(
      elevated: isToday,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              dayName.substring(0, 3).toUpperCase(),
              style: AppTypography.caption.copyWith(
                color: isToday
                    ? scheme.primary
                    : scheme.onSurface.withValues(alpha: 0.4),
                fontWeight: isToday ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              day.name,
              style: AppTypography.body.copyWith(color: scheme.onSurface),
            ),
          ),
          if (day.isRestDay)
            Icon(Icons.hotel,
                size: 16,
                color: scheme.onSurface.withValues(alpha: 0.35))
          else
            Icon(Icons.fitness_center,
                size: 16,
                color: scheme.primary.withValues(alpha: 0.7)),
        ],
      ),
    );
  }
}
