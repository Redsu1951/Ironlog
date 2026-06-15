import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'display_service.g.dart';

/// Controls the display refresh-rate cap (CLAUDE.md §13 Performance setting).
/// Backed by flutter_displaymode; a no-op on devices/platforms without
/// switchable modes (e.g. iOS, emulators).
class DisplayService {
  /// Selects the supported mode whose refresh rate best fits [fps]
  /// (60/90/120/144): the highest mode at or below the cap, else the closest.
  Future<void> setFrameRate(int fps) async {
    try {
      final modes = (await FlutterDisplayMode.supported)
          .where((m) => m.refreshRate > 0)
          .toList();
      if (modes.isEmpty) return;

      DisplayMode? best;
      for (final m in modes) {
        if (m.refreshRate <= fps + 0.5) {
          if (best == null || m.refreshRate > best.refreshRate) best = m;
        }
      }
      best ??= modes.reduce((a, b) =>
          (a.refreshRate - fps).abs() < (b.refreshRate - fps).abs() ? a : b);

      await FlutterDisplayMode.setPreferredMode(best);
    } catch (_) {
      // Mode switching unsupported here — leave the system default.
    }
  }

  /// Distinct refresh rates the panel advertises (for the Settings selector).
  Future<List<int>> supportedRefreshRates() async {
    try {
      final rates = (await FlutterDisplayMode.supported)
          .where((m) => m.refreshRate > 0)
          .map((m) => m.refreshRate.round())
          .toSet()
          .toList()
        ..sort();
      return rates;
    } catch (_) {
      return const [];
    }
  }
}

@Riverpod(keepAlive: true)
DisplayService displayService(Ref ref) => DisplayService();
