import 'package:flutter_test/flutter_test.dart';
import 'package:ironlog/ai/gemma_service.dart';

/// Tests for GemmaService path/state logic — no actual model required.
/// These verify the service correctly reflects state without loading weights.
void main() {
  group('GemmaService state — no model file', () {
    late GemmaService svc;

    setUp(() => svc = GemmaService());

    test('isInitialized is false before initialize()', () {
      expect(svc.isInitialized, isFalse);
    });

    test('isModelDownloaded is false when path is null', () async {
      expect(await svc.isModelDownloaded, isFalse);
    });

    test('generate() throws GemmaNotReadyException when not initialized',
        () async {
      expect(
        () async => svc.generate('hello'),
        throwsA(isA<GemmaNotReadyException>()),
      );
    });

    test('generateStream() throws GemmaNotReadyException when not initialized',
        () async {
      expect(
        () async {
          await for (final _ in svc.generateStream('hello')) {}
        },
        throwsA(isA<GemmaNotReadyException>()),
      );
    });
  });

  group('GemmaService state — non-existent file path', () {
    late GemmaService svc;

    setUp(() => svc = GemmaService('/data/nonexistent/model.litertlm'));

    test('isModelDownloaded is false when file does not exist', () async {
      expect(await svc.isModelDownloaded, isFalse);
    });

    test('initialize() throws GemmaNotReadyException when file missing',
        () async {
      expect(
        () => svc.initialize(),
        throwsA(isA<GemmaNotReadyException>()),
      );
    });
  });

  group('GemmaNotReadyException', () {
    test('default message', () {
      const e = GemmaNotReadyException();
      expect(e.message, 'AI model not loaded.');
      expect(e.toString(), contains('GemmaNotReadyException'));
    });

    test('custom message', () {
      const e = GemmaNotReadyException('custom');
      expect(e.message, 'custom');
    });
  });
}
