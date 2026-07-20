import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';
import '../buttons/primary_button.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/common/empty_state.dart
///
/// Reusable empty state widget.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Optional illustration/icon
/// • Title
/// • Description
/// • Optional action button
/// • Responsive layout
/// • Theme aware
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Workout Screen
/// • History Screen
/// • Progress Screen
/// • Search Results
/// • Notifications
/// • Favorites
/// ============================================================================

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.inbox_rounded,
    this.image,
    this.buttonText,
    this.onPressed,
    this.iconSize = 96,
  });

  /// Title
  final String title;

  /// Description
  final String message;

  /// Optional icon
  final IconData icon;

  /// Optional image asset
  final String? image;

  /// Button text
  final String? buttonText;

  /// Button callback
  final VoidCallback? onPressed;

  /// Icon size
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null)
              Image.asset(
                image!,
                width: AppSizes.imageMd,
                height: AppSizes.imageMd,
                fit: BoxFit.contain,
              )
            else
              Icon(
                icon,
                size: iconSize,
                color: colorScheme.primary.withOpacity(0.7),
              ),

            const SizedBox(height: AppSpacing.xxl),

            Text(
              title,
              style: AppTextTheme.titleLarge,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSpacing.md),

            Text(
              message,
              style: AppTextTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

            if (buttonText != null && onPressed != null) ...[
              const SizedBox(height: AppSpacing.xxl),
              PrimaryButton(
                text: buttonText!,
                onPressed: onPressed,
                isExpanded: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}