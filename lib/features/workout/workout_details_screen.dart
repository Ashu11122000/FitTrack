import 'package:fittrack/widgets/cards/progress_card.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_strings.dart';
import '../../models/workout.dart';
import '../../widgets/navigation/custom_app_bar.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/workout/workout_details_screen.dart
///
/// Production-ready workout details screen.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display complete workout information
/// • Display workout image
/// • Display workout statistics
/// • Display workout description
/// • Display workout progress
/// • Allow user to start/continue workout
/// • Consume Workout model
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • History Screen
/// • Workout List
///
/// Notes
/// ----------------------------------------------------------------------------
/// • Uses the Workout model.
/// • Uses reusable widgets from Phase 7.
/// • Provider/Hive integration will be added in Phase 9.
/// ============================================================================
class WorkoutDetailsScreen extends StatelessWidget {
  /// Creates a [WorkoutDetailsScreen].
  const WorkoutDetailsScreen({
    super.key,
    required this.workout,
  });

  /// Workout to display.
  final Workout workout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,

      appBar: CustomAppBar(
        title: AppStrings.workouts,
        showBackButton: true,
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Favorite',
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
            ),
          ),
          IconButton(
            tooltip: 'Share',
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
        ],
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
              // Hero Image
              // =============================================================

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: workout.image.isNotEmpty
                      ? Image.asset(
                          workout.image,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: theme.colorScheme.primaryContainer,
                          child: Icon(
                            Icons.fitness_center_rounded,
                            size: 72,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Workout Header
              // =============================================================

              Text(
                workout.title,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  Chip(
                    avatar: const Icon(
                      Icons.category_rounded,
                      size: 18,
                    ),
                    label: Text(
                      workout.category,
                    ),
                  ),
                  Chip(
                    avatar: const Icon(
                      Icons.schedule_rounded,
                      size: 18,
                    ),
                    label: Text(
                      workout.formattedDuration,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Workout Statistics
              // =============================================================

              Row(
                children: [
                  Expanded(
                    child: _WorkoutMetricCard(
                      icon: Icons.local_fire_department_rounded,
                      iconColor: Colors.orange,
                      title: AppStrings.calories,
                      value: workout.formattedCalories,
                    ),
                  ),
                  const SizedBox(
                    width: AppSpacing.md,
                  ),
                  Expanded(
                    child: _WorkoutMetricCard(
                      icon: Icons.route_rounded,
                      iconColor: Colors.blue,
                      title: AppStrings.distance,
                      value: workout.formattedDistance,
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
                    child: _WorkoutMetricCard(
                      icon: Icons.directions_walk_rounded,
                      iconColor: Colors.green,
                      title: AppStrings.steps,
                      value: '${workout.steps}',
                    ),
                  ),
                  const SizedBox(
                    width: AppSpacing.md,
                  ),
                  Expanded(
                    child: _WorkoutMetricCard(
                      icon: Icons.favorite_rounded,
                      iconColor: Colors.red,
                      title: AppStrings.heartRate,
                      value:
                          '${workout.averageHeartRate} bpm',
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Completion Status
              // =============================================================

              Row(
                children: [
                  Icon(
                    workout.completed
                        ? Icons.check_circle_rounded
                        : Icons.timelapse_rounded,
                    color: workout.completed
                        ? Colors.green
                        : theme.colorScheme.primary,
                  ),
                  const SizedBox(
                    width: AppSpacing.sm,
                  ),
                  Text(
                    workout.completed
                        ? 'Workout Completed'
                        : 'Workout In Progress',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: LinearProgressIndicator(
                  minHeight: 8,
                  value: workout.completed ? 1.0 : 0.55,
                  backgroundColor: AppColors.grey200,
                ),
              ),

              const SizedBox(
                height: AppSpacing.sm,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  workout.completed
                      ? '100%'
                      : '55%',
                  style: theme.textTheme.labelLarge,
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

                            // =============================================================
              // Workout Description
              // =============================================================

              Text(
                'About Workout',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Text(
                workout.description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Workout Progress
              // =============================================================

              Text(
                'Workout Progress',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              ProgressCard(
                title: workout.title,
                subtitle: 'Session Progress',
                progress: workout.completed ? 1.0 : 0.55,
                currentValue: workout.completed
                    ? workout.duration
                    : (workout.duration * 0.55).round(),
                goalValue: workout.duration,
                unit: 'min',
                progressColor: theme.colorScheme.primary,
                onTap: () {},
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Additional Information
              // =============================================================

              Text(
                'Additional Information',
                style: theme.textTheme.titleLarge?.copyWith(
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
                      _WorkoutInfoTile(
                        icon: Icons.calendar_today_rounded,
                        title: 'Workout Date',
                        value:
                            '${workout.date.day}/${workout.date.month}/${workout.date.year}',
                      ),
                      const Divider(),
                      _WorkoutInfoTile(
                        icon: Icons.timer_outlined,
                        title: 'Duration',
                        value: workout.formattedDuration,
                      ),
                      const Divider(),
                      _WorkoutInfoTile(
                        icon: Icons.local_fire_department_rounded,
                        title: 'Calories Burned',
                        value: workout.formattedCalories,
                      ),
                      const Divider(),
                      _WorkoutInfoTile(
                        icon: Icons.route_rounded,
                        title: 'Distance',
                        value: workout.formattedDistance,
                      ),
                      const Divider(),
                      _WorkoutInfoTile(
                        icon: Icons.favorite_rounded,
                        title: 'Average Heart Rate',
                        value:
                            '${workout.averageHeartRate} bpm',
                      ),
                      const Divider(),
                      _WorkoutInfoTile(
                        icon: workout.completed
                            ? Icons.check_circle_rounded
                            : Icons.timelapse_rounded,
                        title: 'Status',
                        value: workout.completed
                            ? 'Completed'
                            : 'In Progress',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

                            // =============================================================
              // Start / Continue Workout
              // =============================================================

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    // Workout execution will be connected
                    // in a later phase.
                  },
                  icon: Icon(
                    workout.completed
                        ? Icons.replay_rounded
                        : Icons.play_arrow_rounded,
                  ),
                  label: Text(
                    workout.completed
                        ? 'Start Again'
                        : 'Continue Workout',
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

class _WorkoutMetricCard extends StatelessWidget {
  const _WorkoutMetricCard({
    required this.icon,
    required this.title,
    required this.value,
    this.iconColor,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: iconColor ?? theme.colorScheme.primary,
            ),
            const SizedBox(
              height: AppSpacing.md,
            ),
            Text(
              value,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: AppSpacing.xs,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkoutInfoTile extends StatelessWidget {
  const _WorkoutInfoTile({
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
          Icon(
            icon,
            color: theme.colorScheme.primary,
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
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}