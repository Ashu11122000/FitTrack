import 'package:flutter/material.dart';

import '../../core/constants/app_duration.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/buttons/secondary_button.dart
///
/// Reusable outlined button for secondary actions.
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
/// • Profile Screen
/// • Settings Screen
/// • Dialogs
/// • Bottom Sheets
/// ============================================================================

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
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

  /// Loading state
  final bool isLoading;

  /// Expand to full width
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
      child: OutlinedButton(
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
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
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
                      const SizedBox(
                        width: AppSpacing.sm,
                      ),
                    ],
                    Text(
                      text,
                      style: AppTextTheme.button.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
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