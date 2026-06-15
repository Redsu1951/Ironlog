import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ironlog/core/theme/app_colors.dart';
import 'package:ironlog/core/theme/theme_provider.dart';
import 'package:ironlog/core/utils/preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Phase 3 validation: theme choices persist to SharedPreferences and reload
/// (CLAUDE.md §17 — "theme persists across restarts").
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<ProviderContainer> container(
      [Map<String, Object> seed = const {}]) async {
    SharedPreferences.setMockInitialValues(seed);
    final prefs = await SharedPreferences.getInstance();
    return ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
  }

  test('defaults to dark mode + lime accent', () async {
    final c = await container();
    final s = c.read(themeProvider);
    expect(s.themeMode, ThemeMode.dark);
    expect(s.accentColor, AppColors.primaryAccent);
  });

  test('accent + mode persist and survive a fresh container', () async {
    final c = await container();
    c.read(themeProvider.notifier).setThemeMode(ThemeMode.light);
    c.read(themeProvider.notifier).setAccentColor(const Color(0xFF00D2FF));

    // Simulate a restart: new container over the same (persisted) prefs store.
    final prefs = await SharedPreferences.getInstance();
    final restarted = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    final s = restarted.read(themeProvider);
    expect(s.themeMode, ThemeMode.light);
    expect(AppColors.toHex(s.accentColor), '#00D2FF');
  });

  test('resetAccent returns to the default lime', () async {
    final c = await container({'accent_hex': '#FF4757'});
    expect(AppColors.toHex(c.read(themeProvider).accentColor), '#FF4757');
    c.read(themeProvider.notifier).resetAccent();
    expect(c.read(themeProvider).accentColor, AppColors.primaryAccent);
  });
}
