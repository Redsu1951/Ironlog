// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the exercise catalogue list displayed in ExercisePickerScreen.
/// Works with domain Exercise entities (not raw Drift ExerciseData).

@ProviderFor(ExerciseNotifier)
final exerciseProvider = ExerciseNotifierProvider._();

/// Manages the exercise catalogue list displayed in ExercisePickerScreen.
/// Works with domain Exercise entities (not raw Drift ExerciseData).
final class ExerciseNotifierProvider
    extends $AsyncNotifierProvider<ExerciseNotifier, List<Exercise>> {
  /// Manages the exercise catalogue list displayed in ExercisePickerScreen.
  /// Works with domain Exercise entities (not raw Drift ExerciseData).
  ExerciseNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'exerciseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$exerciseNotifierHash();

  @$internal
  @override
  ExerciseNotifier create() => ExerciseNotifier();
}

String _$exerciseNotifierHash() => r'1723bd0750accf16c2d2470d27e21d6fdf3a63d4';

/// Manages the exercise catalogue list displayed in ExercisePickerScreen.
/// Works with domain Exercise entities (not raw Drift ExerciseData).

abstract class _$ExerciseNotifier extends $AsyncNotifier<List<Exercise>> {
  FutureOr<List<Exercise>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Exercise>>, List<Exercise>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Exercise>>, List<Exercise>>,
        AsyncValue<List<Exercise>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
