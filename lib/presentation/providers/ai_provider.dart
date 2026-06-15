import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../ai/gemma_service.dart';
import '../../ai/insights_engine.dart';
import '../../ai/workout_parser.dart';
import '../../data/models/insight_context.dart';

part 'ai_provider.g.dart';

class AiState {
  const AiState({
    this.isModelReady = false,
    this.isGenerating = false,
    this.lastInsight,
    this.error,
  });

  final bool isModelReady;
  final bool isGenerating;
  final String? lastInsight;
  final String? error;

  AiState copyWith({
    bool? isModelReady,
    bool? isGenerating,
    String? lastInsight,
    String? error,
  }) =>
      AiState(
        isModelReady: isModelReady ?? this.isModelReady,
        isGenerating: isGenerating ?? this.isGenerating,
        lastInsight: lastInsight ?? this.lastInsight,
        error: error,
      );
}

@riverpod
class AiNotifier extends _$AiNotifier {
  @override
  AiState build() {
    final gemma = ref.read(gemmaServiceProvider);
    return AiState(isModelReady: gemma.isInitialized);
  }

  Future<String?> parseWorkout(String input) async {
    final parser = WorkoutParser(ref.read(gemmaServiceProvider));
    final result = await parser.parseNaturalLanguage(input);
    return result?.exerciseName;
  }

  Future<String?> generateInsight(InsightContext ctx) async {
    state = state.copyWith(isGenerating: true);
    try {
      final engine = InsightsEngine(ref.read(gemmaServiceProvider));
      final insight = await engine.generateInsight(ctx);
      state = state.copyWith(isGenerating: false, lastInsight: insight);
      return insight;
    } catch (e) {
      state = state.copyWith(isGenerating: false, error: e.toString());
      return null;
    }
  }
}
