import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/utils/preferences_provider.dart';

part 'gemma_service.g.dart';

/// Thrown when generation is requested but the model isn't downloaded/loaded.
/// Callers (parser, insights) catch this and fall back gracefully.
class GemmaNotReadyException implements Exception {
  const GemmaNotReadyException([this.message = 'AI model not loaded.']);
  final String message;
  @override
  String toString() => 'GemmaNotReadyException: $message';
}

/// SharedPreferences key for the user-installed model file path.
const kModelFilePathKey = 'model_file_path';

/// Singleton wrapper around the MediaPipe LLM Inference API (flutter_gemma).
/// Supports two install modes:
///   1. File-picker install — user picks any .task/.litertlm/.bin file on device.
///      Path is stored in SharedPreferences; model loaded via ModelSource.file().
///   2. HuggingFace download — flutter_gemma downloads with a user token.
///
/// Both .task and .litertlm formats work with ModelFileType.task (flutter_gemma
/// 0.12.x handles both via the same MediaPipe backend).
class GemmaService {
  GemmaService([this._installedFilePath]);

  /// Absolute path to an installed model file, or null if not installed.
  final String? _installedFilePath;

  InferenceModel? _model;
  bool _initializing = false;

  bool get isInitialized => _model != null;

  String get notReadyMessage =>
      'AI model not loaded. Go to Settings → Install AI Model.';

  Future<bool> get isModelDownloaded async {
    final path = _installedFilePath;
    if (path != null && path.isNotEmpty) {
      return File(path).existsSync();
    }
    // Check if a model was previously installed via the HF downloader.
    try {
      return FlutterGemma.hasActiveModel();
    } catch (_) {
      return false;
    }
  }

  /// Loads the model. Throws [GemmaNotReadyException] if not installed.
  Future<void> initialize(
      {PreferredBackend backend = PreferredBackend.gpu}) async {
    if (_model != null || _initializing) return;
    if (!await isModelDownloaded) throw const GemmaNotReadyException();

    _initializing = true;
    try {
      final path = _installedFilePath;
      if (path != null && path.isNotEmpty) {
        // Register external file with the new API (idempotent, no copying).
        await FlutterGemma.installModel(
          modelType: ModelType.gemmaIt,
          fileType: ModelFileType.task,
        ).fromFile(path).install();
      }
      _model = await FlutterGemma.getActiveModel(
        maxTokens: 1024,
        preferredBackend: backend,
      );
    } finally {
      _initializing = false;
    }
  }

  /// Full (non-streaming) generation. Low temperature for deterministic parsing.
  Future<String> generate(String prompt, {int maxTokens = 512}) async {
    final session = await _openSession();
    try {
      await session.addQueryChunk(Message.text(text: prompt));
      final out = await session.getResponse();
      return out.trim();
    } finally {
      await session.close();
    }
  }

  /// Streaming generation (token chunks) for live UI such as insights.
  Stream<String> generateStream(String prompt) async* {
    final session = await _openSession();
    try {
      await session.addQueryChunk(Message.text(text: prompt));
      yield* session.getResponseAsync();
    } finally {
      await session.close();
    }
  }

  Future<InferenceModelSession> _openSession() async {
    final model = _model;
    if (model == null) throw const GemmaNotReadyException();
    return model.createSession(temperature: 0.2, topK: 40, topP: 0.9);
  }

  Future<void> dispose() async {
    await _model?.close();
    _model = null;
  }
}

/// App-lifetime AI engine (CLAUDE.md §4 — keepAlive).
/// Reads the installed model path from SharedPreferences so the correct
/// ModelSource is used without copying large files.
@Riverpod(keepAlive: true)
GemmaService gemmaService(Ref ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  final filePath = prefs.getString(kModelFilePathKey);
  final service = GemmaService(filePath);
  ref.onDispose(service.dispose);
  return service;
}

/// Kicks off Gemma initialization in the background on app start.
/// Returns true when the model is ready, false if not installed, throws on error.
/// Kept alive so initialization only happens once per session.
@Riverpod(keepAlive: true)
Future<bool> gemmaInit(Ref ref) async {
  final gemma = ref.read(gemmaServiceProvider);
  if (!await gemma.isModelDownloaded) {
    debugPrint('[IronLog] Gemma: no model installed — AI fallbacks active');
    return false;
  }
  try {
    await gemma.initialize();
    debugPrint('[IronLog] Gemma: model loaded and ready');
    return true;
  } catch (e, st) {
    debugPrint('[IronLog] Gemma: initialization failed — $e\n$st');
    rethrow;
  }
}
