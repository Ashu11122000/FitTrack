import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_shadows.dart';
import 'app_button_theme.dart';
import 'app_input_theme.dart';
import 'app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/theme/app_theme.dart
///
/// Centralized application theme.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Configure Material Design 3.
/// • Define the application's ThemeData.
/// • Register typography.
/// • Register button themes.
/// • Register input themes.
/// • Maintain a consistent UI across the app.
/// ============================================================================

class AppTheme {
  AppTheme._();

  /// ==========================================================================
  /// Light Theme
  /// ==========================================================================

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      colorScheme: colorScheme,

      scaffoldBackgroundColor: AppColors.background,

      primaryColor: AppColors.primary,

      // -----------------------------------------------------------------------
      // Typography
      // -----------------------------------------------------------------------

      textTheme: TextTheme(
        displayLarge: AppTextTheme.displayLarge,
        displayMedium: AppTextTheme.displayMedium,
        displaySmall: AppTextTheme.displaySmall,

        headlineLarge: AppTextTheme.headlineLarge,
        headlineMedium: AppTextTheme.headlineMedium,
        headlineSmall: AppTextTheme.headlineSmall,

        titleLarge: AppTextTheme.titleLarge,
        titleMedium: AppTextTheme.titleMedium,
        titleSmall: AppTextTheme.titleSmall,

        bodyLarge: AppTextTheme.bodyLarge,
        bodyMedium: AppTextTheme.bodyMedium,
        bodySmall: AppTextTheme.bodySmall,

        labelLarge: AppTextTheme.labelLarge,
        labelMedium: AppTextTheme.labelMedium,
        labelSmall: AppTextTheme.labelSmall,
      ),

      // -----------------------------------------------------------------------
      // App Bar
      // -----------------------------------------------------------------------

      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTextTheme.titleLarge,
        iconTheme: const IconThemeData(
          color: AppColors.textPrimary,
        ),
      ),

      // -----------------------------------------------------------------------
      // Cards
      // -----------------------------------------------------------------------

      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.card,
        ),
      ),

      // -----------------------------------------------------------------------
      // Divider
      // -----------------------------------------------------------------------

      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // -----------------------------------------------------------------------
      // Buttons
      // -----------------------------------------------------------------------

      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,

      outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,

      textButtonTheme: AppButtonTheme.textButtonTheme,

      // -----------------------------------------------------------------------
      // Inputs
      // -----------------------------------------------------------------------

      inputDecorationTheme: AppInputTheme.inputDecorationTheme,

      // -----------------------------------------------------------------------
      // Floating Action Button
      // -----------------------------------------------------------------------

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),

      // -----------------------------------------------------------------------
      // Bottom Navigation
      // -----------------------------------------------------------------------

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // -----------------------------------------------------------------------
      // Progress Indicator
      // -----------------------------------------------------------------------

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.grey200,
        circularTrackColor: AppColors.grey200,
      ),

      // -----------------------------------------------------------------------
      // Checkbox
      // -----------------------------------------------------------------------

      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.radiusSm,
        ),
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.white;
          },
        ),
      ),

      // -----------------------------------------------------------------------
      // Radio Button
      // -----------------------------------------------------------------------

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(
          AppColors.primary,
        ),
      ),

      // -----------------------------------------------------------------------
      // Switch
      // -----------------------------------------------------------------------

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.grey400;
          },
        ),
      ),

      // -----------------------------------------------------------------------
      // Dialog
      // -----------------------------------------------------------------------

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.radiusXl,
        ),
      ),

      // -----------------------------------------------------------------------
      // Snack Bar
      // -----------------------------------------------------------------------

      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.grey900,
        contentTextStyle: AppTextTheme.bodyMedium.copyWith(
          color: AppColors.white,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.radiusLg,
        ),
      ),

      // -----------------------------------------------------------------------
      // Splash Color
      // -----------------------------------------------------------------------

      splashColor: AppColors.primary.withOpacity(0.08),

      // -----------------------------------------------------------------------
      // Highlight
      // -----------------------------------------------------------------------

      highlightColor: Colors.transparent,

      // -----------------------------------------------------------------------
      // Shadow
      // -----------------------------------------------------------------------

      shadowColor: AppShadows.small.first.color,
    );
  }
}