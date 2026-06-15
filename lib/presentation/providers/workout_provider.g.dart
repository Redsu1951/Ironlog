// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WorkoutNotifier)
final workoutProvider = WorkoutNotifierProvider._();

final class WorkoutNotifierProvider
    extends $NotifierProvider<WorkoutNotifier, WorkoutState> {
  WorkoutNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'workoutProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$workoutNotifierHash();

  @$internal
  @override
  WorkoutNotifier create() => WorkoutNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkoutState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkoutState>(value),
    );
  }
}

String _$workoutNotifierHash() => r'18ab5d2ad2213610c36aac1e44652c98c5f92c83';

abstract class _$WorkoutNotifier extends $Notifier<WorkoutState> {
  WorkoutState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WorkoutState, WorkoutState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<WorkoutState, WorkoutState>,
        WorkoutState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
