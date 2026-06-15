import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/constants/app_constants.dart';

part 'model_download_service.g.dart';

/// Downloads the Gemma model with progress. Delegates the actual fetch to
/// flutter_gemma's ModelFileManager (no runtime HTTP package). Emits 0.0 → 1.0.
/// Used only when the user chooses the direct-download path on the install screen.
class ModelDownloadService {
  ModelDownloadService();

  bool _cancelled = false;

  ModelFileManager get _manager => FlutterGemmaPlugin.instance.modelManager;

  static InferenceModelSpec get _spec => InferenceModelSpec.fromLegacyUrl(
        name: AppConstants.gemmaModelFilename,
        modelUrl: AppConstants.gemmaModelUrl,
        modelType: ModelType.gemmaIt,
        fileType: ModelFileType.task,
      );

  /// Streams download progress as a fraction in [0.0, 1.0].
  Stream<double> downloadModel({String? hfToken}) async* {
    _cancelled = false;
    yield 0.0;
    await for (final p in _manager.downloadModelWithProgress(
      _spec,
      token: hfToken,
    )) {
      if (_cancelled) return;
      yield (p.overallProgress.clamp(0, 100)) / 100.0;
    }
    if (!_cancelled) yield 1.0;
  }

  void cancelDownload() => _cancelled = true;
}

@Riverpod(keepAlive: true)
ModelDownloadService modelDownloadService(Ref ref) => ModelDownloadService();
