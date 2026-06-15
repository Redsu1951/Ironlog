import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/theme/app_typography.dart';

/// Countdown rest timer — push notification integration in Phase 8.
class RestTimerWidget extends StatefulWidget {
  const RestTimerWidget({
    super.key,
    this.initialSeconds = 90,
    this.onComplete,
  });

  final int initialSeconds;
  final VoidCallback? onComplete;

  @override
  State<RestTimerWidget> createState() => _RestTimerWidgetState();
}

class _RestTimerWidgetState extends State<RestTimerWidget> {
  late int _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.initialSeconds;
    _start();
  }

  void _start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining <= 0) {
        _timer?.cancel();
        widget.onComplete?.call();
        return;
      }
      setState(() => _remaining--);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _label {
    final m = _remaining ~/ 60;
    final s = _remaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fraction = _remaining / widget.initialSeconds;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_label,
            style: AppTypography.statLarge.copyWith(color: scheme.primary)),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: fraction,
          color: scheme.primary,
          backgroundColor: scheme.surfaceContainerHighest,
        ),
      ],
    );
  }
}
