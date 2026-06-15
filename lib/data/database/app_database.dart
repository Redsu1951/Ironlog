import 'package:drift/drift.dart';

import 'daos/analytics_dao.dart';
import 'daos/exercise_dao.dart';
import 'daos/plan_dao.dart';
import 'daos/sets_dao.dart';
import 'daos/user_dao.dart';
import 'daos/workout_dao.dart';
import 'tables/ai_nudges_table.dart';
import 'tables/body_measurements_table.dart';
import 'tables/exercises_table.dart';
import 'tables/goals_table.dart';
import 'tables/muscle_groups_table.dart';
import 'tables/sets_table.dart';
import 'tables/users_table.dart';
import 'tables/workout_exercises_table.dart';
import 'tables/workout_plan_days_table.dart';
import 'tables/workout_plans_table.dart';
import 'tables/workouts_table.dart';

part 'app_database.g.dart';

/// The single Drift database for IronLog. Opened via `database_helper.dart`
/// (WAL journal mode, background isolate). See CLAUDE.md §7–§8.
@DriftDatabase(
  tables: [
    Users,
    Exercises,
    MuscleGroups,
    WorkoutPlans,
    WorkoutPlanDays,
    Workouts,
    WorkoutExercises,
    Sets,
    Goals,
    BodyMeasurements,
    AiNudges,
  ],
  daos: [UserDao, ExerciseDao, WorkoutDao, SetsDao, PlanDao, AnalyticsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
