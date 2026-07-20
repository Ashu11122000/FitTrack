import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_radius.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';
import '../buttons/primary_button.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/cards/workout_card.dart
///
/// Reusable workout card.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Theme aware
/// • Workout image
/// • Workout information
/// • Progress indicator
/// • Difficulty badge
/// • Action button
/// • Responsive layout
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Workout Screen
/// • Search Screen
/// • Favorites
/// ============================================================================

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.title,
    required this.duration,
    required this.calories,
    required this.progress,
    this.image,
    this.level,
    this.onPressed,
  });

  /// Workout title
  final String title;

  /// Workout duration
  final String duration;

  /// Calories
  final String calories;

  /// Progress (0.0 - 1.0)
  final double progress;

  /// Workout image
  final String? image;

  /// Difficulty
  final String? level;

  /// Start callback
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==============================================================
          // Workout Image
          // ==============================================================

          AspectRatio(
            aspectRatio: 16 / 9,
            child: image != null
                ? Image.asset(
                    image!,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: theme.colorScheme.primaryContainer,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.fitness_center_rounded,
                      size: AppSizes.icon4xl,
                      color: theme.colorScheme.primary,
                    ),
                  ),
          ),

          // ==============================================================
          // Content
          // ==============================================================

          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (level != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(.10),
                      borderRadius: AppRadius.radiusPill,
                    ),
                    child: Text(
                      level!,
                      style: AppTextTheme.labelMedium.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),

                if (level != null)
                  const SizedBox(height: AppSpacing.md),

                Text(
                  title,
                  style: AppTextTheme.titleLarge,
                ),

                const SizedBox(height: AppSpacing.sm),

                Row(
                  children: [
                    const Icon(
                      Icons.schedule_outlined,
                      size: AppSizes.iconSm,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      duration,
                      style: AppTextTheme.bodySmall,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.local_fire_department_outlined,
                      color: AppColors.warning,
                      size: AppSizes.iconSm,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      calories,
                      style: AppTextTheme.bodySmall,
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.lg),

                ClipRRect(
                  borderRadius: AppRadius.radiusPill,
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    minHeight: 8,
                  ),
                ),

                const SizedBox(height: AppSpacing.sm),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${(progress * 100).round()}%',
                    style: AppTextTheme.labelMedium,
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                PrimaryButton(
                  text: progress >= 1
                      ? 'Completed'
                      : progress == 0
                          ? 'Start Workout'
                          : 'Continue Workout',
                  onPressed: progress >= 1 ? null : onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}