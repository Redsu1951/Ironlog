# CLAUDE.md — IronLog Project Intelligence File
# READ THIS ENTIRE FILE BEFORE WRITING A SINGLE LINE OF CODE.
# Every decision here is final. Ask before deviating.

---

## 1. Project Identity

| Field | Value |
|-------|-------|
| App Name | IronLog |
| Package ID | com.ironlog.app |
| Version | 1.0.0+1 |
| Type | Offline-first, AI-powered gym tracker |
| Primary Platform | Android (OnePlus 13R — Snapdragon 7s Gen 3, 120Hz) |
| Secondary Platform | iOS (to be tested later, Mac not currently available) |
| Monetization | Free for now — no purchase gates, stub RevenueCat for future |

---

## 2. Tech Stack (LOCKED — Do Not Change Without Explicit Approval)

| Layer | Technology | Why |
|-------|-----------|-----|
| Framework | Flutter 3.22+ (Dart) | 120Hz perf, single codebase Android + iOS |
| State Management | flutter_riverpod 2.x + riverpod_generator | Compile-safe, scalable, no boilerplate |
| Local Database | Drift 2.x (type-safe SQLite) | Reactive queries, codegen, fast |
| On-Device AI | flutter_gemma (MediaPipe LLM Inference API) | Gemma 4 E2B — runs fully offline |
| Voice Input | speech_to_text | Uses OS on-device STT — works offline |
| Auth | firebase_auth + google_sign_in | Google OAuth only |
| Cloud Backup | Firebase Storage + Cloud Firestore | SQLite file backup/restore |
| Navigation | go_router | Declarative, deep-link capable |
| Charts | fl_chart | Performant, customizable, no internet |
| Push Notifications | flutter_local_notifications | Rest timers, nudges |
| Exercise Data | wger open-source database (JSON seed) | 800+ exercises, pre-loaded |
| HTTP (dev only) | dio | Only for seeding script — no runtime internet calls |
| Display Mode | flutter_displaymode | 120/144Hz cap setting |
| Code Generation | build_runner + drift_dev + riverpod_generator + freezed | |

---

## 3. AI Model — Gemma 4 E2B (CRITICAL)

### Model Specification
- **Model:** Gemma 4 E2B (Edge 2B parameters, INT4 quantized)
- **Size on disk:** ~1.1 GB
- **Runtime:** MediaPipe LLM Inference API via `flutter_gemma`
- **Execution:** GPU-accelerated on Android (Adreno 710 on OnePlus 13R), CPU fallback
- **Model filename:** `gemma-4-e2b-it-gpu-int4.bin`
- **Storage path:** `{getApplicationDocumentsDirectory()}/models/gemma-4-e2b-it-gpu-int4.bin`
- **Download source:** Hugging Face `google/gemma-4-e2b-it-mediapipe` (INT4 GPU variant)
- **When downloaded:** Once, on first launch after onboarding, with visible progress UI

### Model Download UX
1. After Google Sign-In completes, show a dedicated "Setting up your AI" screen
2. Show download progress bar with MB/total MB
3. Message: "IronLog's AI works completely offline once this is done. This only happens once."
4. Allow "Skip for now" — app works without AI (regex fallback for parsing)
5. If skipped, show a banner on Home screen to complete AI setup

### AI Response Time Targets
| Task | Target |
|------|--------|
| Workout log parsing | < 3 seconds |
| Insight generation | < 6 seconds |
| Safety check | < 2 seconds |
| Plan suggestion | < 10 seconds |

### Fallback Behavior (When Model Not Loaded)
- `WorkoutParser` falls back to regex patterns for common formats
- `InsightsEngine` falls back to template-based insights using computed stats
- `SafetyChecker` always runs (pure math, no AI needed)
- Never crash — degrade gracefully

---

## 4. Strict Rules (NEVER Violate These)

