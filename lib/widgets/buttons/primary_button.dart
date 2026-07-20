import 'package:flutter/material.dart';

import '../../core/constants/app_duration.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/buttons/primary_button.dart
///
/// A reusable primary button used throughout the application.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Loading state
/// • Icon support
/// • Full-width by default
/// • Disabled state
/// • Custom dimensions
/// • Smooth animations
/// • Accessible
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Login Screen
/// • Onboarding
/// • Home
/// • Workout
/// • Profile
/// • Settings
/// ============================================================================

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isExpanded = true,
    this.width,
    this.height = AppSizes.buttonMd,
  });

  /// Button label
  final String text;

  /// Button callback
  final VoidCallback? onPressed;

  /// Optional leading icon
  final IconData? icon;

  /// Shows loading indicator
  final bool isLoading;

  /// Expands to full width
  final bool isExpanded;

  /// Custom width
  final double? width;

  /// Custom height
  final double height;

  @override
  Widget build(BuildContext context) {
    final button = SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: AnimatedSwitcher(
          duration: AppDuration.fast,
          child: isLoading
              ? SizedBox(
                  key: const ValueKey('loading'),
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                )
              : Row(
                  key: const ValueKey('content'),
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        size: AppSizes.iconMd,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                    ],
                    Text(
                      text,
                      style: AppTextTheme.button,
                    ),
                  ],
                ),
        ),
      ),
    );

    if (isExpanded) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}