/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/providers/progress_provider.dart
///
/// Progress provider.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage fitness progress state.
/// • Load and persist dashboard statistics.
/// • Track goal completion.
/// • Calculate overall progress.
/// • Notify the UI when progress changes.
/// • Keep presentation logic separate from persistence.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Progress Screen
/// • Statistics Cards
/// • Progress Charts
/// • StatisticsRepository
/// ============================================================================
library;

import 'package:flutter/foundation.dart';

import '../models/statistic.dart';
import '../repositories/statistics_repository.dart';

/// Provider responsible for managing dashboard statistics and
/// overall fitness progress.
///
/// This provider communicates with [StatisticsRepository] while exposing
/// reactive progress data to the presentation layer.
///
/// Persistence remains inside the repository.
final class ProgressProvider extends ChangeNotifier {
  /// Creates a [ProgressProvider].
  ProgressProvider({
    StatisticsRepository? repository,
  }) : _repository =
            repository ?? const StatisticsRepository();

  final StatisticsRepository _repository;

  List<Statistic> _statistics = <Statistic>[];
  bool _isLoading = false;

  // ===========================================================================
  // Getters
  // ===========================================================================

  /// Returns all statistics.
  List<Statistic> get statistics =>
      List.unmodifiable(_statistics);

  /// Returns whether statistics are currently loading.
  bool get isLoading => _isLoading;

  /// Returns whether any statistics exist.
  bool get hasStatistics => _statistics.isNotEmpty;

  /// Returns the total number of statistics.
  int get statisticCount => _statistics.length;

  /// Returns the average completion percentage.
  double get averageProgress {
    if (_statistics.isEmpty) {
      return 0.0;
    }

    final total = _statistics.fold<double>(
      0,
      (sum, statistic) => sum + statistic.progress,
    );

    return total / _statistics.length;
  }

  /// Returns completed goals.
  int get completedGoals {
    return _statistics
        .where(
          (statistic) =>
              statistic.current >= statistic.target,
        )
        .length;
  }

  /// Returns remaining goals.
  int get remainingGoals {
    return _statistics
        .where(
          (statistic) =>
              statistic.current < statistic.target,
        )
        .length;
  }

  /// Returns whether every goal has been completed.
  bool get allGoalsCompleted {
    if (_statistics.isEmpty) {
      return false;
    }

    return completedGoals == _statistics.length;
  }

  // ===========================================================================
  // Initialization
  // ===========================================================================

  /// Loads statistics from storage.
  Future<void> initialize() async {
    _setLoading(true);

    try {
      _statistics =
          await _repository.getAllStatistics();
    } finally {
      _setLoading(false);

      notifyListeners();
    }
  }

  // ===========================================================================
  // CRUD Operations
  // ===========================================================================

  /// Saves a statistic.
  Future<void> saveStatistic(
    Statistic statistic,
  ) async {
    _setLoading(true);

    try {
      await _repository.saveStatistic(statistic);

      _statistics.add(statistic);

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Updates an existing statistic.
  Future<void> updateStatistic(
    Statistic statistic,
  ) async {
    _setLoading(true);

    try {
      await _repository.updateStatistic(statistic);

      final index = _statistics.indexWhere(
        (item) => item.id == statistic.id,
      );

      if (index != -1) {
        _statistics[index] = statistic;
      }

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Deletes a statistic.
  Future<void> deleteStatistic(
    String id,
  ) async {
    _setLoading(true);

    try {
      await _repository.deleteStatistic(id);

      _statistics.removeWhere(
        (statistic) => statistic.id == id,
      );

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Updates progress values for a statistic.
  Future<void> updateProgress({
    required String id,
    required double progress,
    required double current,
  }) async {
    _setLoading(true);

    try {
      await _repository.updateProgress(
        id: id,
        progress: progress,
        current: current,
      );

      final index = _statistics.indexWhere(
        (statistic) => statistic.id == id,
      );

      if (index != -1) {
        _statistics[index] =
            _statistics[index].copyWith(
          progress: progress,
          current: current,
        );
      }

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Reloads statistics from storage.
  Future<void> refresh() async {
    await initialize();
  }

  /// Removes every stored statistic.
  Future<void> clearStatistics() async {
    _setLoading(true);

    try {
      await _repository.clearStatistics();

      _statistics.clear();

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // ===========================================================================
  // Lookup
  // ===========================================================================

  /// Returns a statistic by its identifier.
  Statistic? statisticById(
    String id,
  ) {
    try {
      return _statistics.firstWhere(
        (statistic) => statistic.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  /// Returns a statistic by title.
  Statistic? statisticByTitle(
    String title,
  ) {
    try {
      return _statistics.firstWhere(
        (statistic) =>
            statistic.title.toLowerCase() ==
            title.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
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