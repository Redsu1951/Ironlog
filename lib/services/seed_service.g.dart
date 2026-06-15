// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// App-lifetime seeder bound to the shared [appDatabaseProvider].

@ProviderFor(seedService)
final seedServiceProvider = SeedServiceProvider._();

/// App-lifetime seeder bound to the shared [appDatabaseProvider].

final class SeedServiceProvider
    extends $FunctionalProvider<SeedService, SeedService, SeedService>
    with $Provider<SeedService> {
  /// App-lifetime seeder bound to the shared [appDatabaseProvider].
  SeedServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'seedServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$seedServiceHash();

  @$internal
  @override
  $ProviderElement<SeedService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SeedService create(Ref ref) {
    return seedService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SeedService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SeedService>(value),
    );
  }
}

String _$seedServiceHash() => r'eae3311a8e5defb9ead4a4e2d74f19106eef71f5';
