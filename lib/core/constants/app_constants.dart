/// Set to true after Firebase.initializeApp() succeeds in main.dart.
/// When false all Firebase-dependent features (sync, Google Sign-In) degrade
/// gracefully — the app runs fully offline (CLAUDE.md user decision §13).
bool kFirebaseAvailable = false;

/// App-wide constants: identity, versions, and external resource locations.
abstract final class AppConstants {
  static const String appName = 'IronLog';
  static const String packageId = 'com.ironlog.app';
  static const String version = '1.0.0';
  static const int buildNumber = 1;

  // ── wger (seeding only — dev-time; see scripts/download_wger_data.dart) ──
  static const String wgerBaseUrl = 'https://wger.de/api/v2';

  // ── On-device AI model (CLAUDE.md §3) ───────────────────────────────────
  /// Hugging Face source for the MediaPipe Gemma E2B INT4 GPU model.
  ///
  /// NOTE: update when Gemma 4 E2B is published to the MediaPipe registry. If it
  /// isn't yet available, a Gemma 3 .task model is a drop-in (identical runtime
  /// interface) — only this URL + [GemmaService.modelFilename] change. Most HF
  /// model files require an access token at download time.
  static const String gemmaModelUrl =
      'https://huggingface.co/google/gemma-4-e2b-it-mediapipe/resolve/main/gemma-4-e2b-it-gpu-int4.bin';

  /// Filename used by flutter_gemma's ModelFileManager and the file-copy installer.
  static const String gemmaModelFilename = 'gemma-4-e2b-it-gpu-int4.bin';

  /// Approximate on-disk size, shown in the download UI and Settings.
  static const String gemmaModelSizeLabel = '1.1 GB';
}
