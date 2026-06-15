import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_typography.dart';
import '../../services/voice_service.dart';

/// Mic FAB that opens a voice-capture overlay on tap.
/// Calls [onResult] with the final recognized text when the user stops speaking
/// or taps the mic again. Requires the VoiceService to be initialized.
class VoiceInputFab extends ConsumerStatefulWidget {
  const VoiceInputFab({
    super.key,
    required this.onResult,
  });

  final void Function(String text) onResult;

  @override
  ConsumerState<VoiceInputFab> createState() => _VoiceInputFabState();
}

class _VoiceInputFabState extends ConsumerState<VoiceInputFab>
    with SingleTickerProviderStateMixin {
  bool _listening = false;
  String _partial = '';
  late AnimationController _pulseCtrl;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  Future<void> _toggleListening() async {
    final voice = ref.read(voiceServiceProvider);

    if (_listening) {
      await voice.stopListening();
      _pulseCtrl.stop();
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
        setState(() => _partial = text);
        if (isFinal && text.isNotEmpty) {
          _pulseCtrl.stop();
          setState(() {
            _listening = false;
            _partial = '';
          });
          widget.onResult(text);
        }
      },
    );

    if (mounted) {
      setState(() => _listening = true);
      _pulseCtrl.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (!_listening) {
      return FloatingActionButton(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        onPressed: _toggleListening,
        child: const Icon(Icons.mic),
      );
    }

    // Listening overlay anchored to a FAB-like button.
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Recognized text bubble
        if (_partial.isNotEmpty)
          Container(
            constraints: const BoxConstraints(maxWidth: 240),
            margin: const EdgeInsets.only(bottom: 8),
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              _partial,
              style: AppTypography.body.copyWith(color: scheme.onSurface),
            ),
          ),
        // Animated mic button
        AnimatedBuilder(
          animation: _pulseCtrl,
          builder: (_, child) => Transform.scale(
            scale: 1.0 + _pulseCtrl.value * 0.12,
            child: child,
          ),
          child: FloatingActionButton(
            backgroundColor: scheme.error,
            foregroundColor: scheme.onError,
            onPressed: _toggleListening,
            child: const Icon(Icons.mic_off),
          ),
        ),
      ],
    );
  }
}
