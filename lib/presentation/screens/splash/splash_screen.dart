import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/utils/preferences_provider.dart';

/// Auto-redirects to /home or /onboarding based on SharedPreferences.
/// Shown for a single frame while the decision is made — no blocking I/O.
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.read(sharedPreferencesProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      final userId = prefs.getString('user_id');
      if (userId != null) {
        context.go('/home');
      } else {
        context.go('/onboarding');
      }
    });

    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.surface,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'IRONLOG',
              style: AppTypography.headerLarge.copyWith(
                fontSize: 42,
                color: scheme.primary,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: scheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
