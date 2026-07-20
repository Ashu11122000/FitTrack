import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/common/section_title.dart
///
/// Reusable section header widget.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Optional subtitle
/// • Optional trailing action
/// • Optional leading icon
/// • Theme aware
/// • Responsive
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Workout Screen
/// • History Screen
/// • Progress Screen
/// • Profile Screen
/// ============================================================================

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actionText,
    this.onActionPressed,
    this.padding,
  });

  /// Main title
  final String title;

  /// Optional subtitle
  final String? subtitle;

  /// Optional leading widget
  final Widget? leading;

  /// Optional trailing action text
  final String? actionText;

  /// Action callback
  final VoidCallback? onActionPressed;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: AppSpacing.md,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: AppSpacing.md),
          ],

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextTheme.titleLarge,
                ),

                if (subtitle != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    subtitle!,
                    style: AppTextTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ),

          if (actionText != null)
            TextButton(
              onPressed: onActionPressed,
              child: Text(actionText!),
            ),
        ],
      ),
    );
  }
}