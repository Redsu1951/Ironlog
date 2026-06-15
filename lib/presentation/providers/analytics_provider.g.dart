// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AnalyticsNotifier)
final analyticsProvider = AnalyticsNotifierProvider._();

final class AnalyticsNotifierProvider
    extends $AsyncNotifierProvider<AnalyticsNotifier, AnalyticsSummary> {
  AnalyticsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'analyticsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$analyticsNotifierHash();

  @$internal
  @override
  AnalyticsNotifier create() => AnalyticsNotifier();
}

String _$analyticsNotifierHash() => r'ec163683cf3dd1b400e3a80827ac0e09d81d9696';

abstract class _$AnalyticsNotifier extends $AsyncNotifier<AnalyticsSummary> {
  FutureOr<AnalyticsSummary> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<AnalyticsSummary>, AnalyticsSummary>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<AnalyticsSummary>, AnalyticsSummary>,
        AsyncValue<AnalyticsSummary>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

/// Volume history for a single exercise (family provider).

@ProviderFor(exerciseVolumeHistory)
final exerciseVolumeHistoryProvider = ExerciseVolumeHistoryFamily._();

/// Volume history for a single exercise (family provider).

final class ExerciseVolumeHistoryProvider extends $FunctionalProvider<
        AsyncValue<List<VolumeDataPoint>>,
        List<VolumeDataPoint>,
        FutureOr<List<VolumeDataPoint>>>
    with
        $FutureModifier<List<VolumeDataPoint>>,
        $FutureProvider<List<VolumeDataPoint>> {
  /// Volume history for a single exercise (family provider).
  ExerciseVolumeHistoryProvider._(
      {required ExerciseVolumeHistoryFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'exerciseVolumeHistoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$exerciseVolumeHistoryHash();

  @override
  String toString() {
    return r'exerciseVolumeHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<VolumeDataPoint>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<VolumeDataPoint>> create(Ref ref) {
    final argument = this.argument as int;
    return exerciseVolumeHistory(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseVolumeHistoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exerciseVolumeHistoryHash() =>
    r'4b34ac16b230a49d79bc56c71582ba4dcbc33645';

/// Volume history for a single exercise (family provider).

final class ExerciseVolumeHistoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<VolumeDataPoint>>, int> {
  ExerciseVolumeHistoryFamily._()
      : super(
          retry: null,
          name: r'exerciseVolumeHistoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Volume history for a single exercise (family provider).

  ExerciseVolumeHistoryProvider call(
    int exerciseId,
  ) =>
      ExerciseVolumeHistoryProvider._(argument: exerciseId, from: this);

  @override
  String toString() => r'exerciseVolumeHistoryProvider';
}

/// Recent 50 workouts for the history screen.

@ProviderFor(workoutHistory)
final workoutHistoryProvider = WorkoutHistoryProvider._();

/// Recent 50 workouts for the history screen.

final class WorkoutHistoryProvider extends $FunctionalProvider<
        AsyncValue<List<Workout>>, List<Workout>, FutureOr<List<Workout>>>
    with $FutureModifier<List<Workout>>, $FutureProvider<List<Workout>> {
  /// Recent 50 workouts for the history screen.
  WorkoutHistoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'workoutHistoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$workoutHistoryHash();

  @$internal
  @override
  $FutureProviderElement<List<Workout>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Workout>> create(Ref ref) {
    return workoutHistory(ref);
  }
}

String _$workoutHistoryHash() => r'0bfd79dec7f44a16c02a03e040d851a5f472573d';
