/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/repositories/history_repository.dart
///
/// Workout history repository.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage workout history persistence.
/// • Store completed workout sessions.
/// • Retrieve workout history.
/// • Filter history by date and category.
/// • Delete workout history.
/// • Keep persistence logic separate from providers.
/// • Prepare for future REST API integration.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • HistoryProvider
/// • History Screen
/// • Progress Screen
/// • Dashboard
/// • Future Cloud Synchronization
/// ============================================================================
library;

import 'package:hive/hive.dart';

import '../models/workout.dart';
import '../services/hive_service.dart';
import '../storage/hive_boxes.dart';

/// Repository responsible for workout history persistence.
///
/// History is stored locally using Hive.
///
/// Future versions can synchronize history with Firebase
/// or a REST API without changing the Provider layer.
final class HistoryRepository {
  /// Creates a [HistoryRepository].
  const HistoryRepository();

  /// History Hive box.
  Box<dynamic> get _box =>
      HiveService.box<dynamic>(HiveBoxes.history);

  // ===========================================================================
  // Create
  // ===========================================================================

  /// Adds a workout to history.
  Future<void> addWorkout(
    Workout workout,
  ) async {
    await _box.put(
      workout.id,
      workout.toJson(),
    );
  }

  /// Adds multiple workouts to history.
  Future<void> addWorkouts(
    List<Workout> workouts,
  ) async {
    for (final workout in workouts) {
      await addWorkout(workout);
    }
  }

  // ===========================================================================
  // Read
  // ===========================================================================

  /// Returns a workout from history.
  Future<Workout?> getWorkout(
    String id,
  ) async {
    final dynamic data = _box.get(id);

    if (data == null) {
      return null;
    }

    if (data is Map) {
      return Workout.fromJson(
        Map<String, dynamic>.from(data),
      );
    }

    return null;
  }

  /// Returns all workout history.
  Future<List<Workout>> getHistory() async {
    return _box.values
        .whereType<Map>()
        .map(
          (dynamic json) => Workout.fromJson(
            Map<String, dynamic>.from(json as Map),
          ),
        )
        .toList();
  }

  /// Returns workout history sorted by newest first.
  Future<List<Workout>> getHistorySorted() async {
    final history = await getHistory();

    history.sort(
      (a, b) => b.date.compareTo(a.date),
    );

    return history;
  }

  /// Returns workout history for a category.
  Future<List<Workout>> getHistoryByCategory(
    String category,
  ) async {
    final history = await getHistory();

    return history
        .where(
          (workout) =>
              workout.category.toLowerCase() ==
              category.toLowerCase(),
        )
        .toList();
  }

  /// Returns workout history for a specific date.
  Future<List<Workout>> getHistoryByDate(
    DateTime date,
  ) async {
    final history = await getHistory();

    return history.where((workout) {
      final workoutDate = workout.date;

      return workoutDate.year == date.year &&
          workoutDate.month == date.month &&
          workoutDate.day == date.day;
    }).toList();
  }

  /// Returns workout history between two dates.
  Future<List<Workout>> getHistoryBetween(
    DateTime start,
    DateTime end,
  ) async {
    final history = await getHistory();

    return history.where((workout) {
      return !workout.date.isBefore(start) &&
          !workout.date.isAfter(end);
    }).toList();
  }

  // ===========================================================================
  // Delete
  // ===========================================================================

  /// Removes a workout from history.
  Future<void> deleteWorkout(
    String id,
  ) async {
    await _box.delete(id);
  }

  /// Removes every stored workout history entry.
  Future<void> clearHistory() async {
    await _box.clear();
  }

  // ===========================================================================
  // Utility
  // ===========================================================================

  /// Returns whether a workout exists in history.
  Future<bool> exists(
    String id,
  ) async {
    return _box.containsKey(id);
  }

  /// Returns the total number of history records.
  Future<int> historyCount() async {
    return _box.length;
  }

  /// Returns the total calories burned.
  Future<int> totalCaloriesBurned() async {
    final history = await getHistory();

    return history.fold<int>(
      0,
      (int sum, workout) =>
          sum + (workout.caloriesBurned as int),
    );
  }

  /// Returns the total workout duration.
  Future<int> totalWorkoutDuration() async {
    final history = await getHistory();

    return history.fold<int>(
      0,
      (int sum, workout) =>
          sum + (workout.duration as int),
    );
  }

  /// Returns the total distance covered.
  Future<double> totalDistanceCovered() async {
    final history = await getHistory();

    return history.fold<double>(
      0.0,
      (double sum, workout) =>
          sum + (workout.distance as double),
    );
  }

  /// Returns the total steps completed.
  Future<int> totalSteps() async {
    final history = await getHistory();

    return history.fold<int>(
      0,
      (int sum, workout) =>
          sum + (workout.steps as int),
    );
  }

  /// Returns the most recently completed workout.
  Future<Workout?> latestWorkout() async {
    final history = await getHistorySorted();

    if (history.isEmpty) {
      return null;
    }

    return history.first;
  }
}