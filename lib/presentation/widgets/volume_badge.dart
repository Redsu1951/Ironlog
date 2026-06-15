import 'package:flutter/material.dart';

import '../../core/theme/app_typography.dart';

/// Compact badge displaying a total volume figure with its unit.
/// Rendered in InterMono (Space Mono) for stat alignment (CLAUDE.md §10).
class VolumeBadge extends StatelessWidget {
  const VolumeBadge({
    super.key,
    required this.volumeKg,
    required this.unit,
    this.label = 'Volume',
    this.large = false,
  });

  final double volumeKg;
  final String unit;
  final String label;
  final bool large;

  String get _displayValue {
    final v = unit == 'lbs' ? volumeKg * 2.20462 : volumeKg;
    return v >= 1000
        ? '${(v / 1000).toStringAsFixed(1)}k'
        : v == v.roundToDouble()
            ? v.toStringAsFixed(0)
            : v.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final style = large ? AppTypography.statLarge : AppTypography.stat;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$_displayValue $unit',
          style: style.copyWith(color: scheme.primary),
        ),
        Text(
          label,
          style: AppTypography.caption
              .copyWith(color: scheme.onSurface.withValues(alpha: 0.6)),
        ),
      ],
    );
  }
}
