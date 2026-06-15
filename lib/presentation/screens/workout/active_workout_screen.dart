import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/exercise.dart';
import '../../../services/notification_service.dart';
import '../../providers/auth_provider.dart';
import '../../providers/workout_provider.dart';
import '../../../services/voice_service.dart';
import '../../widgets/volume_badge.dart';
import '../../widgets/set_row_widget.dart';

/// Active workout session screen (CLAUDE.md §5 active_workout_screen.dart).
///
/// Responsibilities:
/// - Auto-starts an ad-hoc workout on first open if none is active.
/// - Shows elapsed timer, live total volume, and a per-exercise set logger.
/// - Supports NL text + voice input for logging sets without manual entry.
/// - Starts a rest timer after each logged set with push notification.
class ActiveWorkoutScreen extends ConsumerStatefulWidget {
  const ActiveWorkoutScreen({super.key});

  @override
  ConsumerState<ActiveWorkoutScreen> createState() =>
      _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends ConsumerState<ActiveWorkoutScreen> {
  Timer? _ticker;
  bool _starting = false;
  final _nlCtrl = TextEditingController();
  String? _nlError;
  bool _nlParsing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _ensureWorkout());
    // Tick every second to update elapsed timer and rest countdown.
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
        _checkRestDone();
      }
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _nlCtrl.dispose();
    super.dispose();
  }

  Future<void> _ensureWorkout() async {
    final state = ref.read(workoutProvider);
    if (!state.isActive) {
      if (mounted) setState(() => _starting = true);
      await ref.read(workoutProvider.notifier).startAdHoc('Quick Workout');
      if (mounted) setState(() => _starting = false);
    }
  }

  void _checkRestDone() {
    final state = ref.read(workoutProvider);
    if (state.isResting && state.restRemainingSeconds == 0) {
      ref.read(workoutProvider.notifier).stopRest();
      ref
          .read(notificationServiceProvider)
          .showRestComplete(state.restDurationSecs);
    }
  }

  Future<void> _addExercise() async {
    final exercise =
        await context.push<Exercise>('/workout/exercise-picker');
    if (exercise != null && mounted) {
      await ref.read(workoutProvider.notifier).addExercise(exercise);
    }
  }

  Future<void> _logSet(
    String workoutExerciseId,
    int reps,
    double weight,
    String setType,
  ) async {
    await ref
        .read(workoutProvider.notifier)
        .logSet(workoutExerciseId, reps, weight, setType: setType);
    ref.read(workoutProvider.notifier).startRest();
  }

  Future<void> _submitNl() async {
    final text = _nlCtrl.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _nlParsing = true;
      _nlError = null;
    });
    final error =
        await ref.read(workoutProvider.notifier).parseAndLog(text);
    if (mounted) {
      setState(() {
        _nlParsing = false;
        _nlError = error;
      });
      if (error == null) {
        _nlCtrl.clear();
        ref.read(workoutProvider.notifier).startRest();
      }
    }
  }

  Future<void> _endWorkout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Finish Workout?'),
        content: const Text('Your session will be saved.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Finish',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    ref.read(notificationServiceProvider).cancelRest();
    await ref.read(workoutProvider.notifier).end();
    if (mounted) context.go('/home');
  }

  String _fmtElapsed(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return h > 0 ? '$h:$m:$s' : '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    if (_starting) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final workout = ref.watch(workoutProvider);
    final scheme = Theme.of(context).colorScheme;
    final unit = ref.read(authProvider).preferredUnit;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        backgroundColor: scheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _endWorkout,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              workout.workoutName ?? 'Workout',
              style: AppTypography.button.copyWith(color: scheme.onSurface),
            ),
            Text(
              _fmtElapsed(workout.elapsed),
              style: AppTypography.caption
                  .copyWith(color: scheme.onSurface.withValues(alpha: 0.5)),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _endWorkout,
            child: Text(
              'FINISH',
              style: AppTypography.button.copyWith(color: scheme.primary),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Rest timer strip ─────────────────────────────────────────────
          if (workout.isResting)
            _RestTimerStrip(
              remaining: workout.restRemainingSeconds,
              total: workout.restDurationSecs,
              onSkip: () =>
                  ref.read(workoutProvider.notifier).stopRest(),
            ),

          // ── Volume summary ───────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                VolumeBadge(
                  volumeKg: workout.totalVolumeKg,
                  unit: unit,
                  label: 'Total Volume',
                ),
                const Spacer(),
                Text(
                  '${workout.exercises.length} exercise${workout.exercises.length == 1 ? '' : 's'}',
                  style: AppTypography.caption
                      .copyWith(color: scheme.onSurface.withValues(alpha: 0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── Exercise list ────────────────────────────────────────────────
          Expanded(
            child: CustomScrollView(
              slivers: [
                for (final exercise in workout.exercises)
                  _ExerciseSection(
                    exercise: exercise,
                    unit: unit,
                    onLogSet: (reps, weight, setType) =>
                        _logSet(exercise.workoutExerciseId, reps, weight, setType),
                    onDeleteSet: (setId) => ref
                        .read(workoutProvider.notifier)
                        .deleteSet(exercise.workoutExerciseId, setId),
                  ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: OutlinedButton.icon(
                      onPressed: _addExercise,
                      icon: const Icon(Icons.add),
                      label: const Text('Add Exercise'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        side: BorderSide(
                            color: scheme.primary.withValues(alpha: 0.5)),
                      ),
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 140)),
              ],
            ),
          ),

          // ── NL input bar (mic + text + send in one row) ──────────────────
          _NlInputBar(
            controller: _nlCtrl,
            error: _nlError,
            isParsing: _nlParsing,
            onSubmit: _submitNl,
          ),
        ],
      ),
    );
  }
}

