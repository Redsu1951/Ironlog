import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// Builds the IronLog [ThemeData] for each brightness, parameterised by the
/// user's accent colour (CLAUDE.md §10). Retro-modern: pixel headers, Inter
/// body, monospaced stats, electric-lime accent by default.
abstract final class AppTheme {
  static ThemeData dark(Color accent) => _build(
        brightness: Brightness.dark,
        accent: accent,
        background: AppColors.background,
        surface: AppColors.surface,
        surfaceVariant: AppColors.surfaceVariant,
        textPrimary: AppColors.textPrimary,
        textSecondary: AppColors.textSecondary,
        divider: AppColors.divider,
      );

  static ThemeData light(Color accent) => _build(
        brightness: Brightness.light,
        accent: accent,
        background: AppColors.backgroundLight,
        surface: AppColors.surfaceLight,
        surfaceVariant: AppColors.surfaceVariantLight,
        textPrimary: AppColors.textPrimaryLight,
        textSecondary: AppColors.textSecondaryLight,
        divider: AppColors.dividerLight,
      );

  static ThemeData _build({
    required Brightness brightness,
    required Color accent,
    required Color background,
    required Color surface,
    required Color surfaceVariant,
    required Color textPrimary,
    required Color textSecondary,
    required Color divider,
  }) {
    // On a lime/cyan accent, black foreground reads best; on dark accents, white.
    final onAccent =
        accent.computeLuminance() > 0.45 ? Colors.black : Colors.white;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: accent,
      onPrimary: onAccent,
      secondary: AppColors.secondaryAccent,
      onSecondary: Colors.white,
      error: AppColors.secondaryAccent,
      onError: Colors.white,
      surface: surface,
      onSurface: textPrimary,
      surfaceContainerHighest: surfaceVariant,
      outline: divider,
    );

    TextStyle withColor(TextStyle s, Color c) => s.copyWith(color: c);

    final textTheme = TextTheme(
      displayLarge: withColor(AppTypography.headerLarge, textPrimary),
      headlineMedium: withColor(AppTypography.screenTitle, textPrimary),
      titleMedium: withColor(AppTypography.sectionLabel, textPrimary),
      bodyLarge: withColor(AppTypography.body, textPrimary),
      bodyMedium: withColor(AppTypography.body, textPrimary),
      bodySmall: withColor(AppTypography.caption, textSecondary),
      labelLarge: withColor(AppTypography.button, textPrimary),
      labelSmall: withColor(AppTypography.caption, textSecondary),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: background,
      colorScheme: colorScheme,
      canvasColor: background,
      dividerColor: divider,
      textTheme: textTheme,
      fontFamily: AppTypography.inter,
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: withColor(AppTypography.screenTitle, textPrimary),
      ),
      cardTheme: CardThemeData(
        color: surfaceVariant,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: divider),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: accent.withValues(alpha: 0.18),
        elevation: 0,
        height: 64,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => AppTypography.caption.copyWith(
            color: states.contains(WidgetState.selected)
                ? accent
                : textSecondary,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? accent
                : textSecondary,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: withColor(AppTypography.body, textSecondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.secondaryAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: AppColors.secondaryAccent, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: onAccent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: AppTypography.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: accent,
          side: BorderSide(color: accent),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: AppTypography.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: accent,
          textStyle: AppTypography.button,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surface,
        selectedColor: accent.withValues(alpha: 0.18),
        side: BorderSide(color: divider),
        labelStyle: withColor(AppTypography.caption, textPrimary),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      dividerTheme: DividerThemeData(color: divider, thickness: 1, space: 1),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: accent),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: surfaceVariant,
        contentTextStyle: withColor(AppTypography.body, textPrimary),
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? accent : textSecondary),
        trackColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected)
                ? accent.withValues(alpha: 0.4)
                : surface),
      ),
    );
  }
}
