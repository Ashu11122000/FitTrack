/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/constants/app_duration.dart
///
/// Centralized animation durations used throughout the application.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Store reusable animation durations.
/// • Maintain consistent animation timings.
/// • Avoid hardcoded Duration values.
/// • Follow Material Design 3 motion guidelines.
/// ============================================================================

class AppDuration {
  AppDuration._();

  // ===========================================================================
  // Basic Animation Durations
  // ===========================================================================

  static const Duration instant = Duration(milliseconds: 0);
  static const Duration extraFast = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 400);
  static const Duration slow = Duration(milliseconds: 600);
  static const Duration extraSlow = Duration(milliseconds: 800);

  // ===========================================================================
  // Page Navigation
  // ===========================================================================

  static const Duration pageTransition = Duration(milliseconds: 300);
  static const Duration routeTransition = Duration(milliseconds: 350);

  // ===========================================================================
  // Splash Screen
  // ===========================================================================

  static const Duration splashDelay = Duration(seconds: 2);
  static const Duration splashAnimation = Duration(milliseconds: 1200);

  // ===========================================================================
  // Onboarding
  // ===========================================================================

  static const Duration onboardingAnimation =
      Duration(milliseconds: 500);

  static const Duration pageIndicator =
      Duration(milliseconds: 300);

  // ===========================================================================
  // Buttons
  // ===========================================================================

  static const Duration buttonPress =
      Duration(milliseconds: 150);

  static const Duration buttonLoading =
      Duration(milliseconds: 250);

  // ===========================================================================
  // Cards
  // ===========================================================================

  static const Duration cardAnimation =
      Duration(milliseconds: 300);

  static const Duration cardHover =
      Duration(milliseconds: 200);

  // ===========================================================================
  // Dialogs & Bottom Sheets
  // ===========================================================================

  static const Duration dialog =
      Duration(milliseconds: 250);

  static const Duration bottomSheet =
      Duration(milliseconds: 350);

  // ===========================================================================
  // Input Fields
  // ===========================================================================

  static const Duration inputFocus =
      Duration(milliseconds: 200);

  static const Duration cursorBlink =
      Duration(milliseconds: 500);

  // ===========================================================================
  // Progress Indicators
  // ===========================================================================

  static const Duration progress =
      Duration(milliseconds: 800);

  static const Duration circularProgress =
      Duration(milliseconds: 1200);

  // ===========================================================================
  // SnackBars
  // ===========================================================================

  static const Duration snackBar =
      Duration(seconds: 3);

  // ===========================================================================
  // Tooltips
  // ===========================================================================

  static const Duration tooltipWait =
      Duration(milliseconds: 500);

  static const Duration tooltipShow =
      Duration(milliseconds: 150);

  // ===========================================================================
  // Hero Animations
  // ===========================================================================

  static const Duration hero =
      Duration(milliseconds: 500);

  // ===========================================================================
  // Lottie Animations
  // ===========================================================================

  static const Duration lottie =
      Duration(milliseconds: 1500);

  // ===========================================================================
  // Workout Progress
  // ===========================================================================

  static const Duration workoutProgress =
      Duration(milliseconds: 1000);

  // ===========================================================================
  // Chart Animations
  // ===========================================================================

  static const Duration chart =
      Duration(milliseconds: 800);

  // ===========================================================================
  // Refresh Indicator
  // ===========================================================================

  static const Duration refresh =
      Duration(milliseconds: 1000);
}