```
❌ NEVER use 1-Rep Max (1RM) calculations. Anywhere. Ever.
❌ NEVER use setState in any screen widget — Riverpod only.
❌ NEVER hardcode Gemma prompts outside core/constants/ai_prompts.dart.
❌ NEVER use Provider, GetX, or Bloc — Riverpod only.
❌ NEVER use the http package — use dio (dev/seeding only) or no HTTP at runtime.
❌ NEVER use Column for scrollable lists — always ListView.builder.
❌ NEVER add RevenueCat or purchase code yet — stub with TODO comment.
❌ NEVER commit google-services.json or GoogleService-Info.plist to git.
❌ NEVER call 1RM, oneRepMax, one_rep_max, or estimatedMax in any variable/method.
❌ NEVER use a charting library other than fl_chart.
✅ ALWAYS: Volume = Sets × Reps × Weight. This is the only progression metric.
✅ ALWAYS: Every feature must work in airplane mode.
✅ ALWAYS: All Riverpod providers should be autoDispose unless explicitly global.
✅ ALWAYS: Use const constructors wherever possible.
✅ ALWAYS: Use RepaintBoundary around chart widgets.
```

---

## 5. Directory Structure (EXACT — Follow This Precisely)

```
ironlog/
├── lib/
│   ├── main.dart                        # Entry point: Firebase.initializeApp(), runApp(ProviderScope(...))
│   ├── app.dart                         # IronLogApp: MaterialApp.router with theme + go_router
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_constants.dart       # Package name, API URLs, version string
│   │   │   ├── db_constants.dart        # Table/column name string constants
│   │   │   └── ai_prompts.dart          # ⚠️ ALL Gemma prompt templates live here and ONLY here
│   │   ├── theme/
│   │   │   ├── app_theme.dart           # ThemeData light + dark
│   │   │   ├── app_colors.dart          # Color palette + custom hex support
│   │   │   ├── app_typography.dart      # Pixelify Sans (headers) + Inter (body) + Inter Mono (stats)
│   │   │   └── theme_provider.dart      # Riverpod: ThemeMode + accentColor, persisted to SharedPrefs
│   │   ├── router/
│   │   │   └── app_router.dart          # go_router: all routes, auth redirect guard
│   │   └── utils/
│   │       ├── extensions.dart          # DateTime, String, num, List extensions
│   │       ├── validators.dart          # Input validation (reps > 0, weight > 0, etc.)
│   │       ├── volume_calculator.dart   # VolumeCalculator.calculate(sets, reps, weight) — single source of truth
│   │       ├── unit_converter.dart      # kg ↔ lbs conversion helpers
│   │       └── safety_threshold.dart    # SafetyThreshold.check(prev, curr) → bool + percentage
│   │
│   ├── data/
│   │   ├── database/
│   │   │   ├── app_database.dart        # @DriftDatabase(tables: [...]) — registers all tables
│   │   │   ├── app_database.g.dart      # Generated — DO NOT EDIT
│   │   │   ├── tables/
│   │   │   │   ├── users_table.dart
│   │   │   │   ├── exercises_table.dart
│   │   │   │   ├── muscle_groups_table.dart
│   │   │   │   ├── workouts_table.dart
│   │   │   │   ├── workout_exercises_table.dart
│   │   │   │   ├── sets_table.dart
│   │   │   │   ├── workout_plans_table.dart
│   │   │   │   ├── workout_plan_days_table.dart
│   │   │   │   ├── goals_table.dart
│   │   │   │   ├── body_measurements_table.dart
│   │   │   │   └── ai_nudges_table.dart
│   │   │   └── daos/
│   │   │       ├── exercise_dao.dart
│   │   │       ├── workout_dao.dart
│   │   │       ├── sets_dao.dart
│   │   │       ├── plan_dao.dart
│   │   │       └── analytics_dao.dart
│   │   ├── models/                      # Freezed DTOs for JSON serialization
│   │   │   ├── parsed_workout_entry.dart  # AI parser output
│   │   │   ├── exercise_model.dart
│   │   │   ├── workout_model.dart
│   │   │   ├── insight_context.dart
│   │   │   └── wger_response_model.dart   # For seeding script
│   │   ├── repositories/
│   │   │   ├── exercise_repository_impl.dart
│   │   │   ├── workout_repository_impl.dart
│   │   │   └── sync_repository_impl.dart
│   │   └── datasources/
│   │       ├── local/
│   │       │   └── database_helper.dart   # DB file path, WAL mode, vacuum
│   │       └── remote/
│   │           └── firebase_datasource.dart  # uploadDB(), downloadDB(), getMetadata()
│   │
│   ├── domain/
│   │   ├── entities/                    # Pure Dart — zero Flutter/Firebase imports
│   │   │   ├── exercise.dart
│   │   │   ├── workout.dart
│   │   │   ├── workout_set.dart
│   │   │   └── muscle_group.dart
│   │   ├── repositories/               # Abstract interfaces
│   │   │   ├── exercise_repository.dart
│   │   │   ├── workout_repository.dart
│   │   │   └── sync_repository.dart
│   │   └── usecases/
│   │       ├── log_set_usecase.dart
│   │       ├── get_exercise_history_usecase.dart
│   │       ├── calculate_volume_usecase.dart
│   │       ├── generate_ai_insight_usecase.dart
│   │       └── sync_database_usecase.dart
│   │
│   ├── presentation/
│   │   ├── screens/
│   │   │   ├── splash/
│   │   │   │   └── splash_screen.dart
│   │   │   ├── onboarding/
│   │   │   │   ├── onboarding_screen.dart       # 3-page swiper
│   │   │   │   ├── profile_setup_screen.dart    # Name, age, weight, height
│   │   │   │   ├── goal_setup_screen.dart       # Goal text + target weight
│   │   │   │   ├── auth_screen.dart             # Google Sign-In
│   │   │   │   └── model_download_screen.dart   # Gemma download progress
│   │   │   ├── home/
│   │   │   │   └── home_screen.dart             # Dashboard
│   │   │   ├── workout/
│   │   │   │   ├── active_workout_screen.dart   # ⚠️ MOST CRITICAL SCREEN
│   │   │   │   ├── exercise_picker_screen.dart
│   │   │   │   ├── rest_timer_widget.dart
│   │   │   │   └── plate_calculator_screen.dart
│   │   │   ├── planner/
│   │   │   │   ├── weekly_planner_screen.dart
│   │   │   │   └── split_builder_screen.dart
│   │   │   ├── analytics/
│   │   │   │   ├── analytics_screen.dart        # 3 tabs: Exercise / Muscle / Full Body
│   │   │   │   ├── exercise_chart_widget.dart
│   │   │   │   └── muscle_heatmap_widget.dart
│   │   │   ├── history/
│   │   │   │   └── workout_history_screen.dart
│   │   │   ├── profile/
│   │   │   │   └── profile_screen.dart
│   │   │   └── settings/
│   │   │       └── settings_screen.dart
│   │   ├── widgets/                     # Reusable components
│   │   │   ├── ironlog_button.dart      # Primary CTA button (retro-modern style)
│   │   │   ├── ironlog_card.dart        # Surface card widget
│   │   │   ├── ironlog_text_field.dart  # Styled text input
│   │   │   ├── voice_input_fab.dart     # Mic FAB + overlay
│   │   │   ├── ai_insight_card.dart     # Shows Gemma output with shimmer
│   │   │   ├── set_row_widget.dart      # One row in the set logger
│   │   │   ├── volume_badge.dart        # Displays total volume with unit
│   │   │   └── shimmer_loader.dart      # Loading skeleton
│   │   └── providers/
│   │       ├── workout_provider.dart
│   │       ├── exercise_provider.dart
│   │       ├── analytics_provider.dart
│   │       ├── auth_provider.dart
│   │       └── ai_provider.dart
│   │
│   ├── ai/
│   │   ├── gemma_service.dart           # MediaPipe LLM Inference wrapper singleton
│   │   ├── workout_parser.dart          # NL → ParsedWorkoutEntry
│   │   ├── insights_engine.dart         # Data context → NL coaching insight
│   │   └── safety_checker.dart          # Volume delta math + AI warning message
│   │
│   └── services/
│       ├── voice_service.dart           # speech_to_text wrapper
│       ├── sync_service.dart            # Orchestrates Firebase backup/restore
│       ├── notification_service.dart    # Rest timer + nudge notifications
│       └── seed_service.dart            # wger JSON → SQLite on first launch
│
├── assets/
│   ├── fonts/
│   │   ├── PixelifySans/                # Retro pixel-art font (OFL license)
│   │   └── Inter/                       # Modern UI body font
│   ├── icons/
│   │   └── app_icon.png
│   └── data/
│       └── exercises_seed.json          # Pre-processed wger exercise dump
│
├── scripts/
│   └── download_wger_data.dart          # Run once: dart run scripts/download_wger_data.dart
│
├── test/
│   ├── unit/
│   │   ├── volume_calculator_test.dart
│   │   ├── workout_parser_test.dart
│   │   └── safety_threshold_test.dart
│   └── widget/
│       └── set_row_widget_test.dart
│
├── android/
├── ios/
├── pubspec.yaml
├── CLAUDE.md                            # This file
├── .gitignore
└── README.md
```

