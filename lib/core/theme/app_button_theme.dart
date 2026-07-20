import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_sizes.dart';
import 'app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/theme/app_button_theme.dart
///
/// Centralized button themes for the application.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Configure Elevated Buttons
/// • Configure Filled Buttons
/// • Configure Outlined Buttons
/// • Configure Text Buttons
/// • Maintain consistent styling across the application
///
/// Used By
/// ----------------------------------------------------------------------------
/// • AppTheme
/// • All screens
/// • Reusable widgets
/// ============================================================================

class AppButtonTheme {
  AppButtonTheme._();

  // ===========================================================================
  // Elevated Button Theme
  // ===========================================================================

  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      disabledBackgroundColor: AppColors.grey300,
      disabledForegroundColor: AppColors.grey600,
      minimumSize: const Size(double.infinity, AppSizes.buttonMd),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      textStyle: AppTextTheme.button,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.button,
      ),
    ),
  );

  // ===========================================================================
  // Filled Button Theme
  // ===========================================================================

  static final FilledButtonThemeData filledButtonTheme =
      FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      disabledBackgroundColor: AppColors.grey300,
      disabledForegroundColor: AppColors.grey600,
      minimumSize: const Size(double.infinity, AppSizes.buttonMd),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      textStyle: AppTextTheme.button,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.button,
      ),
    ),
  );

  // ===========================================================================
  // Outlined Button Theme
  // ===========================================================================

  static final OutlinedButtonThemeData outlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: const BorderSide(
        color: AppColors.primary,
        width: 1.5,
      ),
      minimumSize: const Size(double.infinity, AppSizes.buttonMd),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      textStyle: AppTextTheme.button.copyWith(
        color: AppColors.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.button,
      ),
    ),
  );

  // ===========================================================================
  // Text Button Theme
  // ===========================================================================

  static final TextButtonThemeData textButtonTheme =
      TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      minimumSize: const Size(0, AppSizes.buttonMd),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      textStyle: AppTextTheme.button.copyWith(
        color: AppColors.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.button,
      ),
    ),
  );

  // ===========================================================================
  // Icon Button Theme
  // ===========================================================================

  static final IconButtonThemeData iconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: AppColors.primary,
      backgroundColor: Colors.transparent,
      iconSize: AppSizes.iconLg,
      padding: const EdgeInsets.all(8),
    ),
  );
}