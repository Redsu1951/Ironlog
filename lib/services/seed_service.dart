import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/database/app_database.dart';
import '../data/datasources/local/database_helper.dart';

part 'seed_service.g.dart';

/// SharedPreferences flag — seeding runs exactly once per install (CLAUDE.md §14).
const String kSeededPrefKey = 'db_seeded';

const String _seedAssetPath = 'assets/data/exercises_seed.json';

/// Loads the pre-processed wger seed (muscle groups + exercises) into Drift on
/// first launch. Idempotent: a set `db_seeded` flag short-circuits, and the
/// insert itself runs in a single atomic batch so a failure leaves no partial
/// data to clean up.
class SeedService {
  SeedService(this._db);

  final AppDatabase _db;

  Future<void> seedIfNeeded() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(kSeededPrefKey) ?? false) return;

    final raw = await rootBundle.loadString(_seedAssetPath);
    final decoded = json.decode(raw);
    if (decoded is! Map<String, dynamic>) {
      // Placeholder seed (`[]`) or unexpected shape — nothing to do.
      return;
    }

    final muscleGroups =
        (decoded['muscle_groups'] as List? ?? const []).cast<dynamic>();
    final exercises =
        (decoded['exercises'] as List? ?? const []).cast<dynamic>();
    if (muscleGroups.isEmpty && exercises.isEmpty) return;

    final now = DateTime.now().millisecondsSinceEpoch;

    // One atomic batch — drift chunks large inserts internally.
    await _db.batch((b) {
      b.insertAll(
        _db.muscleGroups,
        muscleGroups.map((m) => _muscleGroupCompanion(m)).toList(),
        mode: InsertMode.insertOrReplace,
      );
      b.insertAll(
        _db.exercises,
        exercises.map((e) => _exerciseCompanion(e, now)).toList(),
      );
    });

    await prefs.setBool(kSeededPrefKey, true);
  }

  MuscleGroupsCompanion _muscleGroupCompanion(dynamic m) {
    final map = m as Map<String, dynamic>;
    return MuscleGroupsCompanion(
      id: Value(map['id'] as int),
      name: Value(map['name'] as String),
      bodyRegion: Value(map['body_region'] as String? ?? 'full'),
      displayOrder: Value(map['display_order'] as int? ?? 0),
    );
  }

  ExercisesCompanion _exerciseCompanion(dynamic e, int now) {
    final map = e as Map<String, dynamic>;
    return ExercisesCompanion.insert(
      name: map['name'] as String,
      primaryMuscleId: map['primary_muscle_id'] as int,
      wgerId: Value(map['wger_id'] as int?),
      description: Value(map['description'] as String? ?? ''),
      secondaryMuscleIds: Value(
        json.encode((map['secondary_muscle_ids'] as List? ?? const [])),
      ),
      equipment: Value(json.encode((map['equipment'] as List? ?? const []))),
      category: Value(map['category'] as String? ?? ''),
      instructions: Value(map['instructions'] as String? ?? ''),
      aliases: Value(json.encode((map['aliases'] as List? ?? const []))),
      createdAt: now,
    );
  }
}

/// App-lifetime seeder bound to the shared [appDatabaseProvider].
@Riverpod(keepAlive: true)
SeedService seedService(Ref ref) {
  return SeedService(ref.watch(appDatabaseProvider));
}