---

## 6. pubspec.yaml — Complete Dependency List

```yaml
name: ironlog
description: Offline-first AI-powered gym tracking app.
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.3.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

  # Database
  drift: ^2.18.0
  sqlite3_flutter_libs: ^0.5.24
  path_provider: ^2.1.3
  path: ^1.9.0

  # Firebase
  firebase_core: ^3.2.0
  firebase_auth: ^5.1.2
  google_sign_in: ^6.2.1
  firebase_storage: ^12.1.0
  cloud_firestore: ^5.1.0

  # Navigation
  go_router: ^14.2.0

  # AI / ML (Gemma 4 E2B via MediaPipe)
  flutter_gemma: ^0.3.0

  # Voice / Speech
  speech_to_text: ^7.0.0

  # Charts
  fl_chart: ^0.68.0

  # Notifications
  flutter_local_notifications: ^17.2.1

  # Display Refresh Rate
  flutter_displaymode: ^0.6.2

  # UI / Fonts
  google_fonts: ^6.2.1

  # Utilities
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
  uuid: ^4.4.2
  intl: ^0.19.0
  connectivity_plus: ^6.0.3
  shared_preferences: ^2.3.2
  shimmer: ^3.0.0
  permission_handler: ^11.3.1

  # HTTP (seeding script only — never used at runtime)
  dio: ^5.4.3

  # Future monetization stub (uncomment when ready)
  # purchases_flutter: ^7.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  build_runner: ^2.4.11
  drift_dev: ^2.18.0
  riverpod_generator: ^2.4.0
  freezed: ^2.5.2
  json_serializable: ^6.8.0
  custom_lint: ^0.6.4
  riverpod_lint: ^2.3.10

flutter:
  uses-material-design: true

  assets:
    - assets/data/exercises_seed.json
    - assets/icons/

  fonts:
    - family: PixelifySans
      fonts:
        - asset: assets/fonts/PixelifySans/PixelifySans-Regular.ttf
        - asset: assets/fonts/PixelifySans/PixelifySans-Bold.ttf
          weight: 700
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter/Inter-Regular.ttf
        - asset: assets/fonts/Inter/Inter-Medium.ttf
          weight: 500
        - asset: assets/fonts/Inter/Inter-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Inter/Inter-Bold.ttf
          weight: 700
    - family: InterMono
      fonts:
        - asset: assets/fonts/InterMono/InterMono-Regular.ttf
```

