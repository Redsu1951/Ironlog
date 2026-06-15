import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/preferences_provider.dart';
import 'app_colors.dart';

part 'theme_provider.g.dart';

const String _kThemeModeKey = 'theme_mode';
const String _kAccentHexKey = 'accent_hex';

/// Immutable theme settings (CLAUDE.md §10/§13): light/dark/system + accent.
@immutable
class ThemeState {
  const ThemeState({required this.themeMode, required this.accentColor});

  final ThemeMode themeMode;
  final Color accentColor;

  ThemeState copyWith({ThemeMode? themeMode, Color? accentColor}) => ThemeState(
        themeMode: themeMode ?? this.themeMode,
        accentColor: accentColor ?? this.accentColor,
      );
}

/// Holds theme settings, persisting every change to SharedPreferences so the
/// choice survives restarts. Global (keepAlive) — the whole app reads it.
@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeState build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final accentHex = prefs.getString(_kAccentHexKey);
    return ThemeState(
      themeMode: _parseMode(prefs.getString(_kThemeModeKey)),
      accentColor: accentHex != null
          ? AppColors.fromHex(accentHex)
          : AppColors.primaryAccent,
    );
  }

  void setThemeMode(ThemeMode mode) {
    ref.read(sharedPreferencesProvider).setString(_kThemeModeKey, mode.name);
    state = state.copyWith(themeMode: mode);
  }

  void setAccentColor(Color color) {
    ref
        .read(sharedPreferencesProvider)
        .setString(_kAccentHexKey, AppColors.toHex(color));
    state = state.copyWith(accentColor: color);
  }

  void resetAccent() {
    ref.read(sharedPreferencesProvider).remove(_kAccentHexKey);
    state = state.copyWith(accentColor: AppColors.primaryAccent);
  }

  static ThemeMode _parseMode(String? raw) {
    switch (raw) {
      case 'light':
        return ThemeMode.light;
      case 'system':
        return ThemeMode.system;
      case 'dark':
      default:
        return ThemeMode.dark;
    }
  }
}
