// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_download_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(modelDownloadService)
final modelDownloadServiceProvider = ModelDownloadServiceProvider._();

final class ModelDownloadServiceProvider extends $FunctionalProvider<
    ModelDownloadService,
    ModelDownloadService,
    ModelDownloadService> with $Provider<ModelDownloadService> {
  ModelDownloadServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'modelDownloadServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$modelDownloadServiceHash();

  @$internal
  @override
  $ProviderElement<ModelDownloadService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ModelDownloadService create(Ref ref) {
    return modelDownloadService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModelDownloadService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModelDownloadService>(value),
    );
  }
}

String _$modelDownloadServiceHash() =>
    r'fc30f98f208e33f672b4092d643b1baaaaa586ef';
