import 'package:flutter/painting.dart';

/// IronLog palette (CLAUDE.md §10). Retro-modern: near-black canvas with an
/// electric-lime CRT accent.
abstract final class AppColors {
  // ── Dark Mode (primary) ────────────────────────────────────────────
  static const background = Color(0xFF0D0D0D);
  static const surface = Color(0xFF1A1A1A);
  static const surfaceVariant = Color(0xFF242424);
  static const primaryAccent = Color(0xFFE8FF47); // electric lime
  static const secondaryAccent = Color(0xFFFF4757); // alert red
  static const textPrimary = Color(0xFFF0F0F0);
  static const textSecondary = Color(0xFF8A8A8A);
  static const success = Color(0xFF2ED573); // PRs
  static const warning = Color(0xFFFFA502);
  static const divider = Color(0xFF2A2A2A);

  // ── Light Mode ─────────────────────────────────────────────────────
  static const backgroundLight = Color(0xFFF5F5F0);
  static const surfaceLight = Color(0xFFFFFFFF);
  static const surfaceVariantLight = Color(0xFFF0F0EB);
  static const primaryAccentLight = Color(0xFF2D7A00); // dark green on light
  static const textPrimaryLight = Color(0xFF15150F);
  static const textSecondaryLight = Color(0xFF6A6A66);
  static const dividerLight = Color(0xFFD9D9D2);

  /// Accent swatches offered in Settings (CLAUDE.md §13). First is the default.
  static const presetAccents = <Color>[
    primaryAccent, // lime
    Color(0xFFFF4757), // red
    Color(0xFF00D2FF), // cyan
    Color(0xFFB388FF), // violet
    Color(0xFFFFA502), // orange
    Color(0xFF2ED573), // green
  ];

  /// Parses `'#E8FF47'` / `'E8FF47'` / `'#AARRGGBB'` into a [Color].
  static Color fromHex(String hex) {
    var h = hex.replaceFirst('#', '').trim();
    if (h.length == 6) h = 'FF$h';
    return Color(int.parse(h, radix: 16));
  }

  /// `'#RRGGBB'` for persistence (drops alpha).
  static String toHex(Color color) {
    final rgb = color.toARGB32() & 0x00FFFFFF;
    return '#${rgb.toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }
}