---

## 7. Database Schema (Drift — EXACT SPECIFICATION)

### Table: users
```dart
class Users extends Table {
  TextColumn get id => text()();                         // UUID v4 PRIMARY KEY
  TextColumn get firebaseUid => text().nullable()();     // From Google Sign-In
  TextColumn get name => text()();
  IntColumn get age => integer().nullable()();
  RealColumn get weightKg => real().nullable()();
  RealColumn get heightCm => real().nullable()();
  TextColumn get goalDescription => text().nullable()(); // e.g. "Bulk to 80kg"
  RealColumn get goalWeightKg => real().nullable()();
  TextColumn get preferredUnit => text().withDefault(const Constant('kg'))(); // 'kg' | 'lbs'
  TextColumn get themeMode => text().withDefault(const Constant('dark'))();
  TextColumn get customAccentHex => text().nullable()();  // e.g. '#E8FF47'
  IntColumn get frameRateCap => integer().withDefault(const Constant(120))(); // 60/90/120/144
  IntColumn get createdAt => integer()();                 // Unix ms
  IntColumn get updatedAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}
```

### Table: muscle_groups
```dart
class MuscleGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();                      // e.g. 'Upper Chest', 'Quads'
  IntColumn get parentId => integer().nullable()();     // FK → muscle_groups.id (hierarchy)
  TextColumn get bodyRegion => text()();                // 'push'/'pull'/'legs'/'core'/'full'
  IntColumn get displayOrder => integer().withDefault(const Constant(0))();
}
```

### Table: exercises
```dart
class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get wgerId => integer().nullable()();       // Source ID from wger API
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  IntColumn get primaryMuscleId => integer()();         // FK → muscle_groups.id
  TextColumn get secondaryMuscleIds => text().withDefault(const Constant('[]'))(); // JSON int array
  TextColumn get equipment => text().withDefault(const Constant('[]'))();           // JSON string array
  TextColumn get category => text().withDefault(const Constant(''))();              // wger category
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
  TextColumn get instructions => text().withDefault(const Constant(''))();
  TextColumn get aliases => text().withDefault(const Constant('[]'))();             // Alternate names
  IntColumn get createdAt => integer()();
}
```

