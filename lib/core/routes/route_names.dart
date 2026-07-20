/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/routes/route_names.dart
///
/// Centralized application route names.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Define all named routes.
/// • Avoid hardcoded route strings.
/// • Improve maintainability.
/// • Provide a single source of truth for navigation.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • AppRoutes
/// • NavigationService
/// • MaterialApp
/// • All application screens
/// ============================================================================

class RouteNames {
  RouteNames._();

  // ===========================================================================
  // Initial Routes
  // ===========================================================================

  /// Initial route
  static const String initial = '/';

  /// Splash Screen
  static const String splash = '/';

  /// Onboarding Screen
  static const String onboarding = '/onboarding';

  // ===========================================================================
  // Authentication
  // ===========================================================================

  /// Login Screen
  static const String login = '/login';

  // ===========================================================================
  // Main Navigation
  // ===========================================================================

  /// Home Dashboard
  static const String home = '/home';

  /// Workout Details
  static const String workoutDetails = '/workout-details';

  /// Activity History
  static const String history = '/history';

  /// Progress Screen
  static const String progress = '/progress';

  /// Profile Screen
  static const String profile = '/profile';

  /// Settings Screen
  static const String settings = '/settings';

  // ===========================================================================
  // Future Routes
  // ===========================================================================

  /// Edit Profile
  static const String editProfile = '/profile/edit';

  /// Workout Statistics
  static const String statistics = '/statistics';

  /// Notifications
  static const String notifications = '/notifications';

  /// About Application
  static const String about = '/about';

  /// Help & Support
  static const String help = '/help';

  // ===========================================================================
  // Error Routes
  // ===========================================================================

  /// Unknown Route
  static const String notFound = '/404';
}