import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_strings.dart';
import '../../data/dummy_profile.dart';
import '../../data/dummy_statistics.dart';
import '../../widgets/cards/progress_card.dart';
import '../../widgets/cards/statistic_card.dart';
import '../../widgets/navigation/bottom_nav_bar.dart';
import '../../widgets/navigation/custom_app_bar.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/progress/progress_screen.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display user's fitness progress
/// • Display daily goal completion
/// • Display achievement statistics
/// • Display weekly overview
/// • Display overall progress
/// • Consume dummy statistics during Phase 8
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Bottom Navigation
///
/// Notes
/// ----------------------------------------------------------------------------
/// • Uses dummy statistics during Phase 8.
/// • Charts will be integrated using fl_chart in a later phase.
/// • Provider/Hive integration will be added in Phase 9.
/// • Uses reusable widgets from the shared widget library.
/// ============================================================================
class ProgressScreen extends StatefulWidget {
  /// Creates a [ProgressScreen].
  const ProgressScreen({
    super.key,
  });

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  /// Selected navigation index.
  int _currentIndex = 2;

  /// Current user.
  final user = currentUser;

  /// Dashboard statistics.
  final statistics = dummyStatistics;

  /// Handles bottom navigation.
  void _onNavigationChanged(int index) {
    if (_currentIndex == index) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });

    // Navigation will be connected
    // after all Phase 8 screens
    // are completed.
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,

      appBar: CustomAppBar(
        title: AppStrings.progress,
        centerTitle: true,
        showBackButton: false,
        actions: [
          IconButton(
            tooltip: 'Insights',
            onPressed: () {
              // Future analytics screen.
            },
            icon: const Icon(
              Icons.insights_outlined,
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavigationChanged,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
                            // =============================================================
              // Overall Progress
              // =============================================================

              Text(
                'Overall Progress',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              ProgressCard(
                title: '${user.firstName}\'s Daily Goal',
                subtitle: 'Overall completion today',
                progress: overallProgress,
                currentValue: completedGoals,
                goalValue: statistics.length,
                unit: 'goals',
                onTap: () {},
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Weekly Overview
              // =============================================================

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weekly Overview',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: AppSpacing.lg,
                      ),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          _WeeklyProgressItem(
                            day: 'Mon',
                            progress: .65,
                          ),
                          _WeeklyProgressItem(
                            day: 'Tue',
                            progress: .82,
                          ),
                          _WeeklyProgressItem(
                            day: 'Wed',
                            progress: .54,
                          ),
                          _WeeklyProgressItem(
                            day: 'Thu',
                            progress: .93,
                          ),
                          _WeeklyProgressItem(
                            day: 'Fri',
                            progress: .71,
                          ),
                          _WeeklyProgressItem(
                            day: 'Sat',
                            progress: .88,
                          ),
                          _WeeklyProgressItem(
                            day: 'Sun',
                            progress: overallProgress,
                            isToday: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Today's Statistics
              // =============================================================

              Text(
                'Today\'s Statistics',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: statistics.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.md,
                  childAspectRatio: .95,
                ),
                itemBuilder: (context, index) {
                  final statistic = statistics[index];

                  return StatisticCard(
                    title: statistic.title,
                    value:
                        '${statistic.value} ${statistic.unit}',
                    subtitle:
                        '${statistic.current.toStringAsFixed(0)} / ${statistic.target.toStringAsFixed(0)}',
                    icon: statistic.icon as IconData?,
                    trend:
                        '${statistic.percentage.round()}%',
                    trendUp:
                        statistic.isGoalCompleted,
                    onTap: () {},
                  );
                },
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Goal Completion
              // =============================================================

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Goal Completion',
                              style: theme
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                            ),

                            const SizedBox(
                              height: AppSpacing.sm,
                            ),

                            Text(
                              '$completedGoals of ${statistics.length} goals completed',
                              style: theme
                                  .textTheme
                                  .bodyMedium,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 70,
                        height: 70,
                        child: CircularProgressIndicator(
                          value: overallProgress,
                          strokeWidth: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

                            // =============================================================
              // Daily Goals
              // =============================================================

              Text(
                'Daily Goals',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              ...statistics.map(
                (statistic) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppSpacing.lg,
                  ),
                  child: ProgressCard(
                    title: statistic.title,
                    subtitle: 'Daily Target',
                    progress: statistic.progress,
                    currentValue: statistic.current,
                    goalValue: statistic.target,
                    unit: statistic.unit,
                    onTap: () {},
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.lg,
              ),

              // =============================================================
              // Achievements
              // =============================================================

              Text(
                'Achievements',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Column(
                    children: [
                      _AchievementTile(
                        icon: Icons.emoji_events_rounded,
                        title: 'Goals Achieved',
                        value: '$completedGoals',
                      ),
                      const Divider(),
                      _AchievementTile(
                        icon: Icons.local_fire_department_rounded,
                        title: 'Calories Burned',
                        value:
                            '${caloriesStatistic.current.toInt()} kcal',
                      ),
                      const Divider(),
                      _AchievementTile(
                        icon: Icons.directions_walk_rounded,
                        title: 'Steps Walked',
                        value:
                            '${stepsStatistic.current.toInt()}',
                      ),
                      const Divider(),
                      _AchievementTile(
                        icon: Icons.route_rounded,
                        title: 'Distance Covered',
                        value:
                            '${distanceStatistic.current.toStringAsFixed(1)} km',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Personal Insights
              // =============================================================

              Text(
                'Personal Insights',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lightbulb_outline_rounded,
                            color:
                                theme.colorScheme.primary,
                          ),
                          const SizedBox(
                            width: AppSpacing.sm,
                          ),
                          Text(
                            'Today\'s Insight',
                            style: theme
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: AppSpacing.md,
                      ),

                      Text(
                        overallProgress >= 0.8
                            ? 'Excellent progress today! Keep maintaining your healthy routine.'
                            : overallProgress >= 0.5
                                ? 'You are making steady progress. Completing one more goal will significantly improve your daily score.'
                                : 'You are just getting started today. A short walk or quick workout can help you reach your goals.',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Recommendations
              // =============================================================

              Text(
                'Recommendations',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Column(
                    children: [
                      _RecommendationTile(
                        icon:
                            Icons.directions_walk_rounded,
                        title: 'Walk 1,500 more steps',
                        subtitle:
                            'Reach your daily step goal.',
                      ),
                      const Divider(),
                      _RecommendationTile(
                        icon:
                            Icons.local_fire_department_rounded,
                        title:
                            'Burn 420 more calories',
                        subtitle:
                            'Complete a moderate workout.',
                      ),
                      const Divider(),
                      _RecommendationTile(
                        icon: Icons.water_drop_rounded,
                        title: 'Stay Hydrated',
                        subtitle:
                            'Drink another glass of water after your workout.',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xxl,
              ),

                          ],
          ),
        ),
      ),
    );
  }
}

/// ============================================================================
/// Private Widgets
/// ============================================================================

class _WeeklyProgressItem extends StatelessWidget {
  const _WeeklyProgressItem({
    required this.day,
    required this.progress,
    this.isToday = false,
  });

  final String day;
  final double progress;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          width: 28,
          height: 90,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: progress.clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isToday
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: AppSpacing.sm,
        ),
        Text(
          day,
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight:
                isToday ? FontWeight.bold : FontWeight.normal,
            color: isToday
                ? theme.colorScheme.primary
                : null,
          ),
        ),
      ],
    );
  }
}

class _AchievementTile extends StatelessWidget {
  const _AchievementTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
                theme.colorScheme.primaryContainer,
            child: Icon(
              icon,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(
            width: AppSpacing.md,
          ),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendationTile extends StatelessWidget {
  const _RecommendationTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
                theme.colorScheme.primaryContainer,
            child: Icon(
              icon,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(
            width: AppSpacing.md,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: AppSpacing.xs,
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}