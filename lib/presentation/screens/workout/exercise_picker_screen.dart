import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_typography.dart';
import '../../providers/exercise_provider.dart';
import '../../widgets/ironlog_text_field.dart';
import '../../widgets/shimmer_loader.dart';

/// Full search + muscle-group filter in Phase 8. Phase 7: search-only stub.
class ExercisePickerScreen extends ConsumerStatefulWidget {
  const ExercisePickerScreen({super.key});

  @override
  ConsumerState<ExercisePickerScreen> createState() =>
      _ExercisePickerScreenState();
}

class _ExercisePickerScreenState extends ConsumerState<ExercisePickerScreen> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercises = ref.watch(exerciseProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Exercise',
            style: AppTypography.screenTitle
                .copyWith(color: scheme.onSurface)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: IronLogTextField(
              label: 'Search exercises',
              controller: _search,
              prefixIcon: const Icon(Icons.search),
              onChanged: (q) =>
                  ref.read(exerciseProvider.notifier).search(q),
            ),
          ),
          Expanded(
            child: exercises.when(
              loading: () => ListView.builder(
                itemCount: 6,
                itemBuilder: (_, __) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ShimmerCard(height: 56),
                ),
              ),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (list) => ListView.builder(
                itemCount: list.length,
                itemBuilder: (ctx, i) {
                  final ex = list[i];
                  return ListTile(
                    title: Text(ex.name, style: AppTypography.body),
                    subtitle: Text(ex.category,
                        style: AppTypography.caption.copyWith(
                            color: scheme.onSurface.withValues(alpha: 0.5))),
                    onTap: () => Navigator.pop(context, ex),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
