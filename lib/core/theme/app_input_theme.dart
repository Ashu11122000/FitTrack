import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';
import 'app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/theme/app_input_theme.dart
///
/// Centralized InputDecorationTheme.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Configure all TextField decorations
/// • Configure borders
/// • Configure label styles
/// • Configure hint styles
/// • Configure error styles
/// • Maintain consistent form styling
///
/// Used By
/// ----------------------------------------------------------------------------
/// • AppTheme
/// • Login Screen
/// • Profile Screen
/// • Settings Screen
/// • Reusable Input Widgets
/// ============================================================================

class AppInputTheme {
  AppInputTheme._();

  // ===========================================================================
  // Input Decoration Theme
  // ===========================================================================

  static final InputDecorationTheme inputDecorationTheme =
      InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surface,

    isDense: true,

    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.inputHorizontal,
      vertical: AppSpacing.inputVertical,
    ),

    hintStyle: AppTextTheme.bodyMedium.copyWith(
      color: AppColors.textHint,
    ),

    labelStyle: AppTextTheme.bodyMedium.copyWith(
      color: AppColors.textSecondary,
    ),

    floatingLabelStyle: AppTextTheme.bodyMedium.copyWith(
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
    ),

    helperStyle: AppTextTheme.bodySmall.copyWith(
      color: AppColors.textSecondary,
    ),

    errorStyle: AppTextTheme.bodySmall.copyWith(
      color: AppColors.error,
    ),

    prefixIconColor: AppColors.textSecondary,
    suffixIconColor: AppColors.textSecondary,

    enabledBorder: OutlineInputBorder(
      borderRadius: AppRadius.input,
      borderSide: const BorderSide(
        color: AppColors.border,
        width: 1,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: AppRadius.input,
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: 2,
      ),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: AppRadius.input,
      borderSide: const BorderSide(
        color: AppColors.error,
        width: 1.5,
      ),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppRadius.input,
      borderSide: const BorderSide(
        color: AppColors.error,
        width: 2,
      ),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: AppRadius.input,
      borderSide: const BorderSide(
        color: AppColors.grey300,
      ),
    ),
  );
}