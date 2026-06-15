// Smoke test: the app builds with the themed shell and shows the IronLog
// wordmark. Replaced with feature tests as screens land in later phases.
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ironlog/app.dart';
import 'package:ironlog/core/utils/preferences_provider.dart';

void main() {
  testWidgets('IronLogApp builds and renders the wordmark', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
        child: const IronLogApp(),
      ),
    );

    expect(find.text('IRONLOG'), findsOneWidget);
  });
}
