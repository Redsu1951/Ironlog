// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_parser.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// AI parser bound to the shared GemmaService.

@ProviderFor(workoutParser)
final workoutParserProvider = WorkoutParserProvider._();

/// AI parser bound to the shared GemmaService.

final class WorkoutParserProvider
    extends $FunctionalProvider<WorkoutParser, WorkoutParser, WorkoutParser>
    with $Provider<WorkoutParser> {
  /// AI parser bound to the shared GemmaService.
  WorkoutParserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'workoutParserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$workoutParserHash();

  @$internal
  @override
  $ProviderElement<WorkoutParser> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WorkoutParser create(Ref ref) {
    return workoutParser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkoutParser value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkoutParser>(value),
    );
  }
}

String _$workoutParserHash() => r'2b16b43c5016d3884f48e561e6d348bc7f868850';
