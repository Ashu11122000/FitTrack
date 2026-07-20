import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/navigation/custom_app_bar.dart
///
/// Reusable Material 3 AppBar.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Theme aware
/// • Automatic back button
/// • Optional leading widget
/// • Optional actions
/// • Center title support
/// • Bottom widget support
/// • Configurable elevation
/// • PreferredSizeWidget implementation
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Workout Screen
/// • Profile Screen
/// • Progress Screen
/// • Settings Screen
/// ============================================================================

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.centerTitle = true,
    this.showBackButton = false,
    this.elevation = 0,
    this.backgroundColor,
  });

  /// App bar title
  final String title;

  /// Leading widget
  final Widget? leading;

  /// Action widgets
  final List<Widget>? actions;

  /// Bottom widget
  final PreferredSizeWidget? bottom;

  /// Center title
  final bool centerTitle;

  /// Show default back button
  final bool showBackButton;

  /// Elevation
  final double elevation;

  /// Background color
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);

    return AppBar(
      automaticallyImplyLeading: false,

      backgroundColor: backgroundColor,

      elevation: elevation,

      centerTitle: centerTitle,

      title: Text(
        title,
        style: AppTextTheme.titleLarge,
      ),

      leading: leading ??
          (showBackButton && canPop
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null),

      actions: actions == null
          ? null
          : [
              ...actions!,
              const SizedBox(width: AppSpacing.sm),
            ],

      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(
        kToolbarHeight +
            (bottom?.preferredSize.height ?? 0),
      );
}