// ── Rest timer strip ──────────────────────────────────────────────────────────

class _RestTimerStrip extends StatelessWidget {
  const _RestTimerStrip({
    required this.remaining,
    required this.total,
    required this.onSkip,
  });

  final int remaining;
  final int total;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final progress = total > 0 ? remaining / total : 0.0;

    return Container(
      color: scheme.primaryContainer.withValues(alpha: 0.7),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Icon(Icons.timer_outlined, size: 16, color: scheme.onPrimaryContainer),
          const SizedBox(width: 8),
          Text(
            'REST  ${remaining}s',
            style: AppTypography.caption
                .copyWith(color: scheme.onPrimaryContainer),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor:
                    scheme.onPrimaryContainer.withValues(alpha: 0.2),
                valueColor: AlwaysStoppedAnimation(scheme.onPrimaryContainer),
                minHeight: 4,
              ),
            ),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: onSkip,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(40, 24),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Skip',
              style: AppTypography.caption
                  .copyWith(color: scheme.onPrimaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Exercise section (Sliver) ─────────────────────────────────────────────────

class _ExerciseSection extends StatelessWidget {
  const _ExerciseSection({
    required this.exercise,
    required this.unit,
    required this.onLogSet,
    required this.onDeleteSet,
  });

  final ActiveExercise exercise;
  final String unit;
  final void Function(int reps, double weight, String setType) onLogSet;
  final void Function(String setId) onDeleteSet;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final nextSetNumber = exercise.sets.length + 1;
    final nextPrev = exercise.sets.length < exercise.previousSets.length
        ? exercise.previousSets[exercise.sets.length]
        : null;

    return SliverMainAxisGroup(slivers: [
      // Exercise header
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  exercise.exerciseName,
                  style: AppTypography.bodySemiBold
                      .copyWith(color: scheme.onSurface),
                ),
              ),
              if (exercise.totalVolume > 0)
                Text(
                  '${_fmt(exercise.totalVolume)} $unit',
                  style: AppTypography.caption
                      .copyWith(color: scheme.primary),
                ),
            ],
          ),
        ),
      ),
      // Previous-session header
      if (exercise.previousSets.isNotEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Previous session',
              style: AppTypography.caption
                  .copyWith(color: scheme.onSurface.withValues(alpha: 0.4)),
            ),
          ),
        ),
      // Completed sets
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, i) {
            final set = exercise.sets[i];
            final prev = i < exercise.previousSets.length
                ? exercise.previousSets[i]
                : null;
            return SetRowWidget(
              setNumber: set.setNumber,
              workoutExerciseId: exercise.workoutExerciseId,
              existingSet: set,
              previousSet: prev,
              onLogSet: (r, w, t) => onLogSet(r, w, t),
              onDelete: onDeleteSet,
            );
          },
          childCount: exercise.sets.length,
        ),
      ),
      // Input row for next set
      SliverToBoxAdapter(
        child: SetRowWidget(
          setNumber: nextSetNumber,
          workoutExerciseId: exercise.workoutExerciseId,
          previousSet: nextPrev,
          onLogSet: (r, w, t) => onLogSet(r, w, t),
          onDelete: null,
        ),
      ),
    ]);
  }

  String _fmt(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);
}

