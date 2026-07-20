/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/repositories/statistics_repository.dart
///
/// Statistics repository.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage fitness statistics persistence.
/// • Store dashboard statistics.
/// • Retrieve progress metrics.
/// • Calculate summary information.
/// • Keep persistence logic separate from providers.
/// • Prepare for future REST API integration.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • ProgressProvider
/// • Home Screen
/// • Progress Screen
/// • Statistic Cards
/// • Future Cloud Synchronization
/// ============================================================================
library;

import 'package:hive/hive.dart';

import '../models/statistic.dart';
import '../services/hive_service.dart';
import '../storage/hive_boxes.dart';

/// Repository responsible for dashboard statistics persistence.
///
/// Statistics are stored locally using Hive.
///
/// Future versions can synchronize these statistics with
/// Firebase or a REST API without modifying the Provider layer.
final class StatisticsRepository {
  /// Creates a [StatisticsRepository].
  const StatisticsRepository();

  /// Statistics Hive box.
  Box<dynamic> get _box =>
      HiveService.box<dynamic>(HiveBoxes.statistics);

  // ===========================================================================
  // Create
  // ===========================================================================

  /// Saves a statistic.
  Future<void> saveStatistic(
    Statistic statistic,
  ) async {
    await _box.put(
      statistic.id,
      statistic.toJson(),
    );
  }

  /// Saves multiple statistics.
  Future<void> saveStatistics(
    List<Statistic> statistics,
  ) async {
    for (final statistic in statistics) {
      await saveStatistic(statistic);
    }
  }

  // ===========================================================================
  // Read
  // ===========================================================================

  /// Returns a statistic by its identifier.
  Future<Statistic?> getStatistic(
    String id,
  ) async {
    final dynamic data = _box.get(id);

    if (data == null) {
      return null;
    }

    if (data is Map) {
      return Statistic.fromJson(
        Map<String, dynamic>.from(data),
      );
    }

    return null;
  }

  /// Returns every stored statistic.
  Future<List<Statistic>> getAllStatistics() async {
    return _box.values
        .whereType<Map>()
        .map(
          (dynamic json) => Statistic.fromJson(
            Map<String, dynamic>.from(json as Map),
          ),
        )
        .toList();
  }

  /// Returns a statistic by title.
  Future<Statistic?> getStatisticByTitle(
    String title,
  ) async {
    final statistics = await getAllStatistics();

    try {
      return statistics.firstWhere(
        (statistic) =>
            statistic.title.toLowerCase() ==
            title.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }

  // ===========================================================================
  // Update
  // ===========================================================================

  /// Updates an existing statistic.
  Future<void> updateStatistic(
    Statistic statistic,
  ) async {
    await saveStatistic(statistic);
  }

  /// Updates the progress of a statistic.
  Future<void> updateProgress({
    required String id,
    required double progress,
    required double current,
  }) async {
    final statistic = await getStatistic(id);

    if (statistic == null) {
      return;
    }

    await updateStatistic(
      statistic.copyWith(
        progress: progress,
        current: current,
      ),
    );
  }

  // ===========================================================================
  // Delete
  // ===========================================================================

  /// Deletes a statistic.
  Future<void> deleteStatistic(
    String id,
  ) async {
    await _box.delete(id);
  }

  /// Removes every stored statistic.
  Future<void> clearStatistics() async {
    await _box.clear();
  }

  // ===========================================================================
  // Utility
  // ===========================================================================

  /// Returns whether a statistic exists.
  Future<bool> exists(
    String id,
  ) async {
    return _box.containsKey(id);
  }

  /// Returns the total number of statistics.
  Future<int> statisticCount() async {
    return _box.length;
  }

  /// Returns the average progress percentage.
  ///
  /// Returns a value between 0.0 and 1.0.
  Future<double> averageProgress() async {
    final statistics = await getAllStatistics();

    if (statistics.isEmpty) {
      return 0.0;
    }

    final total = statistics.fold<double>(
      0,
      (sum, statistic) => sum + statistic.progress,
    );

    return total / statistics.length;
  }

  /// Returns the total current value across all statistics.
  Future<double> totalCurrent() async {
    final statistics = await getAllStatistics();

    return statistics.fold<double>(
      0,
      (sum, statistic) => sum + statistic.current,
    );
  }

  /// Returns the total target value across all statistics.
  Future<double> totalTarget() async {
    final statistics = await getAllStatistics();

    return statistics.fold<double>(
      0,
      (sum, statistic) => sum + statistic.target,
    );
  }

  /// Returns whether every statistic has reached its goal.
  Future<bool> allGoalsCompleted() async {
    final statistics = await getAllStatistics();

    if (statistics.isEmpty) {
      return false;
    }

    return statistics.every(
      (statistic) =>
          statistic.current >= statistic.target,
    );
  }

  /// Returns the number of completed goals.
  Future<int> completedGoals() async {
    final statistics = await getAllStatistics();

    return statistics
        .where(
          (statistic) =>
              statistic.current >= statistic.target,
        )
        .length;
  }

  /// Returns the number of remaining goals.
  Future<int> remainingGoals() async {
    final statistics = await getAllStatistics();

    return statistics
        .where(
          (statistic) =>
              statistic.current < statistic.target,
        )
        .length;
  }
}