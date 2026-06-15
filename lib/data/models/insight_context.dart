import 'package:freezed_annotation/freezed_annotation.dart';

part 'insight_context.freezed.dart';

/// Input to the InsightsEngine (CLAUDE.md §4 Step 4.4). Carries both a
/// pre-serialized `weeklyJson` for the Gemma prompt and structured stats so the
/// template fallback can produce a specific, numeric insight without the model.
@freezed
abstract class InsightContext with _$InsightContext {
  const factory InsightContext({
    required String goalDescription,
    required int weeksTraining,
    required String weeklyJson,
    @Default(0.0) double totalVolumeThisWeek,
    @Default(0.0) double totalVolumeLastWeek,
    @Default('kg') String unit,
    @Default(<String, double>{}) Map<String, double> volumeByMuscle,
  }) = _InsightContext;
}
