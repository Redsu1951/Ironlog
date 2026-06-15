import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Animated shimmer skeleton for loading states.
class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    super.key,
    required this.child,
    this.enabled = true,
  });

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (!enabled) return child;

    return Shimmer.fromColors(
      baseColor: scheme.surfaceContainerHighest,
      highlightColor: scheme.surfaceContainerHigh,
      child: child,
    );
  }
}

/// Pre-built shimmer placeholder for a card-like block.
class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
    this.height = 80,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
