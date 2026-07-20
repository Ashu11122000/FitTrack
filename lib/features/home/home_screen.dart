import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_strings.dart';
import '../../data/dummy_profile.dart';
import '../../data/dummy_statistics.dart';
import '../../data/dummy_workouts.dart';
import '../../widgets/cards/progress_card.dart';
import '../../widgets/cards/statistic_card.dart';
import '../../widgets/cards/workout_card.dart';
import '../../widgets/common/section_title.dart';
import '../../widgets/navigation/bottom_nav_bar.dart';
import '../../widgets/navigation/custom_app_bar.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/home/home_screen.dart
///
/// Home dashboard displaying the user's fitness overview.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display personalized greeting
/// • Display today's statistics
/// • Display goal progress
/// • Display featured workout
/// • Display recent workouts
/// • Provide bottom navigation
/// • Consume dummy data during Phase 8
///
/// Used By
/// ----------------------------------------------------------------------------
/// • App Routes
/// • Login Screen
///
/// Notes
/// ----------------------------------------------------------------------------
/// • Uses dummy data during Phase 8.
/// • Provider, Hive and networking will be integrated in Phase 9.
/// • Uses only reusable widgets and centralized design system.
/// ============================================================================
class HomeScreen extends StatefulWidget {
  /// Creates a [HomeScreen].
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Current selected navigation index.
  int _currentIndex = 0;

  /// Current signed-in user.
  final user = currentUser;

  /// Dashboard statistics.
  final statistics = dummyStatistics;

  /// Workout collection.
  final workouts = dummyWorkouts;

  /// Handles bottom navigation selection.
  void _onNavigationChanged(int index) {
    if (_currentIndex == index) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });

    // Navigation between screens will be connected
    // after all Phase 8 screens are implemented.
  }

  IconData? _getStatisticIcon(String title) {
    switch (title) {
      case 'Steps':
        return Icons.directions_walk_rounded;
      case 'Calories':
        return Icons.local_fire_department_rounded;
      case 'Distance':
        return Icons.map_rounded;
      case 'Heart Rate':
        return Icons.favorite_rounded;
      default:
        return Icons.bar_chart_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,

      appBar: CustomAppBar(
        title: AppStrings.dashboard,
        showBackButton: false,
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
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
              // Greeting
              // =============================================================

              Text(
                'Good Morning,',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(
                height: AppSpacing.xs,
              ),

              Text(
                user.fullName,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.flag_rounded,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(
                      width: AppSpacing.sm,
                    ),
                    Text(
                      'Goal: ${user.goal}',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Today's Statistics
              // =============================================================

              const SectionTitle(
                title: 'Today\'s Statistics',
                subtitle: 'Track your daily fitness progress',
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: statistics.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.md,
                  childAspectRatio: 1.02,
                ),
                itemBuilder: (context, index) {
                  final statistic = statistics[index];

                  return StatisticCard(
                    title: statistic.title,
                    value:
                        '${statistic.value} ${statistic.unit}',
                    subtitle:
                        '${statistic.current.toStringAsFixed(0)} / ${statistic.target.toStringAsFixed(0)}',
                    icon: _getStatisticIcon(statistic.title),
                    trend:
                        '${statistic.percentage.round()}%',
                    trendUp: statistic.progress >= 0.5,
                    onTap: () {},
                  );
                },
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

                            // =============================================================
              // Today's Goal
              // =============================================================

              const SectionTitle(
                title: 'Today\'s Goal',
                subtitle: 'Keep moving towards your daily target',
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              ProgressCard(
                title: 'Daily Steps',
                subtitle: 'Walking Goal',
                progress: stepsStatistic.progress,
                currentValue: stepsStatistic.current.toInt(),
                goalValue: stepsStatistic.target.toInt(),
                unit: 'steps',
                progressColor: theme.colorScheme.primary,
                onTap: () {},
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Featured Workout
              // =============================================================

              SectionTitle(
                title: 'Featured Workout',
                subtitle: 'Continue your latest workout',
                actionText: 'View All',
                onActionPressed: () {
                  // Navigation will be connected
                  // after Workout Screen is implemented.
                },
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              WorkoutCard(
                title: latestWorkout.title,
                duration: latestWorkout.formattedDuration,
                calories: latestWorkout.formattedCalories,
                progress: latestWorkout.completed ? 1.0 : 0.55,
                image: latestWorkout.image,
                level: latestWorkout.category,
                onPressed: () {
                  // Navigate to Workout Details
                  // after Phase 8 implementation.
                },
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Recent Workouts
              // =============================================================

              SectionTitle(
                title: 'Recent Workouts',
                subtitle: 'Your latest fitness activities',
                actionText: 'See All',
                onActionPressed: () {
                  // History screen navigation
                  // will be connected later.
                },
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

                            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: completedWorkouts.length,
                separatorBuilder: (_, __) => const SizedBox(
                  height: AppSpacing.lg,
                ),
                itemBuilder: (context, index) {
                  final workout = completedWorkouts[index];

                  return WorkoutCard(
                    title: workout.title,
                    duration: workout.formattedDuration,
                    calories: workout.formattedCalories,
                    progress: workout.completed ? 1.0 : 0.0,
                    image: workout.image,
                    level: workout.category,
                    onPressed: () {
                      // Workout Details navigation
                      // will be connected after all
                      // Phase 8 screens are implemented.
                    },
                  );
                },
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