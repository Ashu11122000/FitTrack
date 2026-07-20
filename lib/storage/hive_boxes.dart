/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/storage/hive_boxes.dart
///
/// Centralized Hive box names used throughout the application.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Define all Hive box names in a single location.
/// • Prevent hardcoded string literals.
/// • Improve maintainability and consistency.
/// • Prepare the project for offline-first persistence.
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
/// • Future Hive adapters
/// ============================================================================
final class HiveBoxes {
  /// Prevent instantiation.
  const HiveBoxes._();

  // ===========================================================================
  // Core Boxes
  // ===========================================================================

  /// Stores authenticated user information.
  static const String user = 'user';

  /// Stores workout records.
  static const String workouts = 'workouts';

  /// Stores dashboard statistics.
  static const String statistics = 'statistics';

  /// Stores workout history.
  static const String history = 'history';

  /// Stores fitness activities and timeline.
  static const String activities = 'activities';

  /// Stores application settings.
  static const String settings = 'settings';

  /// Stores authentication/session data.
  static const String auth = 'auth';

  // ===========================================================================
  // Future Boxes
  // ===========================================================================

  /// Stores cached API responses for offline access.
  static const String cache = 'cache';

  /// Stores pending synchronization operations.
  static const String syncQueue = 'sync_queue';

  /// Stores notification history.
  static const String notifications = 'notifications';
}