### Table: workout_plans
```dart
class WorkoutPlans extends Table {
  TextColumn get id => text()();                        // UUID
  TextColumn get userId => text()();                    // FK → users.id
  TextColumn get name => text()();                      // e.g. 'My PPL Split'
  TextColumn get description => text().withDefault(const Constant(''))();
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}
```

### Table: workout_plan_days
```dart
class WorkoutPlanDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get planId => text()();                    // FK → workout_plans.id
  IntColumn get dayOfWeek => integer()();               // 0=Monday, 6=Sunday
  TextColumn get name => text()();                      // e.g. 'Chest & Triceps'
  TextColumn get muscleGroupIds => text().withDefault(const Constant('[]'))(); // JSON int array
  BoolColumn get isRestDay => boolean().withDefault(const Constant(false))();
}
```

### Table: workouts
```dart
class Workouts extends Table {
  TextColumn get id => text()();                        // UUID
  TextColumn get userId => text()();                    // FK → users.id
  TextColumn get planId => text().nullable()();         // FK → workout_plans.id (null if ad-hoc)
  IntColumn get planDayId => integer().nullable()();    // FK → workout_plan_days.id
  TextColumn get name => text()();
  IntColumn get startedAt => integer()();               // Unix ms
  IntColumn get endedAt => integer().nullable()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  RealColumn get totalVolumeKg => real().withDefault(const Constant(0.0))();
  BoolColumn get isAdHoc => boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {id};
}
```

### Table: workout_exercises
```dart
class WorkoutExercises extends Table {
  TextColumn get id => text()();                        // UUID
  TextColumn get workoutId => text()();                 // FK → workouts.id
  IntColumn get exerciseId => integer()();              // FK → exercises.id
  IntColumn get orderIndex => integer()();              // Position in workout
  IntColumn get supersetGroup => integer().nullable()(); // Groups supersets together
  TextColumn get notes => text().withDefault(const Constant(''))();
  @override
  Set<Column> get primaryKey => {id};
}
```

### Table: sets
```dart
class Sets extends Table {
  TextColumn get id => text()();                        // UUID
  TextColumn get workoutExerciseId => text()();         // FK → workout_exercises.id
  IntColumn get setNumber => integer()();               // 1-based
  IntColumn get reps => integer()();
  RealColumn get weight => real()();                    // In user's preferred unit
  TextColumn get weightUnit => text()();                // 'kg' | 'lbs'
  TextColumn get setType => text().withDefault(const Constant('working'))();
  // setType: 'warmup' | 'working' | 'dropset' | 'amrap' | 'failure'
  IntColumn get restSeconds => integer().nullable()();  // Actual rest taken
  RealColumn get rpe => real().nullable()();            // Rate of Perceived Exertion 1-10
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get completedAt => integer()();             // Unix ms
  @override
  Set<Column> get primaryKey => {id};
}
```

### Table: goals
```dart
class Goals extends Table {
  TextColumn get id => text()();                        // UUID
  TextColumn get userId => text()();
  TextColumn get type => text()();                      // 'volume'|'reps'|'bodyweight'|'measurement'
  TextColumn get description => text()();
  RealColumn get targetValue => real()();
  RealColumn get currentValue => real().withDefault(const Constant(0.0))();
  IntColumn get exerciseId => integer().nullable()();
  IntColumn get muscleGroupId => integer().nullable()();
  IntColumn get deadline => integer().nullable()();     // Unix ms
  IntColumn get createdAt => integer()();
  IntColumn get achievedAt => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
```

### Table: body_measurements
```dart
class BodyMeasurements extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  RealColumn get weightKg => real().nullable()();
  RealColumn get bodyFatPct => real().nullable()();
  RealColumn get chestCm => real().nullable()();
  RealColumn get waistCm => real().nullable()();
  RealColumn get hipsCm => real().nullable()();
  RealColumn get bicepCm => real().nullable()();
  RealColumn get thighCm => real().nullable()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get measuredAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}
```

