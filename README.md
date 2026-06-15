<div align="center">

# IronLog

**Offline-first. AI-powered. Fully private.**

A gym tracking app that thinks — without ever sending your data anywhere.

[![Flutter](https://img.shields.io/badge/Flutter-3.38-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10-0175C2?logo=dart)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)](https://flutter.dev)

</div>

---

## What It Is

IronLog is a gym tracker with an on-device AI coach. You speak or type your workout — *"bench press 3x8 at 225 pounds"* — and a locally running Gemma 4 E2B model parses the entry, tracks volume progression, detects plateaus, and flags injury risk. No cloud inference. No subscription. No internet required for anything except optional backup.

The single progression metric is **Volume = Sets × Reps × Weight**. No 1-rep max estimates, no pseudoscience.

---

## Features

| | |
|---|---|
| **Voice & text logging** | Natural language input parsed by on-device Gemma 4 E2B (MediaPipe LLM Inference API) |
| **Full offline operation** | Every feature — AI, charts, history, planning — works in airplane mode |
| **Safety checks** | Flags >15% week-over-week volume increase per muscle group before you get hurt |
| **Previous session recall** | Always shows your last set/rep/weight for the same exercise while logging |
| **Weekly planner** | Structured split builder with AI-generated plan suggestions |
| **Analytics** | Volume charts by exercise, muscle group, and total body over any date range |
| **Rest timer** | Configurable per-exercise, fires a local push notification when up |
| **Cloud backup** | SQLite file backup to Firebase Storage — optional, manual or auto on workout complete |
| **800+ exercises** | Pre-seeded from the open-source wger database |
| **120 Hz native** | Targets 120 FPS on high-refresh-rate Android displays |

---

## Architecture

```
lib/
├── core/          # Constants, theme, router, utilities
│   └── constants/
│       └── ai_prompts.dart   ← ALL Gemma prompts live here and only here
├── data/          # Drift (SQLite) tables, DAOs, repositories, Firebase datasource
├── domain/        # Pure Dart entities, repository interfaces, use cases
├── presentation/  # Screens, widgets, Riverpod providers
├── ai/            # GemmaService, WorkoutParser, InsightsEngine, SafetyChecker
└── services/      # Voice (STT), sync, notifications, exercise seed
```

**State management:** Riverpod 3 with code generation — no `setState` in any screen.  
**Database:** Drift (type-safe SQLite with reactive streams).  
**Navigation:** go_router with auth guard redirecting unauthenticated users to onboarding.  
**AI fallback:** If the Gemma model isn't loaded, regex parsers and template-based insights keep everything functional.

---

## Tech Stack

| Layer | Package |
|---|---|
| Framework | Flutter 3.38.5 / Dart 3.10 |
| State | flutter_riverpod 3.x + riverpod_generator 4.x |
| Database | drift 2.31 + sqlite3_flutter_libs |
| On-device AI | flutter_gemma 0.12.x (MediaPipe LLM Inference) |
| Auth | firebase_auth 6.x + google_sign_in 7.x |
| Cloud backup | firebase_storage 13.x + cloud_firestore 6.x |
| Navigation | go_router 17.x |
| Charts | fl_chart 1.x |
| Voice | speech_to_text 7.x |
| Notifications | flutter_local_notifications 17.x |

---

## Getting Started

### Prerequisites
- Flutter 3.38+ (`flutter --version`)
- An Android device or emulator (API 26+)
- (Optional) Firebase project for auth + backup

### 1. Clone & install
```bash
git clone https://github.com/Redsu1951/ironlog.git
cd ironlog
flutter pub get
```

### 2. Firebase setup (optional — app runs fully offline without it)
Firebase initialization is guarded at startup. The app builds and runs with no credentials. To enable Google Sign-In and cloud backup:

1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com).
2. Add an Android app with package ID `com.ironlog.app`.
3. Download `google-services.json` and place it in `android/app/` (git-ignored — see `google-services.json.example` for the shape).
4. Enable **Google Sign-In**, **Firestore**, and **Storage** in the Firebase Console.

### 3. Seed exercise data (one-time, development only)
```bash
dart run scripts/download_wger_data.dart
# Fetches from the wger open-source API → writes assets/data/exercises_seed.json
```
The seed file is already bundled in this repo. Only re-run if you want a fresh pull.

### 4. Code generation
Run after any change to Drift table definitions, Freezed models, or Riverpod providers:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Run
```bash
adb devices                   # confirm device is attached
flutter run --release         # release mode for accurate rendering performance
```

### 6. Build APK
```bash
flutter build apk --release --split-per-abi
```

---

## The AI Model

**Gemma 4 E2B** (Edge 2B, INT4 quantized, ~1.1 GB) runs entirely on-device via MediaPipe's LLM Inference API. It's downloaded once after onboarding — the APK ships without it.

- GPU-accelerated on Adreno (Vulkan/OpenCL path via MediaPipe)
- CPU fallback on unsupported hardware
- All prompt templates are centralized in [`lib/core/constants/ai_prompts.dart`](lib/core/constants/ai_prompts.dart)
- Inference targets: parsing < 3s, insights < 6s, safety check < 2s

Model file: `gemma-4-e2b-it-gpu-int4.bin` — available from [Hugging Face `google/gemma-4-e2b-it-mediapipe`](https://huggingface.co/google/gemma-4-e2b-it-mediapipe).

---

## Design

Dark-first design with a retro-CRT accent palette. Electric lime (`#E8FF47`) on near-black (`#0D0D0D`). Typography: **Pixelify Sans** for headers, **Inter** for body, **Inter Mono** for all numeric stats (weight, reps, volume). 8px spacing grid.

---

## Key Constraints (by design)

- **No 1-rep max.** Volume is the only progression metric.
- **No network calls at runtime.** `dio` is a dev-only dependency for the seed script.
- **No `setState` in screens.** Riverpod only.
- **All prompts centralized.** `ai_prompts.dart` is the single source of truth.


---

## License

MIT — see [LICENSE](LICENSE).
