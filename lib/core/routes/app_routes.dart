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
/// • Validate route arguments.
/// • Handle unknown routes.
/// • Keep routing logic centralized.
/// • Prepare for future deep linking and route guards.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • MaterialApp
/// • NavigationService
/// ============================================================================
library;

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
import '../../models/workout.dart';
import 'route_names.dart';

/// Centralized route generator.
final class AppRoutes {
  /// Prevent instantiation.
  const AppRoutes._();

  // ===========================================================================
  // Route Generator
  // ===========================================================================

  static Route<dynamic> onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      // Splash

      case RouteNames.initial:
      case RouteNames.splash:
        return _pageRoute(
          const SplashScreen(),
          settings,
        );

      // Onboarding

      case RouteNames.onboarding:
        return _pageRoute(
          const OnboardingScreen(),
          settings,
        );

      // Authentication

      case RouteNames.login:
        return _pageRoute(
          const LoginScreen(),
          settings,
        );

      // Home

      case RouteNames.home:
        return _pageRoute(
          const HomeScreen(),
          settings,
        );

      // Workout Details

      case RouteNames.workoutDetails:
        final args = settings.arguments;

        if (args is! Workout) {
          return _errorRoute(
            settings,
            'Workout information is missing.',
          );
        }

        return _pageRoute(
          WorkoutDetailsScreen(
            workout: args,
          ),
          settings,
        );

      // History

      case RouteNames.history:
        return _pageRoute(
          const HistoryScreen(),
          settings,
        );

      // Progress

      case RouteNames.progress:
        return _pageRoute(
          const ProgressScreen(),
          settings,
        );

      // Profile

      case RouteNames.profile:
        return _pageRoute(
          const ProfileScreen(),
          settings,
        );

      // Settings

      case RouteNames.settings:
        return _pageRoute(
          const SettingsScreen(),
          settings,
        );

      // Unknown Route

      default:
        return _errorRoute(
          settings,
          'The requested page does not exist.',
        );
    }
  }

  // ===========================================================================
  // Helpers
  // ===========================================================================

  static MaterialPageRoute<dynamic> _pageRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => page,
      settings: settings,
    );
  }

  static MaterialPageRoute<dynamic> _errorRoute(
    RouteSettings settings,
    String message,
  ) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (_) => _RouteErrorScreen(
        message: message,
      ),
    );
  }
}

/// Error page displayed for invalid or unknown routes.
final class _RouteErrorScreen extends StatelessWidget {
  const _RouteErrorScreen({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Navigation Error',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 72,
              ),
              const SizedBox(height: 24),
              const Text(
                'Oops!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteNames.home,
                    (_) => false,
                  );
                },
                icon: const Icon(
                  Icons.home_rounded,
                ),
                label: const Text(
                  'Go to Home',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}