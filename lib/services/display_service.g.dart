// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(displayService)
final displayServiceProvider = DisplayServiceProvider._();

final class DisplayServiceProvider
    extends $FunctionalProvider<DisplayService, DisplayService, DisplayService>
    with $Provider<DisplayService> {
  DisplayServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'displayServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$displayServiceHash();

  @$internal
  @override
  $ProviderElement<DisplayService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DisplayService create(Ref ref) {
    return displayService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DisplayService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DisplayService>(value),
    );
  }
}

String _$displayServiceHash() => r'312e58fb89b4e202753b6792816cca08449a7a6a';
