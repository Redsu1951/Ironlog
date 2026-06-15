import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../ai/gemma_service.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/preferences_provider.dart';
import '../../../services/model_download_service.dart';
import '../../widgets/ironlog_button.dart';

/// Model installation screen.
/// Primary path: user picks the already-downloaded model file from device
///   storage. The absolute path is saved to SharedPreferences and the
///   GemmaService loads it in-place via ModelSource.file() — no 2.5 GB copy.
/// Secondary path: direct Hugging Face download (requires HF token).
class ModelDownloadScreen extends ConsumerStatefulWidget {
  const ModelDownloadScreen({super.key});

  @override
  ConsumerState<ModelDownloadScreen> createState() =>
      _ModelDownloadScreenState();
}

class _ModelDownloadScreenState extends ConsumerState<ModelDownloadScreen> {
  _Mode _mode = _Mode.idle;
  double _dlProgress = 0;
  String _status = '';
  bool _done = false;
  bool _picking = false;

  bool _showDownload = false;
  final _tokenCtrl = TextEditingController();

  @override
  void dispose() {
    _tokenCtrl.dispose();
    super.dispose();
  }

  // ── File-picker install (no copy — just save the path) ────────────────────

  Future<void> _pickAndInstall() async {
    if (_picking || _busy) return;
    _picking = true;
    try {
      final result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select Gemma model file (.task / .litertlm / .bin)',
        type: FileType.any,
        allowMultiple: false,
      );
      if (result == null || result.files.isEmpty) return;

      final path = result.files.single.path;
      if (path == null || path.isEmpty) {
        if (mounted) {
          setState(() => _status =
              'Could not read file path. Move the file to Downloads and try again.');
        }
        return;
      }

      // Save the path — GemmaService reads this on next init via ModelSource.file().
      final prefs = ref.read(sharedPreferencesProvider);
      await prefs.setString(kModelFilePathKey, path);

      if (mounted) {
        setState(() {
          _done = true;
          _status = 'Model linked!';
        });
        await Future.delayed(const Duration(milliseconds: 600));
        if (mounted) _finish();
      }
    } on PlatformException catch (e) {
      if (!mounted) return;
      setState(() {
        _status = e.code == 'already_active'
            ? 'File picker already open — tap once.'
            : 'Could not open file: ${e.message}';
      });
    } catch (e) {
      if (mounted) setState(() => _status = 'Error: $e');
    } finally {
      _picking = false;
    }
  }

  // ── Direct Hugging Face download ──────────────────────────────────────────

  Future<void> _startDownload() async {
    final token = _tokenCtrl.text.trim();
    if (token.isEmpty) {
      setState(() => _status = 'Paste your Hugging Face token first.');
      return;
    }
    setState(() {
      _mode = _Mode.downloading;
      _status = 'Starting download…';
    });

    final service = ref.read(modelDownloadServiceProvider);
    service.downloadModel(hfToken: token).listen(
      (prog) {
        if (!mounted) return;
        setState(() {
          _dlProgress = prog;
          _status = '${(prog * 1100).toStringAsFixed(0)} MB / 1100 MB';
        });
      },
      onDone: () async {
        if (!mounted) return;
        setState(() {
          _done = true;
          _status = 'Download complete!';
        });
        await Future.delayed(const Duration(milliseconds: 800));
        if (mounted) _finish();
      },
      onError: (_) {
        if (mounted) {
          setState(() {
            _mode = _Mode.idle;
            _status = 'Download failed. Check your token and Wi-Fi.';
          });
        }
      },
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  Future<void> _skip() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool('model_download_skipped', true);
    if (mounted) _finish();
  }

  void _finish() {
    // Recreate service with the new path and trigger model loading.
    ref.invalidate(gemmaServiceProvider);
    ref.invalidate(gemmaInitProvider);
    context.go('/home');
  }

  bool get _busy => _mode == _Mode.downloading;

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.psychology_outlined, size: 56, color: scheme.primary),
              const SizedBox(height: 20),
              Text(
                'INSTALL AI MODEL',
                style: AppTypography.screenTitle
                    .copyWith(color: scheme.onSurface),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'IronLog\'s AI works fully offline once installed.\n'
                'Model: Gemma 4 E2B  •  ~1–2.5 GB',
                style: AppTypography.body
                    .copyWith(color: scheme.onSurface.withValues(alpha: 0.6)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // ── Progress / done ──────────────────────────────────────────
              if (_busy || _done) ...[
                LinearProgressIndicator(
                  value: _done ? 1.0 : _dlProgress,
                  backgroundColor: scheme.surfaceContainerHighest,
                  valueColor: AlwaysStoppedAnimation(scheme.primary),
                ),
                const SizedBox(height: 8),
                Text(
                  _status,
                  style:
                      AppTypography.caption.copyWith(color: scheme.onSurface),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
              ] else ...[

                // ── Option A: pick from device ───────────────────────────
                _OptionCard(
                  icon: Icons.folder_open,
                  title: 'Install from file',
                  subtitle: 'Download the model to your phone, '
                      'then tap here to select it. No account needed.',
                  scheme: scheme,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        'How to get the model file:',
                        style: AppTypography.caption
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '1. On any browser, go to:\n'
                        '   huggingface.co/google/gemma-4-e2b-it-mediapipe\n'
                        '2. Accept model terms, then download one of:\n'
                        '   • gemma-4-e2b-it-gpu-int4.bin  (~1.1 GB, faster)\n'
                        '   • gemma-4-e2b-it.litertlm      (~2.5 GB, also works)\n'
                        '3. Move the file to this phone (USB, Drive, etc.)\n'
                        '4. Tap "Select file" and pick it.',
                        style: AppTypography.caption.copyWith(
                            color: scheme.onSurface.withValues(alpha: 0.65)),
                      ),
                      const SizedBox(height: 14),
                      IronLogButton(
                        label: 'Select file',
                        icon: Icons.file_open,
                        onPressed: _pickAndInstall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // ── Option B: direct download ─────────────────────────────
                _ExpandableOption(
                  icon: Icons.download,
                  title: 'Download directly (advanced)',
                  subtitle: 'Requires a Hugging Face account and token.',
                  scheme: scheme,
                  expanded: _showDownload,
                  onToggle: () =>
                      setState(() => _showDownload = !_showDownload),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 12),
                      TextField(
                        controller: _tokenCtrl,
                        decoration: InputDecoration(
                          labelText: 'Hugging Face token (hf_...)',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: scheme.surfaceContainerHighest,
                          isDense: true,
                        ),
                        style:
                            AppTypography.body.copyWith(color: scheme.onSurface),
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      IronLogButton(
                        label: 'Download over Wi-Fi',
                        icon: Icons.wifi,
                        onPressed: _startDownload,
                      ),
                    ],
                  ),
                ),

                // ── Error message ─────────────────────────────────────────
                if (_status.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    _status,
                    style:
                        AppTypography.caption.copyWith(color: scheme.error),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],

              const SizedBox(height: 8),
              TextButton(
                onPressed: _busy ? null : _skip,
                child: Text(
                  'Skip — use app without AI',
                  style: AppTypography.body.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.45)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _Mode { idle, downloading }

// ── Reusable card widgets ──────────────────────────────────────────────────────

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.scheme,
    required this.child,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final ColorScheme scheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, color: scheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(title,
                style:
                    AppTypography.body.copyWith(fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 4),
          Text(subtitle,
              style: AppTypography.caption
                  .copyWith(color: scheme.onSurface.withValues(alpha: 0.6))),
          child,
        ],
      ),
    );
  }
}

class _ExpandableOption extends StatelessWidget {
  const _ExpandableOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.scheme,
    required this.expanded,
    required this.onToggle,
    required this.child,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final ColorScheme scheme;
  final bool expanded;
  final VoidCallback onToggle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(icon,
                      color: scheme.onSurface.withValues(alpha: 0.5), size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: AppTypography.body.copyWith(
                                color: scheme.onSurface.withValues(alpha: 0.7))),
                        Text(subtitle,
                            style: AppTypography.caption.copyWith(
                                color:
                                    scheme.onSurface.withValues(alpha: 0.45))),
                      ],
                    ),
                  ),
                  Icon(
                    expanded ? Icons.expand_less : Icons.expand_more,
                    color: scheme.onSurface.withValues(alpha: 0.4),
                  ),
                ],
              ),
            ),
          ),
          if (expanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: child,
            ),
        ],
      ),
    );
  }
}
