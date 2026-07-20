/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/data/dummy_statistics.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Provides mock dashboard statistics.
/// • Supplies fitness metrics during Phase 8.
/// • Keeps presentation layer independent of persistence.
/// • Can later be replaced by Provider/Hive/API implementations.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Dashboard
/// • Progress Screen
/// • Statistic Card
/// ============================================================================
library;

import '../core/constants/app_assets.dart';
import '../models/statistic.dart';

/// Mock statistics displayed on the dashboard.
const List<Statistic> dummyStatistics = [
  Statistic(
    id: 'STAT001',
    title: 'Steps',
    value: '8,452',
    unit: 'steps',
    icon: AppAssets.workout,
    progress: 0.85,
    target: 10000,
    current: 8452,
  ),
  Statistic(
    id: 'STAT002',
    title: 'Calories',
    value: '1,780',
    unit: 'kcal',
    icon: AppAssets.calories,
    progress: 0.81,
    target: 2200,
    current: 1780,
  ),
  Statistic(
    id: 'STAT003',
    title: 'Distance',
    value: '6.8',
    unit: 'km',
    icon: AppAssets.workout,
    progress: 0.68,
    target: 10,
    current: 6.8,
  ),
  Statistic(
    id: 'STAT004',
    title: 'Heart Rate',
    value: '82',
    unit: 'bpm',
    icon: AppAssets.heart,
    progress: 0.82,
    target: 100,
    current: 82,
  ),
];

/// Primary dashboard statistic.
Statistic get featuredStatistic => dummyStatistics.first;

/// Daily steps statistic.
Statistic get stepsStatistic =>
    dummyStatistics.firstWhere((item) => item.title == 'Steps');

/// Daily calories statistic.
Statistic get caloriesStatistic =>
    dummyStatistics.firstWhere((item) => item.title == 'Calories');

/// Distance statistic.
Statistic get distanceStatistic =>
    dummyStatistics.firstWhere((item) => item.title == 'Distance');

/// Heart rate statistic.
Statistic get heartRateStatistic =>
    dummyStatistics.firstWhere((item) => item.title == 'Heart Rate');

/// Returns the average completion progress of all dashboard statistics.
double get overallProgress {
  if (dummyStatistics.isEmpty) {
    return 0;
  }

  final total = dummyStatistics.fold<double>(
    0,
    (sum, statistic) => sum + statistic.progress,
  );

  return total / dummyStatistics.length;
}

/// Returns the number of completed fitness goals.
int get completedGoals => dummyStatistics
    .where((statistic) => statistic.isGoalCompleted)
    .length;

/// Returns the number of pending fitness goals.
int get pendingGoals =>
    dummyStatistics.length - completedGoals;