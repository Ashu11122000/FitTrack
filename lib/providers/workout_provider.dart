/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/providers/workout_provider.dart
///
/// Workout provider.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage workout state.
/// • Load and persist workouts.
/// • Manage completed and pending workouts.
/// • Expose workout statistics.
/// • Notify the UI of workout changes.
/// • Keep business logic separate from presentation.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Workout Details Screen
/// • History Screen
/// • WorkoutRepository
/// ============================================================================
library;

import 'package:flutter/foundation.dart';

import '../models/workout.dart';
import '../repositories/workout_repository.dart';

/// Provider responsible for managing workout state.
///
/// This provider communicates with [WorkoutRepository] and exposes
/// workout data to the presentation layer.
///
/// Persistence remains inside the repository while this provider
/// focuses on application state and UI notifications.
final class WorkoutProvider extends ChangeNotifier {
  /// Creates a [WorkoutProvider].
  WorkoutProvider({
    WorkoutRepository? repository,
  }) : _repository = repository ?? const WorkoutRepository();

  final WorkoutRepository _repository;

  List<Workout> _workouts = <Workout>[];
  bool _isLoading = false;

  // ===========================================================================
  // Getters
  // ===========================================================================

  /// Returns every workout.
  List<Workout> get workouts =>
      List.unmodifiable(_workouts);

  /// Returns completed workouts.
  List<Workout> get completedWorkouts =>
      _workouts.where((workout) => workout.completed).toList();

  /// Returns pending workouts.
  List<Workout> get pendingWorkouts =>
      _workouts.where((workout) => !workout.completed).toList();

  /// Returns whether data is currently loading.
  bool get isLoading => _isLoading;

  /// Returns whether any workouts exist.
  bool get hasWorkouts => _workouts.isNotEmpty;

  /// Returns the total number of workouts.
  int get workoutCount => _workouts.length;

  // ===========================================================================
  // Initialization
  // ===========================================================================

  /// Loads workouts from the repository.
  Future<void> initialize() async {
    _setLoading(true);

    try {
      _workouts = await _repository.getAllWorkouts();
    } finally {
      _setLoading(false);

      notifyListeners();
    }
  }

  // ===========================================================================
  // CRUD Operations
  // ===========================================================================

  /// Saves a workout.
  Future<void> saveWorkout(
    Workout workout,
  ) async {
    _setLoading(true);

    try {
      await _repository.saveWorkout(workout);

      _workouts.add(workout);

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Updates an existing workout.
  Future<void> updateWorkout(
    Workout workout,
  ) async {
    _setLoading(true);

    try {
      await _repository.updateWorkout(workout);

      final index = _workouts.indexWhere(
        (item) => item.id == workout.id,
      );

      if (index != -1) {
        _workouts[index] = workout;
      }

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Deletes a workout.
  Future<void> deleteWorkout(
    String id,
  ) async {
    _setLoading(true);

    try {
      await _repository.deleteWorkout(id);

      _workouts.removeWhere(
        (workout) => workout.id == id,
      );

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Marks a workout as completed.
  Future<void> markWorkoutCompleted(
    String id,
  ) async {
    _setLoading(true);

    try {
      await _repository.markWorkoutCompleted(id);

      final index = _workouts.indexWhere(
        (workout) => workout.id == id,
      );

      if (index != -1) {
        _workouts[index] = _workouts[index].copyWith(
          completed: true,
        );
      }

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Reloads workouts from storage.
  Future<void> refresh() async {
    await initialize();
  }

  /// Removes every workout.
  Future<void> clearWorkouts() async {
    _setLoading(true);

    try {
      await _repository.clearWorkouts();

      _workouts.clear();

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // ===========================================================================
  // Search & Filter
  // ===========================================================================

  /// Returns workouts belonging to the specified category.
  List<Workout> workoutsByCategory(
    String category,
  ) {
    return _workouts
        .where(
          (workout) =>
              workout.category.toLowerCase() ==
              category.toLowerCase(),
        )
        .toList();
  }

  /// Returns workouts for a specific date.
  List<Workout> workoutsByDate(
    DateTime date,
  ) {
    return _workouts.where((workout) {
      return workout.date.year == date.year &&
          workout.date.month == date.month &&
          workout.date.day == date.day;
    }).toList();
  }

  // ===========================================================================
  // Dashboard Statistics
  // ===========================================================================

  /// Total calories burned.
  int get totalCaloriesBurned {
    return completedWorkouts.fold(
      0,
      (sum, workout) => sum + workout.caloriesBurned,
    );
  }

  /// Total steps.
  int get totalSteps {
    return completedWorkouts.fold(
      0,
      (sum, workout) => sum + workout.steps,
    );
  }

  /// Total distance.
  double get totalDistance {
    return completedWorkouts.fold(
      0.0,
      (sum, workout) => sum + workout.distance,
    );
  }

  /// Total workout duration.
  int get totalDuration {
    return completedWorkouts.fold(
      0,
      (sum, workout) => sum + workout.duration,
    );
  }

  // ===========================================================================
  // Private Helpers
  // ===========================================================================

  void _setLoading(bool value) {
    if (_isLoading == value) {
      return;
    }

    _isLoading = value;

    notifyListeners();
  }
}