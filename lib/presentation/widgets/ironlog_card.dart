import 'package:flutter/material.dart';

/// IronLog surface card — wraps content in the themed surface color with
/// consistent 12px radius and 16px padding.
class IronLogCard extends StatelessWidget {
  const IronLogCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.elevated = false,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  /// Uses surfaceVariant color for a slightly raised appearance.
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg =
        elevated ? scheme.surfaceContainerHighest : scheme.surfaceContainer;

    Widget content = Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: padding ?? const EdgeInsets.all(16),
      child: child,
    );

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: content,
      );
    }

    return content;
  }
}
