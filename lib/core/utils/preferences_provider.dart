import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_provider.g.dart';

/// Synchronous access to [SharedPreferences] for providers that must build
/// without awaiting (e.g. the theme). Overridden in `main()` with a preloaded
/// instance — reading it before that override throws by design.
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(
    'sharedPreferencesProvider must be overridden in main() with '
    'SharedPreferences.getInstance()',
  );
}
