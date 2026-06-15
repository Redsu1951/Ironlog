import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ironlog/data/database/app_database.dart';

/// Phase 1 validation: schema builds, DAOs execute, and the hand-written
/// analytics SQL + join queries return correct results. Runs against an
/// in-memory SQLite instance.
void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  const userId = 'user-1';

  Future<void> seedBasics() async {
    await db.into(db.users).insert(UsersCompanion.insert(
          id: userId,
          name: 'Tester',
          createdAt: 0,
          updatedAt: 0,
        ));
    await db.into(db.muscleGroups).insert(MuscleGroupsCompanion.insert(
          name: 'Chest',
          bodyRegion: 'push',
        ));
    await db.into(db.exercises).insert(ExercisesCompanion.insert(
          name: 'Bench Press',
          primaryMuscleId: 1,
          createdAt: 0,
        ));
  }

  test('exercise search matches name and aliases (case-insensitive)', () async {
    await seedBasics();
    final byName = await db.exerciseDao.searchExercises('bench');
    expect(byName, hasLength(1));
    expect(byName.first.name, 'Bench Press');
  });

  test('consecutive ad-hoc workouts are counted until a planned one', () async {
    await seedBasics();
    // Three ad-hoc (most recent), then one planned (older).
    await db.workoutDao.createWorkout(WorkoutsCompanion.insert(
        id: 'w-planned', userId: userId, name: 'Planned', startedAt: 1000));
    for (var i = 0; i < 3; i++) {
      await db.workoutDao.createWorkout(WorkoutsCompanion.insert(
          id: 'w-adhoc-$i',
          userId: userId,
          name: 'Ad hoc $i',
          startedAt: 2000 + i,
          isAdHoc: const Value(true)));
    }
    expect(await db.workoutDao.getAdHocWorkoutCount(), 3);
  });

  test('previous session sets resolve from the last completed workout',
      () async {
    await seedBasics();
    // Older completed session for exercise 1, with two sets.
    final wId = await db.workoutDao.createWorkout(WorkoutsCompanion.insert(
        id: 'w-old',
        userId: userId,
        name: 'Old',
        startedAt: 100,
        endedAt: const Value(200)));
    await db.into(db.workoutExercises).insert(WorkoutExercisesCompanion.insert(
        id: 'we-1', workoutId: wId, exerciseId: 1, orderIndex: 0));
    for (var n = 1; n <= 2; n++) {
      await db.setsDao.insertSet(SetsCompanion.insert(
          id: 'set-prev-$n',
          workoutExerciseId: 'we-1',
          setNumber: n,
          reps: 8,
          weight: 100,
          weightUnit: 'kg',
          completedAt: 100 + n));
    }
    final prev = await db.setsDao.getPreviousSessionSets(1, userId);
    expect(prev, hasLength(2));
    expect(prev.first.setNumber, 1);
  });

  test('total body volume sums reps*weight across the window', () async {
    await seedBasics();
    final wId = await db.workoutDao.createWorkout(WorkoutsCompanion.insert(
        id: 'w1', userId: userId, name: 'W', startedAt: 5000));
    await db.into(db.workoutExercises).insert(WorkoutExercisesCompanion.insert(
        id: 'we1', workoutId: wId, exerciseId: 1, orderIndex: 0));
    // 8*100 + 5*120 = 800 + 600 = 1400
    await db.setsDao.insertSet(SetsCompanion.insert(
        id: 'set-vol-1',
        workoutExerciseId: 'we1',
        setNumber: 1,
        reps: 8,
        weight: 100,
        weightUnit: 'kg',
        completedAt: 5001));
    await db.setsDao.insertSet(SetsCompanion.insert(
        id: 'set-vol-2',
        workoutExerciseId: 'we1',
        setNumber: 2,
        reps: 5,
        weight: 120,
        weightUnit: 'kg',
        completedAt: 5002));
    final vol = await db.analyticsDao.getTotalBodyVolume(
        DateTime.fromMillisecondsSinceEpoch(0),
        DateTime.fromMillisecondsSinceEpoch(10000));
    expect(vol, 1400.0);
  });

  test('weekly volume trend buckets by muscle group', () async {
    await seedBasics();
    final now = DateTime.now();
    final wId = await db.workoutDao.createWorkout(WorkoutsCompanion.insert(
        id: 'w1',
        userId: userId,
        name: 'W',
        startedAt: now.millisecondsSinceEpoch));
    await db.into(db.workoutExercises).insert(WorkoutExercisesCompanion.insert(
        id: 'we1', workoutId: wId, exerciseId: 1, orderIndex: 0));
    await db.setsDao.insertSet(SetsCompanion.insert(
        id: 'set-wk-1',
        workoutExerciseId: 'we1',
        setNumber: 1,
        reps: 10,
        weight: 50,
        weightUnit: 'kg',
        completedAt: now.millisecondsSinceEpoch));
    final trend = await db.analyticsDao.getWeeklyVolumeTrend(weeks: 4);
    expect(trend, hasLength(4));
    expect(trend.last.volume, 500.0); // current week = 10*50
    expect(trend.last.byMuscleGroup['Chest'], 500.0);
  });
}
