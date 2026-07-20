import 'package:fittrack/widgets/cards/workout_card.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_strings.dart';
import '../../data/dummy_workouts.dart';
import '../../models/workout.dart';
import '../../widgets/navigation/bottom_nav_bar.dart';
import '../../widgets/navigation/custom_app_bar.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/history/history_screen.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display workout history
/// • Display completed workouts
/// • Filter workout history
/// • Search previous activities (future)
/// • Navigate to workout details
/// • Consume dummy workout data
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Bottom Navigation
///
/// Notes
/// ----------------------------------------------------------------------------
/// • Uses dummy workout data during Phase 8.
/// • Search and filtering will be connected to Provider in Phase 9.
/// • Uses reusable widgets from the shared widget library.
/// ============================================================================
class HistoryScreen extends StatefulWidget {
  /// Creates a [HistoryScreen].
  const HistoryScreen({
    super.key,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  /// Selected bottom navigation index.
  int _currentIndex = 3;

  /// Selected history filter.
  int _selectedFilter = 0;

  /// Available workout filters.
  final List<String> _filters = const [
    'All',
    'Running',
    'Strength',
    'Yoga',
    'Cycling',
    'Walking',
    'HIIT',
  ];

  /// Complete workout collection.
  final List<Workout> _workouts = dummyWorkouts;

  /// Returns workouts matching the selected filter.
  List<Workout> get _filteredWorkouts {
    if (_selectedFilter == 0) {
      return _workouts;
    }

    final category = _filters[_selectedFilter];

    return _workouts
        .where(
          (workout) => workout.category == category,
        )
        .toList();
  }

  /// Handles filter selection.
  void _selectFilter(int index) {
    if (_selectedFilter == index) {
      return;
    }

    setState(() {
      _selectedFilter = index;
    });
  }

  /// Handles bottom navigation.
  void _onNavigationChanged(int index) {
    if (_currentIndex == index) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });

    // Navigation will be connected after
    // all Phase 8 screens are completed.
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,

      appBar: CustomAppBar(
        title: AppStrings.history,
        showBackButton: false,
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Search',
            onPressed: () {
              // Phase 9
            },
            icon: const Icon(
              Icons.search_rounded,
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
              // History Summary
              // =============================================================

              Text(
                'Workout Summary',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.lg,
              ),

              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          AppSpacing.lg,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.fitness_center_rounded,
                              color: theme.colorScheme.primary,
                              size: 32,
                            ),
                            const SizedBox(
                              height: AppSpacing.md,
                            ),
                            Text(
                              '${completedWorkouts.length}',
                              style: theme
                                  .textTheme.headlineSmall
                                  ?.copyWith(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              height: AppSpacing.xs,
                            ),
                            Text(
                              'Completed',
                              style:
                                  theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: AppSpacing.md,
                  ),

                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          AppSpacing.lg,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.local_fire_department_rounded,
                              color:
                                  theme.colorScheme.primary,
                              size: 32,
                            ),
                            const SizedBox(
                              height: AppSpacing.md,
                            ),
                            Text(
                              '$totalCaloriesBurned',
                              style: theme
                                  .textTheme.headlineSmall
                                  ?.copyWith(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              height: AppSpacing.xs,
                            ),
                            Text(
                              'Calories',
                              style:
                                  theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          AppSpacing.lg,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.schedule_rounded,
                              color:
                                  theme.colorScheme.primary,
                              size: 32,
                            ),
                            const SizedBox(
                              height: AppSpacing.md,
                            ),
                            Text(
                              '$totalWorkoutDuration',
                              style: theme
                                  .textTheme.headlineSmall
                                  ?.copyWith(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              height: AppSpacing.xs,
                            ),
                            Text(
                              'Minutes',
                              style:
                                  theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: AppSpacing.md,
                  ),

                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          AppSpacing.lg,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.route_rounded,
                              color:
                                  theme.colorScheme.primary,
                              size: 32,
                            ),
                            const SizedBox(
                              height: AppSpacing.md,
                            ),
                            Text(
                              totalDistanceCovered
                                  .toStringAsFixed(1),
                              style: theme
                                  .textTheme.headlineSmall
                                  ?.copyWith(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              height: AppSpacing.xs,
                            ),
                            Text(
                              'Kilometers',
                              style:
                                  theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Filters
              // =============================================================

              Text(
                'Categories',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(
                    width: AppSpacing.sm,
                  ),
                  itemBuilder: (context, index) {
                    final selected =
                        _selectedFilter == index;

                    return ChoiceChip(
                      label: Text(
                        _filters[index],
                      ),
                      selected: selected,
                      onSelected: (_) =>
                          _selectFilter(index),
                    );
                  },
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Workout History
              // =============================================================

              Text(
                'Workout History',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

                            // =============================================================
              // Workout History List
              // =============================================================

              if (_filteredWorkouts.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppSpacing.xl,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.history_toggle_off_rounded,
                          size: 72,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(
                          height: AppSpacing.lg,
                        ),
                        Text(
                          'No Workouts Found',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: AppSpacing.sm,
                        ),
                        Text(
                          'Try selecting another category or complete a new workout.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filteredWorkouts.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(
                    height: AppSpacing.lg,
                  ),
                  itemBuilder: (context, index) {
                    final workout =
                        _filteredWorkouts[index];

                    final progress =
                        workout.completed ? 1.0 : 0.0;

                    return GestureDetector(
                      onTap: () {
                        // Navigate to Workout Details
                        // after all Phase 8 screens
                        // are completed.
                      },
                      child: WorkoutCard(
                        title: workout.title,
                        duration:
                            workout.formattedDuration,
                        calories:
                            workout.formattedCalories,
                        progress: progress,
                        image: workout.image,
                        level: workout.category,
                        onPressed: () {
                          // Workout action
                        },
                      ),
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