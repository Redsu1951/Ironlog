import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/app_typography.dart';
import '../../domain/entities/workout_set.dart';

/// Displays one set in the active workout logger.
///
/// When [existingSet] is null the row renders as an editable input form.
/// When [existingSet] is non-null it renders as a completed-set tile with a
/// delete affordance. [previousSet] (from the last session) is shown in muted
/// text for reference in both modes.
class SetRowWidget extends StatefulWidget {
  const SetRowWidget({
    super.key,
    required this.setNumber,
    required this.workoutExerciseId,
    this.existingSet,
    this.previousSet,
    this.onLogSet,
    this.onDelete,
  });

  final int setNumber;
  final String workoutExerciseId;
  final WorkoutSet? existingSet;
  final WorkoutSet? previousSet;
  final void Function(int reps, double weight, String setType)? onLogSet;
  final void Function(String setId)? onDelete;

  @override
  State<SetRowWidget> createState() => _SetRowWidgetState();
}

class _SetRowWidgetState extends State<SetRowWidget> {
  late final TextEditingController _repsCtrl;
  late final TextEditingController _weightCtrl;
  String _setType = 'working';

  @override
  void initState() {
    super.initState();
    final prev = widget.previousSet;
    _repsCtrl = TextEditingController(
        text: prev != null ? '${prev.reps}' : '');
    _weightCtrl = TextEditingController(
        text: prev != null ? _fmt(prev.weight) : '');
    _setType = widget.existingSet?.setType ?? 'working';
  }

  @override
  void dispose() {
    _repsCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  String _fmt(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);

  void _confirm() {
    final reps = int.tryParse(_repsCtrl.text.trim());
    final weight = double.tryParse(_weightCtrl.text.trim());
    if (reps == null || reps <= 0 || weight == null || weight < 0) return;
    widget.onLogSet?.call(reps, weight, _setType);
  }

  @override
  Widget build(BuildContext context) {
    final existing = widget.existingSet;
    return existing != null
        ? _CompletedRow(
            set: existing,
            previousSet: widget.previousSet,
            onDelete: widget.onDelete,
          )
        : _InputRow(
            setNumber: widget.setNumber,
            previousSet: widget.previousSet,
            repsCtrl: _repsCtrl,
            weightCtrl: _weightCtrl,
            setType: _setType,
            onSetTypeChanged: (t) => setState(() => _setType = t),
            onConfirm: _confirm,
          );
  }
}

// ── Completed set ────────────────────────────────────────────────────────────

class _CompletedRow extends StatelessWidget {
  const _CompletedRow({
    required this.set,
    this.previousSet,
    this.onDelete,
  });

  final WorkoutSet set;
  final WorkoutSet? previousSet;
  final void Function(String setId)? onDelete;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final prev = previousSet;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          // Set number chip
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: scheme.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${set.setNumber}',
                style: AppTypography.caption.copyWith(color: scheme.primary),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Previous context
          if (prev != null)
            Text(
              '${prev.reps}×${_fmt(prev.weight)}${prev.weightUnit}',
              style: AppTypography.caption
                  .copyWith(color: scheme.onSurface.withValues(alpha: 0.35)),
            )
          else
            Text('—',
                style: AppTypography.caption
                    .copyWith(color: scheme.onSurface.withValues(alpha: 0.2))),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, size: 12),
          const SizedBox(width: 12),
          // Logged values
          Text(
            '${set.reps} × ${_fmt(set.weight)} ${set.weightUnit}',
            style: AppTypography.statSmall.copyWith(color: scheme.onSurface),
          ),
          if (set.setType != 'working') ...[
            const SizedBox(width: 8),
            _SetTypeChip(setType: set.setType, scheme: scheme),
          ],
          const Spacer(),
          // Checkmark
          Icon(Icons.check_circle_outline, color: scheme.primary, size: 18),
          const SizedBox(width: 4),
          // Delete
          GestureDetector(
            onTap: () => onDelete?.call(set.id),
            child: Icon(Icons.close,
                size: 16,
                color: scheme.onSurface.withValues(alpha: 0.4)),
          ),
        ],
      ),
    );
  }

  String _fmt(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);
}

// ── Input row ────────────────────────────────────────────────────────────────