// ── NL input bar (text + send + mic in one row) ───────────────────────────────

class _NlInputBar extends ConsumerStatefulWidget {
  const _NlInputBar({
    required this.controller,
    required this.onSubmit,
    this.error,
    this.isParsing = false,
  });

  final TextEditingController controller;
  final VoidCallback onSubmit;
  final String? error;
  final bool isParsing;

  @override
  ConsumerState<_NlInputBar> createState() => _NlInputBarState();
}

class _NlInputBarState extends ConsumerState<_NlInputBar>
    with SingleTickerProviderStateMixin {
  bool _listening = false;
  late AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  Future<void> _toggleMic() async {
    final voice = ref.read(voiceServiceProvider);
    if (_listening) {
      await voice.stopListening();
      _pulse.stop();
      if (mounted) setState(() => _listening = false);
      return;
    }

    final ok = await voice.initialize();
    if (!ok) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Microphone not available')),
        );
      }
      return;
    }

    await voice.startListening(
      onResult: (text, isFinal) {
        if (!mounted) return;
        if (text.isNotEmpty) widget.controller.text = text;
        if (isFinal && text.isNotEmpty) {
          _pulse.stop();
          setState(() => _listening = false);
          widget.onSubmit();
        }
      },
    );

    if (mounted) {
      setState(() => _listening = true);
      _pulse.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      elevation: 8,
      child: Container(
        color: scheme.surface,
        padding: EdgeInsets.only(
          left: 16,
          right: 4,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom + 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  widget.error!,
                  style: AppTypography.caption.copyWith(color: scheme.error),
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    decoration: InputDecoration(
                      hintText: _listening
                          ? 'Listening…'
                          : 'e.g. 3 sets of 12 bench at 135 lbs',
                      hintStyle: AppTypography.caption.copyWith(
                          color: scheme.onSurface.withValues(alpha: 0.35)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: scheme.surfaceContainerHighest,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      isDense: true,
                    ),
                    style: AppTypography.body.copyWith(color: scheme.onSurface),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => widget.onSubmit(),
                  ),
                ),
                // Send
                if (widget.isParsing)
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                else
                  IconButton(
                    icon: Icon(Icons.send, color: scheme.primary),
                    onPressed: widget.onSubmit,
                    tooltip: 'Log',
                  ),
                // Mic
                AnimatedBuilder(
                  animation: _pulse,
                  builder: (_, child) => Transform.scale(
                    scale: 1.0 + _pulse.value * 0.08,
                    child: child,
                  ),
                  child: IconButton(
                    icon: Icon(
                      _listening ? Icons.mic_off : Icons.mic,
                      color: _listening ? scheme.error : scheme.primary,
                    ),
                    onPressed: _toggleMic,
                    tooltip: _listening ? 'Stop' : 'Voice input',
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
