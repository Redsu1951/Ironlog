// One-time development tool — NOT part of the app runtime.
//
//   dart run scripts/download_wger_data.dart
//
// Downloads exercise + muscle + equipment data from the open-source wger API
// (CLAUDE.md §14) and writes a pre-processed seed to assets/data/exercises_seed.json.
//
// Output shape (consumed by lib/services/seed_service.dart):
// {
//   "muscle_groups": [
//     {"id": 4, "name": "Chest", "body_region": "push",
//      "is_front": true, "display_order": 0}, ...
//   ],
//   "exercises": [
//     {"wger_id": 1, "name": "Bench Press", "description": "...",
//      "primary_muscle_id": 4, "secondary_muscle_ids": [3,7],
//      "equipment": ["Barbell"], "category": "Chest",
//      "instructions": "", "aliases": ["..."]}, ...
//   ]
// }
//
// dio is used here (and only here) per CLAUDE.md §2 — no runtime HTTP.
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

const _base = 'https://wger.de/api/v2';
const _englishLanguageId = 2;

/// wger leaves some exercises (cardio/mobility) without a primary muscle.
/// We keep them, pointing at this synthetic catch-all group.
const _otherMuscleId = 99;

Future<void> main() async {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {'Accept': 'application/json'},
  ));

  stdout.writeln('IronLog · wger seed downloader');
  stdout.writeln('--------------------------------');

  final muscleGroups = await _fetchMuscles(dio);
  stdout.writeln('Muscles: ${muscleGroups.length} (+1 synthetic "Other")');

  final exercises = await _fetchExercises(dio);
  stdout.writeln('Exercises (English, with primary muscle kept): '
      '${exercises.length}');

  final seed = {
    'muscle_groups': muscleGroups,
    'exercises': exercises,
  };

  final outFile = File('assets/data/exercises_seed.json');
  await outFile.writeAsString(const JsonEncoder.withIndent('  ').convert(seed));
  final sizeKb = (await outFile.length()) ~/ 1024;
  stdout.writeln('Wrote ${outFile.path} ($sizeKb KB)');
  dio.close();
}

/// GET /muscle/ → muscle groups, each id preserved as our muscle_groups.id.
Future<List<Map<String, dynamic>>> _fetchMuscles(Dio dio) async {
  final res = await dio.get('$_base/muscle/',
      queryParameters: {'format': 'json', 'limit': 100});
  final results = (res.data['results'] as List).cast<Map<String, dynamic>>();

  final groups = <Map<String, dynamic>>[];
  var order = 0;
  for (final m in results) {
    final nameEn = (m['name_en'] as String?)?.trim();
    final anatomical = (m['name'] as String?)?.trim() ?? 'Muscle';
    final display = (nameEn != null && nameEn.isNotEmpty) ? nameEn : anatomical;
    groups.add({
      'id': m['id'],
      'name': display,
      'body_region': _bodyRegionFor(display),
      'is_front': m['is_front'] ?? true,
      'display_order': order++,
    });
  }
  // Synthetic catch-all for exercises with no primary muscle.
  groups.add({
    'id': _otherMuscleId,
    'name': 'Other',
    'body_region': 'full',
    'is_front': true,
    'display_order': order,
  });
  return groups;
}

/// GET /exerciseinfo/ paginated → flattened English exercises.
Future<List<Map<String, dynamic>>> _fetchExercises(Dio dio) async {
  final out = <Map<String, dynamic>>[];
  String? url = '$_base/exerciseinfo/';
  var query = <String, dynamic>{
    'format': 'json',
    'language': _englishLanguageId,
    'limit': 100,
    'offset': 0,
  };

  var total = -1;
  while (url != null) {
    final res = await dio.get(url, queryParameters: query);
    final data = res.data as Map<String, dynamic>;
    if (total < 0) total = data['count'] as int;
    final results = (data['results'] as List).cast<Map<String, dynamic>>();

    for (final base in results) {
      final exercise = _transformExercise(base);
      if (exercise != null) out.add(exercise);
    }
    stdout.writeln('  downloaded ${out.length} exercises so far '
        '(scanned toward $total bases)...');

    final next = data['next'] as String?;
    url = next;
    query = const {}; // `next` already carries the query string.
  }
  return out;
}

/// Maps one wger exercise base → our seed row. Returns null if it has no English
/// translation (nothing meaningful to log).
Map<String, dynamic>? _transformExercise(Map<String, dynamic> base) {
  final translations = (base['translations'] as List?) ?? const [];
  final english = translations
      .cast<Map<String, dynamic>>()
      .where((t) => t['language'] == _englishLanguageId)
      .toList();
  if (english.isEmpty) return null;
  final t = english.first;

  final name = (t['name'] as String?)?.trim();
  if (name == null || name.isEmpty) return null;

  final primary = (base['muscles'] as List?)?.cast<Map<String, dynamic>>() ??
      const [];
  final secondary =
      (base['muscles_secondary'] as List?)?.cast<Map<String, dynamic>>() ??
          const [];
  final primaryId =
      primary.isNotEmpty ? primary.first['id'] as int : _otherMuscleId;
  // Any extra primary muscles + the secondary list become "secondary".
  final secondaryIds = <int>{
    ...primary.skip(1).map((m) => m['id'] as int),
    ...secondary.map((m) => m['id'] as int),
  }.toList();

  final equipment = ((base['equipment'] as List?) ?? const [])
      .cast<Map<String, dynamic>>()
      .map((e) => (e['name'] as String).trim())
      .toList();

  final category = (base['category'] as Map<String, dynamic>?)?['name'] ?? '';

  final aliases = ((t['aliases'] as List?) ?? const [])
      .cast<Map<String, dynamic>>()
      .map((a) => (a['alias'] as String?)?.trim() ?? '')
      .where((a) => a.isNotEmpty)
      .toList();

  return {
    'wger_id': base['id'],
    'name': name,
    'description': _stripHtml(t['description'] as String? ?? ''),
    'primary_muscle_id': primaryId,
    'secondary_muscle_ids': secondaryIds,
    'equipment': equipment,
    'category': category,
    'instructions': '',
    'aliases': aliases,
  };
}

/// Crude HTML → plain text for the description blobs wger returns.
String _stripHtml(String html) {
  return html
      .replaceAll(RegExp(r'<[^>]*>'), ' ')
      .replaceAll('&nbsp;', ' ')
      .replaceAll('&amp;', '&')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

/// Heuristic push/pull/legs/core classification by common muscle name.
String _bodyRegionFor(String muscleName) {
  final n = muscleName.toLowerCase();
  const push = ['chest', 'shoulder', 'delt', 'triceps', 'pec', 'serratus'];
  const pull = ['lat', 'back', 'biceps', 'trap', 'brachial', 'rhomboid'];
  const legs = [
    'quad', 'hamstring', 'glute', 'calf', 'calves', 'soleus',
    'gastro', 'adductor', 'abductor', 'leg'
  ];
  const core = ['ab', 'oblique', 'core', 'erector'];
  for (final k in push) {
    if (n.contains(k)) return 'push';
  }
  for (final k in pull) {
    if (n.contains(k)) return 'pull';
  }
  for (final k in legs) {
    if (n.contains(k)) return 'legs';
  }
  for (final k in core) {
    if (n.contains(k)) return 'core';
  }
  return 'full';
}