class _InputRow extends StatelessWidget {
  const _InputRow({
    required this.setNumber,
    required this.repsCtrl,
    required this.weightCtrl,
    required this.setType,
    required this.onSetTypeChanged,
    required this.onConfirm,
    this.previousSet,
  });

  final int setNumber;
  final WorkoutSet? previousSet;
  final TextEditingController repsCtrl;
  final TextEditingController weightCtrl;
  final String setType;
  final void Function(String) onSetTypeChanged;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final prev = previousSet;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: scheme.primary.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        children: [
          // Set number
          SizedBox(
            width: 24,
            child: Text(
              '$setNumber',
              style: AppTypography.caption
                  .copyWith(color: scheme.onSurface.withValues(alpha: 0.5)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          // Previous hint
          if (prev != null)
            Text(
              '${prev.reps}×${_fmt(prev.weight)}',
              style: AppTypography.caption
                  .copyWith(color: scheme.onSurface.withValues(alpha: 0.35)),
            ),
          const Spacer(),
          // Reps field
          SizedBox(
            width: 52,
            child: _NumField(
              controller: repsCtrl,
              hint: 'Reps',
              isDecimal: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('×',
                style: AppTypography.body
                    .copyWith(color: scheme.onSurface.withValues(alpha: 0.5))),
          ),
          // Weight field
          SizedBox(
            width: 64,
            child: _NumField(
              controller: weightCtrl,
              hint: 'Weight',
              isDecimal: true,
            ),
          ),
          const SizedBox(width: 8),
          // Set type
          _SetTypeChip(
            setType: setType,
            scheme: scheme,
            onTap: () => _showTypePicker(context),
          ),
          const SizedBox(width: 8),
          // Confirm
          GestureDetector(
            onTap: onConfirm,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: scheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check,
                  size: 18, color: scheme.onPrimary),
            ),
          ),
        ],
      ),
    );
  }

  String _fmt(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);

  void _showTypePicker(BuildContext context) {
    showModalBottomSheet<String>(
      context: context,
      builder: (_) => _SetTypePicker(current: setType),
    ).then((t) {
      if (t != null) onSetTypeChanged(t);
    });
  }
}

// ── Helper widgets ───────────────────────────────────────────────────────────

class _NumField extends StatelessWidget {
  const _NumField({
    required this.controller,
    required this.hint,
    required this.isDecimal,
  });

  final TextEditingController controller;
  final String hint;
  final bool isDecimal;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      keyboardType:
          TextInputType.numberWithOptions(decimal: isDecimal, signed: false),
      inputFormatters: isDecimal
          ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
          : [FilteringTextInputFormatter.digitsOnly],
      style: AppTypography.statSmall.copyWith(color: scheme.onSurface),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTypography.caption
            .copyWith(color: scheme.onSurface.withValues(alpha: 0.3)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: scheme.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        isDense: true,
      ),
    );
  }
}

class _SetTypeChip extends StatelessWidget {
  const _SetTypeChip({
    required this.setType,
    required this.scheme,
    this.onTap,
  });

  final String setType;
  final ColorScheme scheme;
  final VoidCallback? onTap;

  static const _labels = {
    'working': 'W',
    'warmup': 'WU',
    'dropset': 'DS',
    'amrap': 'A',
    'failure': 'F',
  };

  static const _colors = {
    'working': Colors.blue,
    'warmup': Colors.orange,
    'dropset': Colors.purple,
    'amrap': Colors.red,
    'failure': Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    final color = _colors[setType] ?? Colors.blue;
    final label = _labels[setType] ?? setType.substring(0, 1).toUpperCase();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: AppTypography.caption.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _SetTypePicker extends StatelessWidget {
  const _SetTypePicker({required this.current});
  final String current;

  static const _types = [
    ('working', 'Working Set'),
    ('warmup', 'Warm-up'),
    ('dropset', 'Drop Set'),
    ('amrap', 'AMRAP'),
    ('failure', 'To Failure'),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _types
            .map(
              (t) => ListTile(
                title: Text(t.$2),
                leading: Icon(
                  t.$1 == current
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: t.$1 == current ? scheme.primary : null,
                ),
                onTap: () => Navigator.pop(context, t.$1),
              ),
            )
            .toList(),
      ),
    );
  }
}