### Table: ai_nudges
```dart
class AiNudges extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get type => text()();
  // type: 'plan_suggestion'|'plateau_warning'|'safety_warning'|'goal_update'|'adhoc_nudge'
  TextColumn get message => text()();                   // Full AI-generated message
  TextColumn get actionData => text().withDefault(const Constant('{}'))(); // JSON extras
  BoolColumn get isDismissed => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  @override
  Set<Column> get primaryKey => {id};
}
```

---

## 8. DAO Method Contracts (Required Signatures)

### ExerciseDao
```dart
Future<List<ExerciseData>> getAllExercises();
Future<List<ExerciseData>> searchExercises(String query);
Future<List<ExerciseData>> getExercisesByMuscleGroup(int muscleGroupId);
Future<ExerciseData?> getExerciseById(int id);
Future<int> insertExercise(ExercisesCompanion exercise);
Future<void> batchInsertExercises(List<ExercisesCompanion> exercises);
```

### WorkoutDao
```dart
Future<String> createWorkout(WorkoutsCompanion workout); // Returns UUID
Future<void> updateWorkout(WorkoutsCompanion workout);
Future<WorkoutData?> getWorkoutById(String id);
Future<List<WorkoutData>> getRecentWorkouts({int limit = 20});
Future<List<WorkoutData>> getWorkoutsByDateRange(DateTime start, DateTime end);
Future<int> getAdHocWorkoutCount(); // For AI nudge threshold check
```

### SetsDao
```dart
Future<String> insertSet(SetsCompanion set); // Returns UUID
Future<void> updateSet(SetsCompanion set);
Future<void> deleteSet(String id);
Future<List<SetData>> getSetsForWorkoutExercise(String workoutExerciseId);
Future<List<SetData>> getPreviousSessionSets(int exerciseId, String userId);
// getPreviousSessionSets: the last completed workout where this exercise appears
```

### PlanDao
```dart
Future<WorkoutPlanData?> getActivePlan();
Future<void> setActivePlan(String planId);
Future<String> createPlan(WorkoutPlansCompanion plan);
Future<WorkoutPlanDayData?> getPlanDayForToday(String planId);
Future<List<WorkoutPlanDayData>> getDaysForPlan(String planId);
```

### AnalyticsDao
```dart
Future<List<VolumeDataPoint>> getVolumeByMuscleGroup(int muscleGroupId, DateTime start, DateTime end);
Future<List<VolumeDataPoint>> getExerciseVolumeHistory(int exerciseId, {int limit = 52});
Future<double> getTotalBodyVolume(DateTime start, DateTime end);
Future<List<WeeklyVolumeSummary>> getWeeklyVolumeTrend({int weeks = 12});
// VolumeDataPoint: {date: DateTime, totalVolume: double}
// WeeklyVolumeSummary: {weekStart: DateTime, volume: double, byMuscleGroup: Map<String, double>}
```

---

## 9. AI Prompt Templates (Source of Truth)

> All prompts live in `core/constants/ai_prompts.dart`. Never define prompts elsewhere.

### WORKOUT_PARSER_PROMPT
```
You are a gym log parser. Extract workout data from the user's natural language input.
Respond ONLY with a single valid JSON object. No explanation. No markdown. No preamble.

User input: "{input}"

JSON schema (use null for unknown fields):
{
  "exercise_name": "string — the exercise name as said by user",
  "sets": number | null,
  "reps": number | null,
  "weight": number | null,
  "weight_unit": "lbs" | "kg" | null,
  "set_type": "warmup" | "working" | "dropset" | "amrap" | "failure" | null,
  "confidence": 0.0 to 1.0
}

Rules:
- Weight unit defaults to "lbs" if the user says "pounds" or uses American units or doesn't specify
- "set_type" defaults to "working" if not mentioned
- If reps/sets/weight are not mentioned, use null
- confidence = how sure you are the parse is correct (0.0-1.0)
```

### INSIGHT_PROMPT
```
You are IronLog's personal coaching AI. Be direct, specific, and motivating. Max 3 sentences.

Athlete profile:
- Goal: {goal_description}
- Training for: {weeks_training} weeks

This week's data:
{weekly_json}

Provide ONE coaching insight focusing on: volume trends, plateaus, goal proximity, or muscle imbalances.
Use specific numbers. Never mention 1RM. Volume = Sets × Reps × Weight.
```

### SAFETY_CHECK_PROMPT
```
Gym safety check. Answer in 1-2 sentences only.

Muscle group: {muscle_group}
Last week's total volume: {prev_volume} {unit}
This week's total volume: {new_volume} {unit}
Increase: {pct_change}%

If the increase exceeds 15%, warn the athlete about injury risk and suggest a safer increment.
If 15% or under, respond with exactly: SAFE
```

