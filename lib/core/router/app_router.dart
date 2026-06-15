import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/utils/preferences_provider.dart';
import '../../presentation/screens/analytics/analytics_screen.dart';
import '../../presentation/screens/history/workout_history_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/onboarding/auth_screen.dart';
import '../../presentation/screens/onboarding/goal_setup_screen.dart';
import '../../presentation/screens/onboarding/model_download_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/onboarding/profile_setup_screen.dart';
import '../../presentation/screens/planner/split_builder_screen.dart';
import '../../presentation/screens/planner/weekly_planner_screen.dart';
import '../../presentation/screens/profile/profile_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/workout/active_workout_screen.dart';
import '../../presentation/screens/workout/exercise_picker_screen.dart';
import '../../presentation/screens/workout/plate_calculator_screen.dart';

part 'app_router.g.dart';

/// Auth guard: unauthenticated users accessing protected routes are sent to
/// /onboarding. SplashScreen itself drives the initial redirect after checking
/// SharedPreferences. See CLAUDE.md §11.
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final prefs = ref.read(sharedPreferencesProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isLoggedIn = prefs.getString('user_id') != null;
      final loc = state.matchedLocation;
      // Splash and all onboarding sub-routes are always accessible.
      if (loc == '/splash' || loc.startsWith('/onboarding')) return null;
      if (!isLoggedIn) return '/onboarding';
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (_, __) => const SplashScreen(),
      ),

      // ── Onboarding funnel ───────────────────────────────────────────────
      GoRoute(
        path: '/onboarding',
        builder: (_, __) => const OnboardingScreen(),
        routes: [
          GoRoute(
              path: 'profile',
              builder: (_, __) => const ProfileSetupScreen()),
          GoRoute(
              path: 'goals',
              builder: (_, __) => const GoalSetupScreen()),
          GoRoute(
              path: 'auth',
              builder: (_, __) => const AuthScreen()),
          GoRoute(
              path: 'model-download',
              builder: (_, __) => const ModelDownloadScreen()),
        ],
      ),

      // ── Fullscreen workout routes (no bottom nav) ───────────────────────
      GoRoute(
        path: '/workout/active',
        builder: (_, __) => const ActiveWorkoutScreen(),
      ),
      GoRoute(
        path: '/workout/exercise-picker',
        builder: (_, __) => const ExercisePickerScreen(),
      ),
      GoRoute(
        path: '/workout/plate-calculator',
        builder: (_, __) => const PlateCalculatorScreen(),
      ),

      // Accessible from the Planner tab but outside the ShellRoute shell
      GoRoute(
        path: '/planner/builder',
        builder: (_, __) => const SplitBuilderScreen(),
      ),

      // Profile pushed from Settings / Home avatar
      GoRoute(
        path: '/profile',
        builder: (_, __) => const ProfileScreen(),
      ),

      // ── Bottom-nav shell ────────────────────────────────────────────────
      ShellRoute(
        builder: (context, state, child) =>
            _NavShell(location: state.matchedLocation, child: child),
        routes: [
          GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
          GoRoute(path: '/planner', builder: (_, __) => const WeeklyPlannerScreen()),
          GoRoute(path: '/analytics', builder: (_, __) => const AnalyticsScreen()),
          GoRoute(path: '/history', builder: (_, __) => const WorkoutHistoryScreen()),
          GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
        ],
      ),
    ],
  );
}

// ── Bottom nav shell scaffold ────────────────────────────────────────────────

class _NavShell extends StatelessWidget {
  const _NavShell({required this.location, required this.child});
  final String location;
  final Widget child;

  static const _tabs = [
    _Tab(icon: Icons.home_outlined, selectedIcon: Icons.home, label: 'Home', path: '/home'),
    _Tab(icon: Icons.fitness_center_outlined, selectedIcon: Icons.fitness_center, label: 'Workout', path: '/workout/active'),
    _Tab(icon: Icons.bar_chart_outlined, selectedIcon: Icons.bar_chart, label: 'Analytics', path: '/analytics'),
    _Tab(icon: Icons.history_outlined, selectedIcon: Icons.history, label: 'History', path: '/history'),
    _Tab(icon: Icons.settings_outlined, selectedIcon: Icons.settings, label: 'Settings', path: '/settings'),
  ];

  int get _currentIndex {
    if (location.startsWith('/analytics')) return 2;
    if (location.startsWith('/history')) return 3;
    if (location.startsWith('/settings')) return 4;
    if (location.startsWith('/planner')) return 0; // planner accessible from home area
    return 0; // /home
  }

  void _onTap(BuildContext context, int index) {
    final tab = _tabs[index];
    if (tab.path == '/workout/active') {
      context.push(tab.path);
    } else {
      context.go(tab.path == '/planner' ? '/planner' : tab.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => _onTap(context, i),
        destinations: _tabs
            .map((t) => NavigationDestination(
                  icon: Icon(t.icon),
                  selectedIcon: Icon(t.selectedIcon),
                  label: t.label,
                ))
            .toList(),
      ),
    );
  }
}

class _Tab {
  const _Tab({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.path,
  });
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String path;
}
