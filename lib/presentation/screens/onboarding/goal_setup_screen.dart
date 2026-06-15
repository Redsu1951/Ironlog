import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/utils/validators.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/ironlog_button.dart';
import '../../widgets/ironlog_text_field.dart';

class GoalSetupScreen extends ConsumerStatefulWidget {
  const GoalSetupScreen({super.key});

  @override
  ConsumerState<GoalSetupScreen> createState() => _GoalSetupScreenState();
}

class _GoalSetupScreenState extends ConsumerState<GoalSetupScreen> {
  final _form = GlobalKey<FormState>();
  final _goal = TextEditingController();
  final _targetWeight = TextEditingController();

  static const _suggestions = [
    'Build muscle and gain strength',
    'Lose fat and maintain muscle',
    'Improve overall fitness',
    'Train for a sport',
    'Compete in powerlifting',
  ];

  @override
  void dispose() {
    _goal.dispose();
    _targetWeight.dispose();
    super.dispose();
  }

  void _next() async {
    if (!_form.currentState!.validate()) return;
    await ref.read(authProvider.notifier).saveGoal(
          description: _goal.text.trim(),
          targetWeightKg: _targetWeight.text.isEmpty
              ? null
              : double.tryParse(_targetWeight.text),
        );
    if (mounted) context.go('/onboarding/auth');
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Goal',
            style: AppTypography.screenTitle
                .copyWith(color: scheme.onSurface)),
        centerTitle: true,
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'What are you training for?',
              style: AppTypography.body.copyWith(color: scheme.onSurface),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _suggestions
                  .map((s) => ActionChip(
                        label: Text(s, style: AppTypography.caption),
                        onPressed: () => _goal.text = s,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            IronLogTextField(
              label: 'Describe your goal',
              controller: _goal,
              maxLines: 3,
              validator: (v) => Validators.nonEmpty(v, 'Goal'),
            ),
            const SizedBox(height: 16),
            IronLogTextField(
              label: 'Target body weight (optional)',
              controller: _targetWeight,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              hint: 'e.g. 80',
              suffix: Text('kg',
                  style: AppTypography.caption
                      .copyWith(color: scheme.onSurface)),
            ),
            const SizedBox(height: 32),
            IronLogButton(label: 'Next', onPressed: _next),
          ],
        ),
      ),
    );
  }
}
