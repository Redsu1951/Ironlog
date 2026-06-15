import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ai/gemma_service.dart';
import 'app.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/preferences_provider.dart';
import 'services/display_service.dart';
import 'services/seed_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // MediaPipe LLM plugin requires initialization before any other plugin calls.
  await FlutterGemma.initialize();

  // Firebase is optional — app runs fully offline without google-services.json.
  // kFirebaseAvailable governs all Firebase-dependent features (CLAUDE.md §13).
  try {
    await Firebase.initializeApp();
    kFirebaseAvailable = true;
    debugPrint('[IronLog] Firebase initialized OK');
  } catch (e) {
    kFirebaseAvailable = false;
    debugPrint('[IronLog] Firebase init failed: $e');
  }

  // Preload SharedPreferences so synchronous providers (theme, auth) can build
  // without async gaps, and share one ProviderContainer across seeding + UI.
  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
  );

  await container.read(seedServiceProvider).seedIfNeeded();

  // Best-effort 120Hz cap once the engine has a surface.
  WidgetsBinding.instance.addPostFrameCallback((_) {
    unawaited(container.read(displayServiceProvider).setFrameRate(120));
  });

  // Start loading the Gemma model in background — non-blocking.
  // By the time the user opens a workout, the model is typically ready.
  unawaited(container.read(gemmaInitProvider.future).catchError((_) => false));

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const IronLogApp(),
    ),
  );
}
