import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_radius.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/cards/statistic_card.dart
///
/// Reusable statistic card.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Theme aware
/// • Optional icon
/// • Title
/// • Value
/// • Subtitle
/// • Optional trend
/// • Responsive
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Progress Screen
/// • Dashboard
/// • Statistics
/// ============================================================================

class StatisticCard extends StatelessWidget {
  const StatisticCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.valueColor,
    this.trend,
    this.trendUp = true,
    this.onTap,
  });

  /// Card title
  final String title;

  /// Main statistic
  final String value;

  /// Optional subtitle
  final String? subtitle;

  /// Leading icon
  final IconData? icon;

  /// Icon color
  final Color? iconColor;

  /// Card background
  final Color? backgroundColor;

  /// Value color
  final Color? valueColor;

  /// Trend text
  final String? trend;

  /// Trend direction
  final bool trendUp;

  /// Tap callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.card,
      ),
      child: InkWell(
        borderRadius: AppRadius.card,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =============================================================
              // Header
              // =============================================================

              if (icon != null)
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: (iconColor ?? colorScheme.primary)
                        .withOpacity(.12),
                    borderRadius: AppRadius.radiusLg,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? colorScheme.primary,
                  ),
                ),

              if (icon != null)
                const SizedBox(height: AppSpacing.lg),

              // =============================================================
              // Title
              // =============================================================

              Text(
                title,
                style: AppTextTheme.bodyMedium,
              ),

              const SizedBox(height: AppSpacing.sm),

              // =============================================================
              // Value
              // =============================================================

              Text(
                value,
                style: AppTextTheme.headlineMedium.copyWith(
                  color: valueColor,
                ),
              ),

              // =============================================================
              // Subtitle
              // =============================================================

              if (subtitle != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle!,
                  style: AppTextTheme.bodySmall,
                ),
              ],

              // =============================================================
              // Trend
              // =============================================================

              if (trend != null) ...[
                const SizedBox(height: AppSpacing.md),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      trendUp
                          ? Icons.trending_up_rounded
                          : Icons.trending_down_rounded,
                      color: trendUp
                          ? AppColors.success
                          : AppColors.error,
                      size: 18,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      trend!,
                      style: AppTextTheme.labelMedium.copyWith(
                        color: trendUp
                            ? AppColors.success
                            : AppColors.error,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}