// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemma_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// App-lifetime AI engine (CLAUDE.md §4 — keepAlive).
/// Reads the installed model path from SharedPreferences so the correct
/// ModelSource is used without copying large files.

@ProviderFor(gemmaService)
final gemmaServiceProvider = GemmaServiceProvider._();

/// App-lifetime AI engine (CLAUDE.md §4 — keepAlive).
/// Reads the installed model path from SharedPreferences so the correct
/// ModelSource is used without copying large files.

final class GemmaServiceProvider
    extends $FunctionalProvider<GemmaService, GemmaService, GemmaService>
    with $Provider<GemmaService> {
  /// App-lifetime AI engine (CLAUDE.md §4 — keepAlive).
  /// Reads the installed model path from SharedPreferences so the correct
  /// ModelSource is used without copying large files.
  GemmaServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'gemmaServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$gemmaServiceHash();

  @$internal
  @override
  $ProviderElement<GemmaService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GemmaService create(Ref ref) {
    return gemmaService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GemmaService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GemmaService>(value),
    );
  }
}

String _$gemmaServiceHash() => r'e7b00c2fa9f83574fd16461a56d02c88dcf27a03';

/// Kicks off Gemma initialization in the background on app start.
/// Returns true when the model is ready, false if not installed, throws on error.
/// Kept alive so initialization only happens once per session.

@ProviderFor(gemmaInit)
final gemmaInitProvider = GemmaInitProvider._();

/// Kicks off Gemma initialization in the background on app start.
/// Returns true when the model is ready, false if not installed, throws on error.
/// Kept alive so initialization only happens once per session.

final class GemmaInitProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Kicks off Gemma initialization in the background on app start.
  /// Returns true when the model is ready, false if not installed, throws on error.
  /// Kept alive so initialization only happens once per session.
  GemmaInitProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'gemmaInitProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$gemmaInitHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return gemmaInit(ref);
  }
}

String _$gemmaInitHash() => r'f35631cc6b98a1f9db647397068ab2bed609c35d';
