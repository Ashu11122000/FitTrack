import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/common/progress_ring.dart
///
/// Reusable circular progress widget.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Animated progress
/// • Percentage label
/// • Optional title
/// • Optional subtitle
/// • Configurable colors
/// • Configurable stroke width
/// • Responsive
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Progress Screen
/// • Workout Screen
/// • Statistic Cards
/// ============================================================================

class ProgressRing extends StatelessWidget {
  const ProgressRing({
    super.key,
    required this.progress,
    this.size = AppSizes.progressLarge,
    this.strokeWidth = 8,
    this.title,
    this.subtitle,
    this.showPercentage = true,
    this.progressColor,
    this.backgroundColor,
  });

  /// Progress value (0.0 - 1.0)
  final double progress;

  /// Ring size
  final double size;

  /// Stroke width
  final double strokeWidth;

  /// Optional title
  final String? title;

  /// Optional subtitle
  final String? subtitle;

  /// Show percentage text
  final bool showPercentage;

  /// Progress color
  final Color? progressColor;

  /// Background color
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final value = progress.clamp(0.0, 1.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: strokeWidth,
                  backgroundColor: backgroundColor ??
                      AppColors.grey200,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    progressColor ?? colorScheme.primary,
                  ),
                ),
              ),

              if (showPercentage)
                Text(
                  '${(value * 100).round()}%',
                  style: AppTextTheme.titleMedium,
                ),
            ],
          ),
        ),

        if (title != null) ...[
          const SizedBox(height: AppSpacing.lg),
          Text(
            title!,
            style: AppTextTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],

        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle!,
            style: AppTextTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}