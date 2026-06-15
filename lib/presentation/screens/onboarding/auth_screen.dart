import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_typography.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/ironlog_button.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _loading = false;

  Future<void> _signInWithGoogle() async {
    setState(() => _loading = true);
    await ref.read(authProvider.notifier).signInWithGoogle();
    if (!mounted) return;
    setState(() => _loading = false);

    final auth = ref.read(authProvider);
    if (auth.isLoggedIn) {
      context.go('/onboarding/model-download');
    } else if (auth.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(auth.error!)),
      );
    }
  }

  Future<void> _continueOffline() async {
    setState(() => _loading = true);
    await ref.read(authProvider.notifier).continueOffline();
    if (mounted) context.go('/onboarding/model-download');
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'IRONLOG',
                style: AppTypography.headerLarge.copyWith(
                  fontSize: 42,
                  color: scheme.primary,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Sign in to back up your workouts\nacross devices.',
                style: AppTypography.body.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              IronLogButton(
                label: 'Sign in with Google',
                icon: Icons.login,
                isLoading: _loading,
                onPressed: _signInWithGoogle,
              ),
              const SizedBox(height: 12),
              IronLogOutlinedButton(
                label: 'Continue without account',
                onPressed: _loading ? null : _continueOffline,
              ),
              const SizedBox(height: 24),
              Text(
                'Your data stays on-device. Google Sign-In enables optional cloud backup.',
                style: AppTypography.caption.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.4)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
