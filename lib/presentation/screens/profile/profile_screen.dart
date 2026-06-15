import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_typography.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/ironlog_button.dart';

/// Profile / account screen — Phase 13.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: AppTypography.screenTitle
                .copyWith(color: scheme.onSurface)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(auth.displayName ?? 'Athlete',
                style: AppTypography.screenTitle
                    .copyWith(color: scheme.onSurface)),
            const SizedBox(height: 8),
            Text(
              auth.isOfflineUser
                  ? 'Offline account — no cloud backup'
                  : 'Signed in with Google',
              style: AppTypography.caption.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.5)),
            ),
            const Spacer(),
            IronLogButton(
              label: 'Sign Out',
              isDestructive: true,
              onPressed: () async {
                await ref.read(authProvider.notifier).signOut();
                if (context.mounted) context.go('/onboarding');
              },
            ),
          ],
        ),
      ),
    );
  }
}
