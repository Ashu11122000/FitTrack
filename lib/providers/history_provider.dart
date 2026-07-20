/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/providers/history_provider.dart
///
/// Workout history provider.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage workout history state.
/// • Load and persist workout history.
/// • Filter history.
/// • Expose workout history statistics.
/// • Notify the UI of history changes.
/// • Keep presentation logic separate from persistence.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • History Screen
/// • Progress Screen
/// • Dashboard
/// • HistoryRepository
/// ============================================================================
library;

import 'package:flutter/foundation.dart';

import '../models/workout.dart';
import '../repositories/history_repository.dart';

/// Provider responsible for managing workout history.
///
/// This provider communicates with [HistoryRepository] while exposing
/// reactive workout history data to the presentation layer.
///
/// Persistence remains inside the repository while this provider focuses
/// on application state and notifying listeners.
final class HistoryProvider extends ChangeNotifier {
  /// Creates a [HistoryProvider].
  HistoryProvider({
    HistoryRepository? repository,
  }) : _repository = repository ?? const HistoryRepository();

  final HistoryRepository _repository;

  List<Workout> _history = <Workout>[];
  bool _isLoading = false;

  // ===========================================================================
  // Getters
  // ===========================================================================

  /// Returns every workout history record.
  List<Workout> get history => List.unmodifiable(_history);

  /// Returns whether history is currently loading.
  bool get isLoading => _isLoading;

  /// Returns whether any workout history exists.
  bool get hasHistory => _history.isNotEmpty;

  /// Returns total history records.
  int get historyCount => _history.length;

  /// Returns history sorted by newest first.
  List<Workout> get sortedHistory {
    final history = List<Workout>.from(_history);

    history.sort(
      (a, b) => b.date.compareTo(a.date),
    );

    return history;
  }

  // ===========================================================================
  // Initialization
  // ===========================================================================

  /// Loads workout history.
  Future<void> initialize() async {
    _setLoading(true);

    try {
      _history = await _repository.getHistorySorted();
    } finally {
      _setLoading(false);

      notifyListeners();
    }
  }

  // ===========================================================================
  // CRUD Operations
  // ===========================================================================

  /// Adds a workout to history.
  Future<void> addWorkout(
    Workout workout,
  ) async {
    _setLoading(true);

    try {
      await _repository.addWorkout(workout);

      _history.add(workout);

      _history.sort(
        (a, b) => b.date.compareTo(a.date),
      );

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Removes a workout from history.
  Future<void> deleteWorkout(
    String id,
  ) async {
    _setLoading(true);

    try {
      await _repository.deleteWorkout(id);

      _history.removeWhere(
        (workout) => workout.id == id,
      );

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Clears all workout history.
  Future<void> clearHistory() async {
    _setLoading(true);

    try {
      await _repository.clearHistory();

      _history.clear();

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Reloads history from storage.
  Future<void> refresh() async {
    await initialize();
  }

  // ===========================================================================
  // Filtering
  // ===========================================================================

  /// Returns workouts belonging to the specified category.
  List<Workout> historyByCategory(
    String category,
  ) {
    return _history.where((workout) {
      return workout.category.toLowerCase() ==
          category.toLowerCase();
    }).toList();
  }

  /// Returns workouts performed on a specific day.
  List<Workout> historyByDate(
    DateTime date,
  ) {
    return _history.where((workout) {
      return workout.date.year == date.year &&
          workout.date.month == date.month &&
          workout.date.day == date.day;
    }).toList();
  }

  /// Returns workouts between two dates.
  List<Workout> historyBetween(
    DateTime start,
    DateTime end,
  ) {
    return _history.where((workout) {
      return !workout.date.isBefore(start) &&
          !workout.date.isAfter(end);
    }).toList();
  }

  // ===========================================================================
  // Statistics
  // ===========================================================================

  /// Returns total calories burned.
  int get totalCaloriesBurned {
    return _history.fold(
      0,
      (sum, workout) =>
          sum + workout.caloriesBurned,
    );
  }

  /// Returns total workout duration.
  int get totalWorkoutDuration {
    return _history.fold(
      0,
      (sum, workout) =>
          sum + workout.duration,
    );
  }

  /// Returns total steps completed.
  int get totalSteps {
    return _history.fold(
      0,
      (sum, workout) =>
          sum + workout.steps,
    );
  }

  /// Returns total distance covered.
  double get totalDistanceCovered {
    return _history.fold(
      0.0,
      (sum, workout) =>
          sum + workout.distance,
    );
  }

  /// Returns the latest completed workout.
  Workout? get latestWorkout {
    if (_history.isEmpty) {
      return null;
    }

    return sortedHistory.first;
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