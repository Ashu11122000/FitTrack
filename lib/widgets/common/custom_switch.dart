import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/common/custom_switch.dart
///
/// Reusable Material 3 switch widget.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Theme-aware
/// • Title & subtitle
/// • Optional leading icon
/// • Optional trailing widget
/// • Enabled/disabled state
/// • Entire tile is tappable
/// • Accessible
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Settings Screen
/// • Profile Screen
/// • Notifications
/// • Preferences
/// • Privacy Settings
/// ============================================================================

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.enabled = true,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
  });

  /// Current value
  final bool value;

  /// Change callback
  final ValueChanged<bool>? onChanged;

  /// Title
  final String title;

  /// Subtitle
  final String? subtitle;

  /// Leading widget
  final Widget? leading;

  /// Optional trailing widget
  final Widget? trailing;

  /// Enabled state
  final bool enabled;

  /// Tile padding
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: enabled && onChanged != null
            ? () => onChanged!(!value)
            : null,
        child: Padding(
          padding: contentPadding,
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: AppSpacing.lg),
              ],

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextTheme.titleMedium,
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

              if (trailing != null) ...[
                trailing!,
                const SizedBox(width: AppSpacing.sm),
              ],

              IgnorePointer(
                child: Switch(
                  value: value,
                  onChanged: enabled ? onChanged : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}