### PLAN_SUGGESTION_PROMPT
```
You are IronLog's workout planner AI. Based on the athlete's recent workout history, suggest a structured weekly split.

Recent workout history (last 14 days):
{history_json}

Athlete goal: {goal_description}

Respond ONLY with valid JSON:
{
  "plan_name": "string",
  "description": "string — 1 sentence",
  "days": [
    {
      "day_of_week": 0-6 (0=Monday),
      "name": "string e.g. Push Day",
      "muscle_groups": ["string"],
      "is_rest_day": boolean
    }
  ]
}
```

### ADHOC_NUDGE_PROMPT
```
The athlete has logged {count} workouts without a structured plan.

Briefly explain (2-3 sentences) why a structured weekly split improves hypertrophy results.
End with: "Want me to build a plan based on what you've been training?" 
Be encouraging, not preachy.
```

---

## 10. Design System

### Colors

```dart
// Dark Mode (Primary)
static const background = Color(0xFF0D0D0D);     // Near-black canvas
static const surface = Color(0xFF1A1A1A);         // Card background
static const surfaceVariant = Color(0xFF242424);  // Elevated card
static const primaryAccent = Color(0xFFE8FF47);   // Electric lime (retro CRT)
static const secondaryAccent = Color(0xFFFF4757); // Alert red
static const textPrimary = Color(0xFFF0F0F0);     // Body text
static const textSecondary = Color(0xFF8A8A8A);   // Muted text
static const success = Color(0xFF2ED573);          // Green for PRs
static const warning = Color(0xFFFFA502);          // Orange for warnings
static const divider = Color(0xFF2A2A2A);          // Subtle separator

// Light Mode
static const backgroundLight = Color(0xFFF5F5F0);
static const surfaceLight = Color(0xFFFFFFFF);
static const surfaceVariantLight = Color(0xFFF0F0EB);
static const primaryAccentLight = Color(0xFF2D7A00); // Dark green for light bg
```

### Typography Rules
- **Screen Titles / Headers:** PixelifySans Bold 24-32px — retro pixel aesthetic
- **Section Labels / Button Text:** PixelifySans Regular 14-16px
- **Body Text / Descriptions:** Inter Regular/Medium 14-16px
- **Weight / Reps / Volume Numbers:** Inter Mono SemiBold 18-28px — monospaced for alignment
- **Small Labels / Timestamps:** Inter Regular 12px, textSecondary color
- **AI Insight Text:** Inter Regular 15px, italic, textPrimary

### Spacing System (8px grid)
```
xs: 4px | sm: 8px | md: 16px | lg: 24px | xl: 32px | xxl: 48px
Border radius: 8px (small), 12px (medium), 16px (card), 24px (pill button)
```

### Performance Requirements
- All charts wrapped in `RepaintBoundary`
- All lists use `ListView.builder` or `SliverList`
- All images use `const` or `CachedNetworkImage` (for future)
- `const` constructors on every widget that can have them
- Target: 120 FPS on OnePlus 13R (Snapdragon 7s Gen 3 / Adreno 710)
- Riverpod providers: use `autoDispose` modifier unless global singleton

---

## 11. Navigation Routes (go_router)

```
/splash                    → SplashScreen (checks auth + onboarding state)
/onboarding                → OnboardingScreen (swiper)
/onboarding/profile        → ProfileSetupScreen
/onboarding/goals          → GoalSetupScreen
/onboarding/auth           → AuthScreen (Google Sign-In)
/onboarding/model-download → ModelDownloadScreen
/home                      → HomeScreen (bottom nav shell)
/workout/active            → ActiveWorkoutScreen (fullscreen, no bottom nav)
/workout/exercise-picker   → ExercisePickerScreen
/workout/plate-calculator  → PlateCalculatorScreen
/planner                   → WeeklyPlannerScreen
/planner/builder           → SplitBuilderScreen
/analytics                 → AnalyticsScreen (3 tabs)
/history                   → WorkoutHistoryScreen
/profile                   → ProfileScreen
/settings                  → SettingsScreen
```

Auth guard: If no user in SharedPreferences → redirect all routes to `/onboarding`.

---

## 12. Business Logic Rules (Non-Negotiable)

