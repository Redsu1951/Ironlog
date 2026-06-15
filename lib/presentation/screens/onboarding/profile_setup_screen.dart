import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/utils/validators.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/ironlog_button.dart';
import '../../widgets/ironlog_text_field.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() =>
      _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _weight = TextEditingController();
  final _height = TextEditingController();
  String _unit = 'kg';

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _weight.dispose();
    _height.dispose();
    super.dispose();
  }

  void _next() async {
    if (!_form.currentState!.validate()) return;
    await ref.read(authProvider.notifier).saveDraftProfile(
          name: _name.text.trim(),
          age: _age.text.isEmpty ? null : int.tryParse(_age.text),
          weightKg: _weight.text.isEmpty
              ? null
              : double.tryParse(_weight.text),
          heightCm: _height.text.isEmpty
              ? null
              : double.tryParse(_height.text),
          preferredUnit: _unit,
        );
    if (mounted) context.go('/onboarding/goals');
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('About You',
            style: AppTypography.screenTitle
                .copyWith(color: scheme.onSurface)),
        centerTitle: true,
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            IronLogTextField(
              label: 'Your name',
              controller: _name,
              textInputAction: TextInputAction.next,
              validator: (v) => Validators.nonEmpty(v, 'Name'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: IronLogTextField(
                    label: 'Age (optional)',
                    controller: _age,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textInputAction: TextInputAction.next,
                    validator: Validators.age,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: IronLogTextField(
                    label: 'Body weight',
                    controller: _weight,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                    validator: Validators.bodyWeight,
                    suffix: Text(_unit,
                        style: AppTypography.caption
                            .copyWith(color: scheme.onSurface)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            IronLogTextField(
              label: 'Height cm (optional)',
              controller: _height,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 16),
            // Unit toggle
            Row(
              children: [
                Text('Preferred unit:',
                    style: AppTypography.body.copyWith(color: scheme.onSurface)),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text('kg'),
                  selected: _unit == 'kg',
                  onSelected: (_) => setState(() => _unit = 'kg'),
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('lbs'),
                  selected: _unit == 'lbs',
                  onSelected: (_) => setState(() => _unit = 'lbs'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            IronLogButton(label: 'Next', onPressed: _next),
          ],
        ),
      ),
    );
  }
}
