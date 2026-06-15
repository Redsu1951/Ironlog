import 'package:flutter/painting.dart';

/// Typographic roles (CLAUDE.md §10). Styles are color-agnostic — color is
/// applied by the active [ThemeData] so they read correctly in light and dark.
///
/// Families: PixelifySans (pixel headers), Inter (body), InterMono = Space Mono
/// (monospaced stats; only 400/700 are bundled, so emphasized numbers resolve to
/// the nearest available weight).
abstract final class AppTypography {
  static const pixel = 'PixelifySans';
  static const inter = 'Inter';
  static const mono = 'InterMono';

  // Screen titles / headers — PixelifySans Bold 24–32.
  static const headerLarge = TextStyle(
      fontFamily: pixel, fontWeight: FontWeight.w700, fontSize: 32, letterSpacing: 1);
  static const screenTitle = TextStyle(
      fontFamily: pixel, fontWeight: FontWeight.w700, fontSize: 26, letterSpacing: 1);

  // Section labels / button text — PixelifySans Regular 14–16.
  static const sectionLabel = TextStyle(
      fontFamily: pixel, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.5);
  static const button = TextStyle(
      fontFamily: pixel, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.5);

  // Body text / descriptions — Inter 14–16.
  static const body = TextStyle(
      fontFamily: inter, fontWeight: FontWeight.w400, fontSize: 15, height: 1.4);
  static const bodyMedium = TextStyle(
      fontFamily: inter, fontWeight: FontWeight.w500, fontSize: 15, height: 1.4);
  static const bodySemiBold = TextStyle(
      fontFamily: inter, fontWeight: FontWeight.w600, fontSize: 15, height: 1.4);

  // Weight / reps / volume numbers — InterMono SemiBold 18–28.
  static const stat = TextStyle(
      fontFamily: mono, fontWeight: FontWeight.w700, fontSize: 22);
  static const statLarge = TextStyle(
      fontFamily: mono, fontWeight: FontWeight.w700, fontSize: 28);
  static const statSmall = TextStyle(
      fontFamily: mono, fontWeight: FontWeight.w400, fontSize: 18);

  // Small labels / timestamps — Inter 12.
  static const caption = TextStyle(
      fontFamily: inter, fontWeight: FontWeight.w400, fontSize: 12);

  // AI insight text — Inter italic 15.
  static const aiInsight = TextStyle(
      fontFamily: inter,
      fontWeight: FontWeight.w400,
      fontSize: 15,
      fontStyle: FontStyle.italic,
      height: 1.45);
}
