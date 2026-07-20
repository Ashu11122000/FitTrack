import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_radius.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';
import '../common/progress_ring.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/cards/progress_card.dart
///
/// Reusable progress card.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Theme aware
/// • Circular progress
/// • Goal information
/// • Progress percentage
/// • Optional action button
/// • Responsive
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Progress Screen
/// • Dashboard
/// • Goal Tracking
/// ============================================================================

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    super.key,
    required this.title,
    required this.progress,
    required this.currentValue,
    required this.goalValue,
    this.unit = '',
    this.subtitle,
    this.progressColor,
    this.onTap,
  });

  /// Card title
  final String title;

  /// Progress (0.0 - 1.0)
  final double progress;

  /// Current value
  final num currentValue;

  /// Goal value
  final num goalValue;

  /// Unit
  final String unit;

  /// Optional subtitle
  final String? subtitle;

  /// Progress color
  final Color? progressColor;

  /// Tap callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final value = progress.clamp(0.0, 1.0);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.card,
      ),
      child: InkWell(
        borderRadius: AppRadius.card,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              ProgressRing(
                progress: value,
                size: 90,
                progressColor:
                    progressColor ?? colorScheme.primary,
              ),

              const SizedBox(width: AppSpacing.xl),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextTheme.titleLarge,
                    ),

                    if (subtitle != null) ...[
                      const SizedBox(
                        height: AppSpacing.xs,
                      ),
                      Text(
                        subtitle!,
                        style: AppTextTheme.bodySmall,
                      ),
                    ],

                    const SizedBox(
                      height: AppSpacing.lg,
                    ),

                    Text(
                      '$currentValue / $goalValue $unit',
                      style: AppTextTheme.headlineSmall,
                    ),

                    const SizedBox(
                      height: AppSpacing.sm,
                    ),

                    ClipRRect(
                      borderRadius:
                          AppRadius.radiusPill,
                      child: LinearProgressIndicator(
                        value: value,
                        minHeight: 8,
                        backgroundColor:
                            AppColors.grey200,
                        valueColor:
                            AlwaysStoppedAnimation(
                          progressColor ??
                              colorScheme.primary,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: AppSpacing.sm,
                    ),

                    Align(
                      alignment:
                          Alignment.centerRight,
                      child: Text(
                        '${(value * 100).round()}%',
                        style:
                            AppTextTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}