// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safety_checker.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(safetyChecker)
final safetyCheckerProvider = SafetyCheckerProvider._();

final class SafetyCheckerProvider
    extends $FunctionalProvider<SafetyChecker, SafetyChecker, SafetyChecker>
    with $Provider<SafetyChecker> {
  SafetyCheckerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'safetyCheckerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$safetyCheckerHash();

  @$internal
  @override
  $ProviderElement<SafetyChecker> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SafetyChecker create(Ref ref) {
    return safetyChecker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SafetyChecker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SafetyChecker>(value),
    );
  }
}

String _$safetyCheckerHash() => r'61a27b2aec9db39ead6da5953323792285243605';
