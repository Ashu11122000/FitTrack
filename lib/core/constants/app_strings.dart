/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/constants/app_strings.dart
///
/// Centralized application strings.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Store reusable text.
/// • Avoid hardcoded strings.
/// • Simplify localization in the future.
/// ============================================================================

class AppStrings {
  AppStrings._();

  // ===========================================================================
  // Application
  // ===========================================================================

  static const String appName = 'FitTrack';

  static const String appTagline =
      'Track Your Fitness Journey';

  // ===========================================================================
  // Splash
  // ===========================================================================

  static const String splashTitle =
      'Welcome to FitTrack';

  // ===========================================================================
  // Onboarding
  // ===========================================================================

  static const String onboardingTitle1 =
      'Track Every Workout';

  static const String onboardingSubtitle1 =
      'Monitor your workouts and daily activities effortlessly.';

  static const String onboardingTitle2 =
      'Stay Healthy';

  static const String onboardingSubtitle2 =
      'Keep an eye on calories, heart rate, and progress.';

  static const String onboardingTitle3 =
      'Achieve Your Goals';

  static const String onboardingSubtitle3 =
      'Stay motivated and reach your fitness milestones.';

  // ===========================================================================
  // Authentication
  // ===========================================================================

  static const String login = 'Login';

  static const String email = 'Email';

  static const String password = 'Password';

  static const String forgotPassword =
      'Forgot Password?';

  static const String rememberMe =
      'Remember Me';

  static const String signIn =
      'Sign In';

  static const String signOut =
      'Sign Out';

  // ===========================================================================
  // Home
  // ===========================================================================

  static const String home = 'Home';

  static const String dashboard = 'Dashboard';

  static const String workouts = 'Workouts';

  static const String progress = 'Progress';

  static const String history = 'History';

  static const String profile = 'Profile';

  static const String settings = 'Settings';

  // ===========================================================================
  // Workout
  // ===========================================================================

  static const String startWorkout =
      'Start Workout';

  static const String endWorkout =
      'End Workout';

  static const String calories =
      'Calories';

  static const String duration =
      'Duration';

  static const String steps =
      'Steps';

  static const String distance =
      'Distance';

  static const String heartRate =
      'Heart Rate';

  // ===========================================================================
  // Buttons
  // ===========================================================================

  static const String save = 'Save';

  static const String cancel = 'Cancel';

  static const String continueText = 'Continue';

  static const String next = 'Next';

  static const String back = 'Back';

  static const String done = 'Done';

  static const String retry = 'Retry';

  // ===========================================================================
  // Messages
  // ===========================================================================

  static const String loading =
      'Loading...';

  static const String noData =
      'No Data Available';

  static const String noInternet =
      'No Internet Connection';

  static const String somethingWentWrong =
      'Something went wrong';

  static const String success =
      'Success';

  static const String error =
      'Error';

  // ===========================================================================
  // Validation
  // ===========================================================================

  static const String enterEmail =
      'Please enter your email';

  static const String enterPassword =
      'Please enter your password';

  static const String invalidEmail =
      'Please enter a valid email';

  static const String passwordTooShort =
      'Password must be at least 6 characters';
}