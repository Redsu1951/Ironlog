// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insights_engine.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(insightsEngine)
final insightsEngineProvider = InsightsEngineProvider._();

final class InsightsEngineProvider
    extends $FunctionalProvider<InsightsEngine, InsightsEngine, InsightsEngine>
    with $Provider<InsightsEngine> {
  InsightsEngineProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'insightsEngineProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$insightsEngineHash();

  @$internal
  @override
  $ProviderElement<InsightsEngine> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InsightsEngine create(Ref ref) {
    return insightsEngine(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InsightsEngine value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InsightsEngine>(value),
    );
  }
}

String _$insightsEngineHash() => r'f55bc6d6c026a48f9e0ab5fa5a404f459d9b2397';