| Rule | Detail |
|------|--------|
| Volume Formula | `total_volume = sets × reps × weight` — the ONLY progression metric |
| Safety Threshold | Flag any muscle group with >15% week-over-week volume increase |
| Ad-Hoc Nudge | After 3 consecutive ad-hoc workouts, AI generates plan suggestion |
| Historical Context | ALWAYS show previous session sets/reps/weight when logging same exercise |
| Unit Preference | User sets kg or lbs once — all input and display must respect it |
| Rest Timer Default | 90 seconds, customizable per exercise, triggers push notification |
| Sync Trigger | Auto-sync on workout complete (background) OR manual "Sync Now" |
| Model Download | Happens once after onboarding — not bundled in APK |
| Ad-Hoc Threshold | `WorkoutDao.getAdHocWorkoutCount()` — count consecutive no-plan workouts |

---

## 13. Firebase Configuration

```
Auth:        Google Sign-In only (no email/password, no Apple, no Twitter)
Storage:     gs://ironlog-app/{uid}/backups/ironlog.db
             gs://ironlog-app/{uid}/backups/ironlog_backup_{timestamp}.db
Firestore:   users/{uid}/metadata → { lastSyncAt, deviceModel, appVersion }
```

### Sync Flow
1. **Upload:** Copy SQLite file → compress (gzip) → upload to Firebase Storage
2. **Download:** Download from Firebase Storage → decompress → replace local DB → restart Drift connection
3. **Conflict:** Last-write-wins (timestamp in Firestore metadata). Show "Backup found from [date], restore?" on new device login.
4. **Internet required:** ONLY for sync. All other features work offline.

---

## 14. Exercise Seed Data

### Source
- **API:** `https://wger.de/api/v2/` (open-source, MIT-compatible license)
- **Endpoint:** `GET /exercise/?format=json&language=2&limit=100` (paginate all pages)
- **Muscle API:** `GET /muscle/?format=json`
- **Equipment API:** `GET /equipment/?format=json`

### Seeding Process
1. Run `dart run scripts/download_wger_data.dart` during development — generates `assets/data/exercises_seed.json`
2. On first app launch: `SeedService.seedIfNeeded()` checks SharedPreferences `'db_seeded'` flag
3. Batch insert: muscle groups first (required for FK), then exercises
4. Set `'db_seeded' = true` only after ALL inserts complete successfully
5. Expected count: 800-1200 exercises, ~50 muscle groups

---

## 15. Code Generation Commands

```bash
# After any schema/model/provider changes — ALWAYS run this:
flutter pub run build_runner build --delete-conflicting-outputs

# During active development (watches for changes):
flutter pub run build_runner watch --delete-conflicting-outputs

# Download wger exercise data (one-time, development):
dart run scripts/download_wger_data.dart

# Run on OnePlus 13R (release mode for accurate performance):
flutter run --release

# Build APK for distribution:
flutter build apk --release --split-per-abi
```

---

## 16. .gitignore Additions

```gitignore
# Firebase (NEVER commit these)
android/app/google-services.json
ios/Runner/GoogleService-Info.plist

# Local SQLite DB
*.db
*.db-wal
*.db-shm

# Environment
.env
*.env.local

# Gemma model (too large for git)
assets/models/
**/gemma*.bin
**/gemma*.tflite
```

---

## 17. Completion Checklist (Verify Before Calling Done)

```
[ ] App fully works in airplane mode (all features)
[ ] Voice: "I did 3 sets of 12 reps squats with 135 pounds" → correctly parsed
[ ] Previous session data shows prominently when logging same exercise again
[ ] Volume charts show progression over weeks/months
[ ] Safety warning appears when >15% week-over-week volume increase
[ ] Ad-hoc nudge appears after 3 consecutive unplanned workouts
[ ] Google Sign-In works and saves user to Firebase
[ ] Sync uploads and downloads the SQLite DB file correctly
[ ] Theme switching (dark/light/custom) works and persists across restarts
[ ] Plate calculator shows correct plates for any target weight
[ ] Rest timer sends push notification when countdown ends
[ ] Frame rate cap (60/90/120) actually changes display refresh rate
[ ] No 1RM anywhere: grep -r "1rm\|oneRepMax\|one_rep_max\|estimatedMax" lib/ → 0 results
[ ] All Gemma prompts only in core/constants/ai_prompts.dart
[ ] No setState used in any screen file
[ ] build_runner generated files are up to date
```
