import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../ai/gemma_service.dart';
import '../../../core/constants/ai_prompts.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/preferences_provider.dart';
import '../../../data/database/app_database.dart';
import '../../../data/datasources/local/database_helper.dart';
import '../../providers/auth_provider.dart';
import '../../providers/planner_provider.dart';
import '../../widgets/ironlog_button.dart';
import '../../widgets/ironlog_card.dart';

/// AI-assisted workout split builder.
/// All AI prompt strings are sourced exclusively from AiPrompts (CLAUDE.md §4).
class SplitBuilderScreen extends ConsumerStatefulWidget {
  const SplitBuilderScreen({super.key});

  @override
  ConsumerState<SplitBuilderScreen> createState() =>
      _SplitBuilderScreenState();
}

class _SplitBuilderScreenState extends ConsumerState<SplitBuilderScreen> {
  final _nameCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  bool _generating = false;
  bool _saving = false;
  String? _error;

  List<_DayDraft> _days = _defaultDays();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  static List<_DayDraft> _defaultDays() => [
        _DayDraft(0, 'Push Day'),
        _DayDraft(1, 'Pull Day'),
        _DayDraft(2, 'Legs Day'),
        _DayDraft(3, 'Rest', isRestDay: true),
        _DayDraft(4, 'Upper Body'),
        _DayDraft(5, 'Lower Body'),
        _DayDraft(6, 'Rest', isRestDay: true),
      ];

  Future<void> _generateWithAI() async {
    setState(() {
      _generating = true;
      _error = null;
    });

    try {
      final gemma = ref.read(gemmaServiceProvider);
      if (!gemma.isInitialized) {
        setState(() {
          _error =
              'AI model not loaded — using default PPL split. Download the model in Settings → AI Model.';
        });
        return;
      }

      final prefs = ref.read(sharedPreferencesProvider);
      final goalDesc =
          prefs.getString('draft_goal_desc') ?? 'Build strength and muscle';

      final db = ref.read(appDatabaseProvider);
      final now = DateTime.now();
      final recentWorkouts = await db.workoutDao
          .getWorkoutsByDateRange(now.subtract(const Duration(days: 14)), now);

      final historyJson = jsonEncode(recentWorkouts
          .map((w) => {
                'name': w.name,
                'date': w.startedAt,
                'volume_kg': w.totalVolumeKg,
              })
          .toList());

      final prompt = AiPrompts.planSuggestion(
        historyJson: historyJson,
        goalDescription: goalDesc,
      );

      final response = await gemma.generate(prompt);
      final parsed = _parsePlanJson(response);
      if (parsed != null) {
        setState(() {
          if (_nameCtrl.text.isEmpty) _nameCtrl.text = parsed.name;
          if (_descCtrl.text.isEmpty) _descCtrl.text = parsed.description;
          _days = parsed.days;
        });
      } else {
        setState(() => _error = 'AI response was invalid JSON. Using default split.');
      }
    } catch (e) {
      setState(() => _error = 'AI error: ${e.toString().split('\n').first}');
    } finally {
      if (mounted) setState(() => _generating = false);
    }
  }

  _ParsedPlan? _parsePlanJson(String raw) {
    try {
      final start = raw.indexOf('{');
      final end = raw.lastIndexOf('}');
      if (start == -1 || end == -1) return null;
      final decoded =
          jsonDecode(raw.substring(start, end + 1)) as Map<String, dynamic>;
      final name = (decoded['plan_name'] as String?) ?? 'My Plan';
      final desc = (decoded['description'] as String?) ?? '';
      final daysRaw = decoded['days'] as List? ?? [];
      final days = daysRaw.map((d) {
        final dow = (d['day_of_week'] as num?)?.toInt() ?? 0;
        final dayName = (d['name'] as String?) ?? 'Session';
        final isRest = (d['is_rest_day'] as bool?) ?? false;
        return _DayDraft(dow, dayName, isRestDay: isRest);
      }).toList();
      return _ParsedPlan(name, desc, days);
    } catch (_) {
      return null;
    }
  }

  Future<void> _save() async {
    final name = _nameCtrl.text.trim();
    if (name.isEmpty) {
      setState(() => _error = 'Plan name is required.');
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });

