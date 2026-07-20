import 'package:fittrack/models/workout.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login_screen.dart';
import '../../features/history/history_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/progress/progress_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/workout/workout_details_screen.dart';
import 'route_names.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/routes/app_routes.dart
///
/// Centralized application routing.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Generate application routes.
/// • Handle named navigation.
/// • Handle unknown routes.
/// • Keep routing logic in one place.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • MaterialApp
/// • NavigationService
/// ============================================================================

class AppRoutes {
  AppRoutes._();

  // ===========================================================================
  // Route Generator
  // ===========================================================================

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // -----------------------------------------------------------------------
      // Splash
      // -----------------------------------------------------------------------

      case RouteNames.initial:
      case RouteNames.splash:
        return _materialRoute(
          const SplashScreen(),
          settings,
        );

      // -----------------------------------------------------------------------
      // Onboarding
      // -----------------------------------------------------------------------

      case RouteNames.onboarding:
        return _materialRoute(
          const OnboardingScreen(),
          settings,
        );

      // -----------------------------------------------------------------------
      // Authentication
      // -----------------------------------------------------------------------

      case RouteNames.login:
        return _materialRoute(
          const LoginScreen(),
          settings,
        );

      // -----------------------------------------------------------------------
      // Home
      // -----------------------------------------------------------------------

      case RouteNames.home:
        return _materialRoute(
          const HomeScreen(),
          settings,
        );

      // -----------------------------------------------------------------------
      // Workout
      // -----------------------------------------------------------------------

      case RouteNames.workoutDetails:
        return _materialRoute(
          WorkoutDetailsScreen(workout: settings.arguments as Workout),
          settings,
        );

      // -----------------------------------------------------------------------
      // History
      // -----------------------------------------------------------------------

      case RouteNames.history:
        return _materialRoute(
          const HistoryScreen(),
          settings,
        );

      // -----------------------------------------------------------------------
      // Progress
      // -----------------------------------------------------------------------

      case RouteNames.progress:
        return _materialRoute(
          const ProgressScreen(),
          settings,
        );

      // -----------------------------------------------------------------------
      // Profile
      // -----------------------------------------------------------------------

      case RouteNames.profile:
        return _materialRoute(
          const ProfileScreen(),
          settings,
        );

      // -----------------------------------------------------------------------
      // Settings
      // -----------------------------------------------------------------------

      case RouteNames.settings:
        return _materialRoute(
          const SettingsScreen(),
          settings,
        );

      // -----------------------------------------------------------------------
      // Unknown Route
      // -----------------------------------------------------------------------

      default:
        return _unknownRoute(settings);
    }
  }

  // ===========================================================================
  // Material Page Route
  // ===========================================================================

  static MaterialPageRoute<dynamic> _materialRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => page,
      settings: settings,
    );
  }

  // ===========================================================================
  // Unknown Route
  // ===========================================================================

  static MaterialPageRoute<dynamic> _unknownRoute(
    RouteSettings settings,
  ) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
        ),
        body: const Center(
          child: Text(
            '404\nPage Not Found',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}