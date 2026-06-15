import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'voice_service.g.dart';

class VoiceService {
  final _stt = SpeechToText();
  bool _initialized = false;
  String? _bestLocale;

  bool get isAvailable => _initialized && _stt.isAvailable;
  bool get isListening => _stt.isListening;

  Future<bool> initialize() async {
    if (_initialized) return _stt.isAvailable;
    _initialized = await _stt.initialize(
      onError: (e) => debugPrint('[IronLog] STT error: ${e.errorMsg}'),
      onStatus: (s) => debugPrint('[IronLog] STT status: $s'),
    );
    if (_initialized) {
      // Pick the best available locale — prefer en_US/en_GB; fall back to
      // whatever the device has. This handles non-US English accents better
      // than hardcoding en_US.
      final locales = await _stt.locales();
      const preferred = ['en_US', 'en_GB', 'en_AU', 'en_IN', 'en_CA'];
      for (final p in preferred) {
        if (locales.any((l) => l.localeId == p)) {
          _bestLocale = p;
          break;
        }
      }
      _bestLocale ??= locales.firstOrNull?.localeId;
      debugPrint('[IronLog] STT using locale: $_bestLocale');
    }
    return _initialized;
  }

  Future<void> startListening({
    required void Function(String text, bool isFinal) onResult,
  }) async {
    if (!isAvailable) return;
    await _stt.listen(
      onResult: (SpeechRecognitionResult r) =>
          onResult(r.recognizedWords, r.finalResult),
      listenOptions: SpeechListenOptions(
        listenMode: ListenMode.dictation,
        partialResults: true,
        // 5 s gap before auto-stop — gym environments are noisy and users
        // often pause mid-sentence (e.g. "bench press... 3 sets... 225 pounds").
        pauseFor: const Duration(seconds: 5),
        localeId: _bestLocale,
        // Prefer on-device STT so it works offline.
        onDevice: true,
      ),
    );
  }

  Future<void> stopListening() => _stt.stop();
  Future<void> cancel() => _stt.cancel();
}

@Riverpod(keepAlive: true)
VoiceService voiceService(Ref ref) => VoiceService();