    try {
      final userId = ref.read(authProvider).userId ?? 'anon';
      final db = ref.read(appDatabaseProvider);
      final desc = _descCtrl.text.trim();
      final now = DateTime.now().millisecondsSinceEpoch;

      final planId = await db.planDao.createPlan(
        WorkoutPlansCompanion(
          userId: Value(userId),
          name: Value(name),
          description: Value(desc),
          createdAt: Value(now),
          updatedAt: Value(now),
        ),
      );

      for (final d in _days) {
        await db.into(db.workoutPlanDays).insert(
              WorkoutPlanDaysCompanion.insert(
                planId: planId,
                dayOfWeek: d.dayOfWeek,
                name: d.name,
                isRestDay: Value(d.isRestDay),
              ),
            );
      }

      await db.planDao.setActivePlan(planId);
      ref.invalidate(activePlanProvider);

      if (mounted) context.pop();
    } catch (e) {
      setState(() => _error = e.toString().split('\n').first);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Split Builder',
            style:
                AppTypography.screenTitle.copyWith(color: scheme.onSurface)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Label('PLAN NAME', scheme),
          const SizedBox(height: 8),
          _InputField(
            controller: _nameCtrl,
            hint: 'e.g. My PPL Split',
            scheme: scheme,
          ),
          const SizedBox(height: 16),
          _Label('DESCRIPTION', scheme),
          const SizedBox(height: 8),
          _InputField(
            controller: _descCtrl,
            hint: '(optional)',
            scheme: scheme,
            maxLines: 2,
          ),
          const SizedBox(height: 20),
          IronLogButton(
            label: _generating ? 'Thinking…' : 'Generate with AI',
            icon: Icons.auto_awesome,
            onPressed: _generating ? null : _generateWithAI,
          ),
          if (_generating)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: LinearProgressIndicator(),
            ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(_error!,
                style: AppTypography.caption.copyWith(color: scheme.error)),
          ],
          const SizedBox(height: 24),
          _Label('WEEKLY SCHEDULE', scheme),
          const SizedBox(height: 8),
          ..._days.map(
            (d) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _DayRow(
                day: d,
                onNameChanged: (v) => setState(() => d.name = v),
                onRestToggled: (v) => setState(() => d.isRestDay = !v),
              ),
            ),
          ),
          const SizedBox(height: 24),
          IronLogButton(
            label: _saving ? 'Saving…' : 'Save & Activate',
            icon: Icons.check_circle_outline,
            onPressed: _saving ? null : _save,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ── Input widgets ─────────────────────────────────────────────────────────────

class _Label extends StatelessWidget {
  const _Label(this.text, this.scheme);
  final String text;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: AppTypography.sectionLabel
            .copyWith(color: scheme.onSurface.withValues(alpha: 0.5)),
      );
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.hint,
    required this.scheme,
    this.maxLines = 1,
  });
  final TextEditingController controller;
  final String hint;
  final ColorScheme scheme;
  final int maxLines;

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        maxLines: maxLines,
        style: AppTypography.body.copyWith(color: scheme.onSurface),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTypography.body
              .copyWith(color: scheme.onSurface.withValues(alpha: 0.3)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: scheme.surfaceContainerHighest,
        ),
      );
}

// ── Day row ───────────────────────────────────────────────────────────────────

class _DayRow extends StatefulWidget {
  const _DayRow({
    required this.day,
    required this.onNameChanged,
    required this.onRestToggled,
  });
  final _DayDraft day;
  final void Function(String) onNameChanged;
  final void Function(bool) onRestToggled;

  @override
  State<_DayRow> createState() => _DayRowState();
}

class _DayRowState extends State<_DayRow> {
  late TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.day.name);
  }

  @override
  void didUpdateWidget(_DayRow old) {
    super.didUpdateWidget(old);
    if (old.day.name != widget.day.name) {
      _ctrl.text = widget.day.name;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  static const _dayLabels = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final label = widget.day.dayOfWeek < _dayLabels.length
        ? _dayLabels[widget.day.dayOfWeek]
        : 'D${widget.day.dayOfWeek + 1}';

    return IronLogCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Text(label,
                style: AppTypography.caption
                    .copyWith(color: scheme.onSurface.withValues(alpha: 0.5))),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: widget.day.isRestDay
                ? Text('Rest',
                    style: AppTypography.body.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.4)))
                : TextField(
                    controller: _ctrl,
                    onChanged: widget.onNameChanged,
                    style: AppTypography.body.copyWith(color: scheme.onSurface),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
          ),
          Switch(
            value: !widget.day.isRestDay,
            onChanged: widget.onRestToggled,
            activeThumbColor: scheme.primary,
          ),
        ],
      ),
    );
  }
}

// ── Data classes ──────────────────────────────────────────────────────────────

class _DayDraft {
  _DayDraft(this.dayOfWeek, this.name, {this.isRestDay = false});
  final int dayOfWeek;
  String name;
  bool isRestDay;
}

class _ParsedPlan {
  const _ParsedPlan(this.name, this.description, this.days);
  final String name;
  final String description;
  final List<_DayDraft> days;
}
