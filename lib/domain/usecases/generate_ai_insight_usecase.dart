import '../../ai/insights_engine.dart';
import '../../data/models/insight_context.dart';

class GenerateAIInsightUseCase {
  const GenerateAIInsightUseCase(this._engine);
  final InsightsEngine _engine;

  Future<String> call(InsightContext context) =>
      _engine.generateInsight(context);
}
