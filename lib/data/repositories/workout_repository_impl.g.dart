// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(workoutRepository)
final workoutRepositoryProvider = WorkoutRepositoryProvider._();

final class WorkoutRepositoryProvider extends $FunctionalProvider<
    WorkoutRepository,
    WorkoutRepository,
    WorkoutRepository> with $Provider<WorkoutRepository> {
  WorkoutRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'workoutRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$workoutRepositoryHash();

  @$internal
  @override
  $ProviderElement<WorkoutRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WorkoutRepository create(Ref ref) {
    return workoutRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkoutRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkoutRepository>(value),
    );
  }
}

String _$workoutRepositoryHash() => r'2f6e9840488872b9b42383a94ac9f7d99cd8c92f';
