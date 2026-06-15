// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Watches the active plan and its days.

@ProviderFor(activePlan)
final activePlanProvider = ActivePlanProvider._();

/// Watches the active plan and its days.

final class ActivePlanProvider extends $FunctionalProvider<
        AsyncValue<ActivePlanSummary>,
        ActivePlanSummary,
        FutureOr<ActivePlanSummary>>
    with
        $FutureModifier<ActivePlanSummary>,
        $FutureProvider<ActivePlanSummary> {
  /// Watches the active plan and its days.
  ActivePlanProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'activePlanProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$activePlanHash();

  @$internal
  @override
  $FutureProviderElement<ActivePlanSummary> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ActivePlanSummary> create(Ref ref) {
    return activePlan(ref);
  }
}

String _$activePlanHash() => r'9a15adcd4365ac81abc89e8837bef6b38d696864';
