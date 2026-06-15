import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/theme_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/ironlog_button.dart';
import '../../../services/sync_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final auth = ref.watch(authProvider);
    final sync = ref.watch(syncProvider);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: AppTypography.screenTitle
                .copyWith(color: scheme.onSurface)),
      ),
      body: ListView(
        children: [
          // ── Appearance ──────────────────────────────────────────────
          _SectionHeader('APPEARANCE', scheme),
          ListTile(
            title: Text('Dark Mode', style: AppTypography.body),
            trailing: Switch(
              value: theme.themeMode == ThemeMode.dark,
              onChanged: (dark) => ref
                  .read(themeProvider.notifier)
                  .setThemeMode(dark ? ThemeMode.dark : ThemeMode.light),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Accent colour',
                style: AppTypography.caption.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.5))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              children: AppColors.presetAccents
                  .map((c) => GestureDetector(
                        onTap: () =>
                            ref.read(themeProvider.notifier).setAccentColor(c),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: c,
                            shape: BoxShape.circle,
                            border: theme.accentColor == c
                                ? Border.all(
                                    color: scheme.onSurface, width: 2.5)
                                : null,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const Divider(height: 32),

          // ── Account ─────────────────────────────────────────────────
          _SectionHeader('ACCOUNT', scheme),
          ListTile(
            title: Text('Profile', style: AppTypography.body),
            subtitle: auth.displayName != null
                ? Text(auth.displayName!,
                    style: AppTypography.caption.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.5)))
                : null,
            leading: const Icon(Icons.person_outline),
            onTap: () => context.push('/profile'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(height: 32),

          // ── Cloud Sync ───────────────────────────────────────────────
          _SectionHeader('CLOUD SYNC', scheme),
          if (!kFirebaseAvailable)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Cloud sync not available — Firebase not configured in this build.',
                style: AppTypography.caption
                    .copyWith(color: scheme.onSurface.withValues(alpha: 0.4)),
              ),
            )
          else ...[
            if (auth.isOfflineUser)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                child: Text(
                  'Sign in with Google to enable cloud backup.',
                  style: AppTypography.caption.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.5)),
                ),
              )
            else ...[
              if (sync.lastSyncAt != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 4),
                  child: Text(
                    'Last synced: ${DateFormat('d MMM y, HH:mm').format(sync.lastSyncAt!)}',
                    style: AppTypography.caption.copyWith(
                        color:
                            scheme.onSurface.withValues(alpha: 0.5)),
                  ),
                ),
              if (sync.error != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 4),
                  child: Text(sync.error!,
                      style: AppTypography.caption
                          .copyWith(color: scheme.error)),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: IronLogButton(
                        label: sync.status == SyncStatus.syncing
                            ? 'Syncing…'
                            : 'Backup Now',
                        icon: Icons.cloud_upload_outlined,
                        onPressed:
                            sync.status == SyncStatus.syncing || auth.userId == null
                                ? null
                                : () => ref
                                    .read(syncProvider.notifier)
                                    .upload(auth.userId!),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
          const Divider(height: 32),

          // ── AI ───────────────────────────────────────────────────────
          _SectionHeader('AI', scheme),
          ListTile(
            title: Text('AI Model', style: AppTypography.body),
            subtitle: Text('Set up or re-download Gemma',
                style: AppTypography.caption),
            leading: const Icon(Icons.psychology_outlined),
            onTap: () => context.push('/onboarding/model-download'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(height: 32),

          // ── App info ─────────────────────────────────────────────────
          _SectionHeader('ABOUT', scheme),
          ListTile(
            title: Text('Version', style: AppTypography.body),
            trailing: Text(AppConstants.version,
                style: AppTypography.caption.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.5))),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.label, this.scheme);
  final String label;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) => Padding(
        padding:
            const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Text(
          label,
          style: AppTypography.sectionLabel.copyWith(
              color: scheme.onSurface.withValues(alpha: 0.45),
              fontSize: 13),
        ),
      );
}
