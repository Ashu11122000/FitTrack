/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/services/hive_service.dart
///
/// Centralized Hive database service.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Initialize Hive.
/// • Register Hive adapters.
/// • Open required Hive boxes.
/// • Provide helper methods for accessing boxes.
/// • Close Hive gracefully.
/// • Keep Hive-related logic out of repositories.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • main.dart
/// • AuthRepository
/// • UserRepository
/// • WorkoutRepository
/// • StatisticsRepository
/// • HistoryRepository
/// • SettingsRepository
/// ============================================================================
library;

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../storage/hive_boxes.dart';

/// A centralized service responsible for configuring and managing
/// the application's Hive database.
///
/// This service should be initialized once during application startup
/// before any repositories or providers access local storage.
final class HiveService {
  HiveService._();

  /// Indicates whether Hive has already been initialized.
  static bool _initialized = false;

  /// Initializes Hive and opens all required boxes.
  ///
  /// Safe to call multiple times.
  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      await Hive.initFlutter();

      await _registerAdapters();

      await _openBoxes();

      _initialized = true;

      debugPrint('[Hive] Initialization completed.');
    } catch (error, stackTrace) {
      debugPrint('[Hive] Initialization failed.');
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());

      rethrow;
    }
  }

  /// Registers Hive adapters.
  ///
  /// Currently empty because Phase 9 begins before Hive model adapters
  /// are introduced. Future phases should register adapters here.
  static Future<void> _registerAdapters() async {
    // Example:
    //
    // if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    //   Hive.registerAdapter(UserAdapter());
    // }
  }

  /// List of all application Hive box names.
  static const List<String> _boxNames = [
    HiveBoxes.auth,
    HiveBoxes.user,
    HiveBoxes.workouts,
    HiveBoxes.statistics,
    HiveBoxes.history,
    HiveBoxes.activities,
    HiveBoxes.settings,
    HiveBoxes.cache,
    HiveBoxes.syncQueue,
    HiveBoxes.notifications,
  ];

  /// Opens every application Hive box.
  static Future<void> _openBoxes() async {
    await Future.wait([
      Hive.openBox<dynamic>(HiveBoxes.auth),
      Hive.openBox<dynamic>(HiveBoxes.user),
      Hive.openBox<dynamic>(HiveBoxes.workouts),
      Hive.openBox<dynamic>(HiveBoxes.statistics),
      Hive.openBox<dynamic>(HiveBoxes.history),
      Hive.openBox<dynamic>(HiveBoxes.activities),
      Hive.openBox<dynamic>(HiveBoxes.settings),
      Hive.openBox<dynamic>(HiveBoxes.cache),
      Hive.openBox<dynamic>(HiveBoxes.syncQueue),
      Hive.openBox<dynamic>(HiveBoxes.notifications),
    ]);
  }

  /// Returns an opened Hive box.
  ///
  /// Throws a [StateError] if the box has not been opened.
  static Box<T> box<T>(String name) {
    if (!Hive.isBoxOpen(name)) {
      throw StateError(
        'Hive box "$name" has not been opened. '
        'Call HiveService.initialize() first.',
      );
    }

    return Hive.box<T>(name);
  }

  /// Returns whether a box is currently open.
  static bool isBoxOpen(String name) => Hive.isBoxOpen(name);

  /// Opens a box if it has not already been opened.
  static Future<Box<T>> openBox<T>(String name) async {
    if (Hive.isBoxOpen(name)) {
      return Hive.box<T>(name);
    }

    return Hive.openBox<T>(name);
  }

  /// Closes a specific Hive box.
  static Future<void> closeBox(String name) async {
    if (Hive.isBoxOpen(name)) {
      await Hive.box(name).close();
    }
  }

  /// Closes every opened Hive box.
  static Future<void> closeAll() async {
    await Hive.close();

    _initialized = false;

    debugPrint('[Hive] All boxes closed.');
  }

  /// Deletes all local application data.
  ///
  /// Intended for logout, account reset,
  /// or development/testing purposes.
  static Future<void> clearAll() async {
    for (final boxName in _boxNames) {
      if (Hive.isBoxOpen(boxName)) {
        await Hive.box(boxName).clear();
      }
    }

    debugPrint('[Hive] All boxes cleared.');
  }

  /// Returns whether Hive has already been initialized.
  static bool get isInitialized => _initialized;
}