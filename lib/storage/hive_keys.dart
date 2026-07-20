/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/storage/hive_keys.dart
///
/// Centralized Hive field keys used throughout the application.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Define reusable field keys for Hive objects.
/// • Eliminate hardcoded string literals.
/// • Improve consistency across repositories and services.
/// • Simplify future model migrations and serialization.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • HiveService
/// • AuthRepository
/// • UserRepository
/// • WorkoutRepository
/// • StatisticsRepository
/// • HistoryRepository
/// • SettingsRepository
/// • Future Hive models
/// ============================================================================
final class HiveKeys {
  /// Prevent instantiation.
  const HiveKeys._();

  // ===========================================================================
  // Common
  // ===========================================================================

  static const String id = 'id';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';

  // ===========================================================================
  // Authentication
  // ===========================================================================

  static const String isLoggedIn = 'isLoggedIn';
  static const String authToken = 'authToken';
  static const String refreshToken = 'refreshToken';
  static const String lastLogin = 'lastLogin';

  // ===========================================================================
  // User
  // ===========================================================================

  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String email = 'email';
  static const String profileImage = 'profileImage';
  static const String age = 'age';
  static const String gender = 'gender';
  static const String height = 'height';
  static const String weight = 'weight';
  static const String goal = 'goal';
  static const String dailyStepGoal = 'dailyStepGoal';
  static const String dailyCalorieGoal = 'dailyCalorieGoal';
  static const String totalWorkouts = 'totalWorkouts';
  static const String completedGoals = 'completedGoals';
  static const String joinedDate = 'joinedDate';

  // ===========================================================================
  // Workout
  // ===========================================================================

  static const String title = 'title';
  static const String category = 'category';
  static const String description = 'description';
  static const String image = 'image';
  static const String duration = 'duration';
  static const String caloriesBurned = 'caloriesBurned';
  static const String distance = 'distance';
  static const String steps = 'steps';
  static const String averageHeartRate = 'averageHeartRate';
  static const String completed = 'completed';
  static const String workoutDate = 'workoutDate';

  // ===========================================================================
  // Statistics
  // ===========================================================================

  static const String value = 'value';
  static const String unit = 'unit';
  static const String icon = 'icon';
  static const String progress = 'progress';
  static const String current = 'current';
  static const String target = 'target';

  // ===========================================================================
  // Activity
  // ===========================================================================

  static const String activityType = 'activityType';
  static const String activityTitle = 'activityTitle';
  static const String activityDescription = 'activityDescription';
  static const String activityDate = 'activityDate';

  // ===========================================================================
  // Settings
  // ===========================================================================

  static const String themeMode = 'themeMode';
  static const String language = 'language';
  static const String notificationsEnabled = 'notificationsEnabled';
  static const String reminderEnabled = 'reminderEnabled';
  static const String reminderTime = 'reminderTime';
  static const String onboardingCompleted = 'onboardingCompleted';
}