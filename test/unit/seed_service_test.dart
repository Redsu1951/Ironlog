import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ironlog/data/database/app_database.dart';
import 'package:ironlog/services/seed_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Phase 2 validation: the real bundled seed asset loads and inserts correctly,
/// is idempotent, and produces FK-consistent, searchable exercise data.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase db;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    db = AppDatabase(NativeDatabase.memory());
  });
  tearDown(() => db.close());

  test('seeds muscle groups and 800+ exercises from the bundled asset',
      () async {
    await SeedService(db).seedIfNeeded();

    final muscles = await db.select(db.muscleGroups).get();
    final exercises = await db.exerciseDao.getAllExercises();

    expect(muscles.length, greaterThanOrEqualTo(15));
    expect(exercises.length, greaterThan(800));

    // Every exercise's primary muscle resolves to a seeded group (FK integrity).
    final muscleIds = muscles.map((m) => m.id).toSet();
    expect(exercises.every((e) => muscleIds.contains(e.primaryMuscleId)), isTrue);
  });

  test('sets the db_seeded flag and is idempotent on a second run', () async {
    final svc = SeedService(db);
    await svc.seedIfNeeded();
    final firstCount = (await db.exerciseDao.getAllExercises()).length;

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getBool(kSeededPrefKey), isTrue);

    // Second call must be a no-op (no duplicate rows).
    await svc.seedIfNeeded();
    final secondCount = (await db.exerciseDao.getAllExercises()).length;
    expect(secondCount, firstCount);
  });

  test('seeded exercises are searchable by name', () async {
    await SeedService(db).seedIfNeeded();
    final hits = await db.exerciseDao.searchExercises('press');
    expect(hits, isNotEmpty);
  });
}
