// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Auth guard: unauthenticated users accessing protected routes are sent to
/// /onboarding. SplashScreen itself drives the initial redirect after checking
/// SharedPreferences. See CLAUDE.md §11.

@ProviderFor(router)
final routerProvider = RouterProvider._();

/// Auth guard: unauthenticated users accessing protected routes are sent to
/// /onboarding. SplashScreen itself drives the initial redirect after checking
/// SharedPreferences. See CLAUDE.md §11.

final class RouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Auth guard: unauthenticated users accessing protected routes are sent to
  /// /onboarding. SplashScreen itself drives the initial redirect after checking
  /// SharedPreferences. See CLAUDE.md §11.
  RouterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'routerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'b8f6445bc538cef8baee542d000e276c2c1f0605';
