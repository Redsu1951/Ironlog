// IronLogApp — root widget.
//
// Phase 7: MaterialApp.router driven by go_router (CLAUDE.md §11).
// Router is provided via routerProvider (keepAlive) from app_router.dart.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';

class IronLogApp extends ConsumerWidget {
  const IronLogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'IronLog',
      debugShowCheckedModeBanner: false,
      themeMode: theme.themeMode,
      theme: AppTheme.light(theme.accentColor),
      darkTheme: AppTheme.dark(theme.accentColor),
      routerConfig: router,
    );
  }
}
