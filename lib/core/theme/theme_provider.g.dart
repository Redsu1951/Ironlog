// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds theme settings, persisting every change to SharedPreferences so the
/// choice survives restarts. Global (keepAlive) — the whole app reads it.

@ProviderFor(ThemeNotifier)
final themeProvider = ThemeNotifierProvider._();

/// Holds theme settings, persisting every change to SharedPreferences so the
/// choice survives restarts. Global (keepAlive) — the whole app reads it.
final class ThemeNotifierProvider
    extends $NotifierProvider<ThemeNotifier, ThemeState> {
  /// Holds theme settings, persisting every change to SharedPreferences so the
  /// choice survives restarts. Global (keepAlive) — the whole app reads it.
  ThemeNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'themeProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$themeNotifierHash();

  @$internal
  @override
  ThemeNotifier create() => ThemeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeState>(value),
    );
  }
}

String _$themeNotifierHash() => r'90c6365a21ce4d99ac74552084838309bf448a87';

/// Holds theme settings, persisting every change to SharedPreferences so the
/// choice survives restarts. Global (keepAlive) — the whole app reads it.

abstract class _$ThemeNotifier extends $Notifier<ThemeState> {
  ThemeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeState, ThemeState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ThemeState, ThemeState>, ThemeState, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
