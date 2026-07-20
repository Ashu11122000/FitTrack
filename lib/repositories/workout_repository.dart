/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/repositories/workout_repository.dart
///
/// Workout repository.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage workout persistence.
/// • Store completed workouts.
/// • Retrieve workout history.
/// • Update workout information.
/// • Delete workouts.
/// • Keep persistence logic separate from providers.
/// • Prepare for future REST API integration.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • WorkoutProvider
/// • Home Screen
/// • Workout Details Screen
/// • History Screen
/// • Future Cloud Synchronization
/// ============================================================================
library;

import 'package:hive/hive.dart';

import '../models/workout.dart';
import '../services/hive_service.dart';
import '../storage/hive_boxes.dart';

/// Repository responsible for workout persistence.
///
/// Currently stores workouts locally using Hive.
///
/// In future phases this repository can synchronize with
/// Firebase or a REST API without affecting the Provider layer.
final class WorkoutRepository {
  /// Creates a [WorkoutRepository].
  const WorkoutRepository();

  /// Workout Hive box.
  Box<dynamic> get _box => HiveService.box<dynamic>(HiveBoxes.workouts);

  // ===========================================================================
  // Create
  // ===========================================================================

  /// Saves a workout.
  Future<void> saveWorkout(Workout workout) async {
    await _box.put(
      workout.id,
      workout.toJson(),
    );
  }

  /// Saves multiple workouts.
  Future<void> saveWorkouts(
    List<Workout> workouts,
  ) async {
    for (final workout in workouts) {
      await saveWorkout(workout);
    }
  }

  // ===========================================================================
  // Read
  // ===========================================================================

  /// Returns a workout by its identifier.
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

  /// Returns all workouts.
  Future<List<Workout>> getAllWorkouts() async {
    return _box.values
        .whereType<Map>()
        .map(
          (dynamic json) => Workout.fromJson(
            Map<String, dynamic>.from(json as Map),
          ),
        )
        .toList();
  }

  /// Returns completed workouts.
  Future<List<Workout>> getCompletedWorkouts() async {
    final workouts = await getAllWorkouts();

    return workouts
        .where(
          (workout) => workout.completed,
        )
        .toList();
  }

  /// Returns pending workouts.
  Future<List<Workout>> getPendingWorkouts() async {
    final workouts = await getAllWorkouts();

    return workouts
        .where(
          (workout) => !workout.completed,
        )
        .toList();
  }

  /// Returns workouts belonging to a category.
  Future<List<Workout>> getWorkoutsByCategory(
    String category,
  ) async {
    final workouts = await getAllWorkouts();

    return workouts
        .where(
          (workout) =>
              workout.category.toLowerCase() ==
              category.toLowerCase(),
        )
        .toList();
  }

  /// Returns workouts performed on a specific date.
  Future<List<Workout>> getWorkoutsByDate(
    DateTime date,
  ) async {
    final workouts = await getAllWorkouts();

    return workouts.where((workout) {
      final workoutDate = workout.date;

      return workoutDate.year == date.year &&
          workoutDate.month == date.month &&
          workoutDate.day == date.day;
    }).toList();
  }

  // ===========================================================================
  // Update
  // ===========================================================================

  /// Updates an existing workout.
  Future<void> updateWorkout(
    Workout workout,
  ) async {
    await saveWorkout(workout);
  }

  /// Marks a workout as completed.
  Future<void> markWorkoutCompleted(
    String id,
  ) async {
    final workout = await getWorkout(id);

    if (workout == null) {
      return;
    }

    await updateWorkout(
      workout.copyWith(
        completed: true,
      ),
    );
  }

  // ===========================================================================
  // Delete
  // ===========================================================================

  /// Deletes a workout.
  Future<void> deleteWorkout(
    String id,
  ) async {
    await _box.delete(id);
  }

  /// Removes every stored workout.
  Future<void> clearWorkouts() async {
    await _box.clear();
  }

  // ===========================================================================
  // Utility
  // ===========================================================================

  /// Returns whether a workout exists.
  Future<bool> exists(
    String id,
  ) async {
    return _box.containsKey(id);
  }

  /// Returns the total number of workouts.
  Future<int> workoutCount() async {
    return _box.length;
  }

  /// Returns the number of completed workouts.
  Future<int> completedWorkoutCount() async {
    final workouts = await getCompletedWorkouts();

    return workouts.length;
  }

  /// Returns the number of pending workouts.
  Future<int> pendingWorkoutCount() async {
    final workouts = await getPendingWorkouts();

    return workouts.length;
  }

  /// Returns total calories burned.
  Future<int> totalCaloriesBurned() async {
    final workouts = await getCompletedWorkouts();

    return workouts.fold<int>(
      0,
      (sum, workout) => sum + (workout.caloriesBurned as int),
    );
  }

  /// Returns total distance covered.
  Future<double> totalDistanceCovered() async {
    final workouts = await getCompletedWorkouts();

    return workouts.fold<double>(
      0.0,
      (sum, workout) => sum + workout.distance,
    );
  }

  /// Returns total steps completed.
  Future<int> totalSteps() async {
    final workouts = await getCompletedWorkouts();

    return workouts.fold<int>(
      0,
      (sum, workout) => sum + (workout.steps as int),
    );
  }

  /// Returns total workout duration in minutes.
  Future<int> totalWorkoutDuration() async {
    final workouts = await getCompletedWorkouts();

    return workouts.fold<int>(
      0,
      (sum, workout) => sum + (workout.duration as int),
    );
  }
}