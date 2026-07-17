import 'package:flutter/material.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/constants/app_colors.dart
///
/// Centralized color palette for the entire application.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Store all application colors in one place.
/// • Maintain consistent branding.
/// • Support Material 3 design.
/// • Prevent hardcoded colors throughout the project.
///
/// Usage
/// ----------------------------------------------------------------------------
/// Container(
///   color: AppColors.primary,
/// )
///
/// Text(
///   'FitTrack',
///   style: TextStyle(color: AppColors.textPrimary),
/// )
/// ============================================================================

class AppColors {
  AppColors._();

  // ===========================================================================
  // Brand Colors
  // ===========================================================================

  static const Color primary = Color(0xFF4CAF50);
  static const Color secondary = Color(0xFF2196F3);
  static const Color accent = Color(0xFFFF9800);

  // ===========================================================================
  // Background Colors
  // ===========================================================================

  static const Color background = Color(0xFFF7F9FC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);

  // ===========================================================================
  // Status Colors
  // ===========================================================================

  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF2196F3);

  // ===========================================================================
  // Text Colors
  // ===========================================================================

  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color textLight = Color(0xFFFFFFFF);

  // ===========================================================================
  // Border & Divider
  // ===========================================================================

  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFE0E0E0);

  // ===========================================================================
  // Neutral Colors
  // ===========================================================================

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // ===========================================================================
  // Workout Colors
  // ===========================================================================

  static const Color calories = Color(0xFFFF7043);
  static const Color steps = Color(0xFF42A5F5);
  static const Color heartRate = Color(0xFFEF5350);
  static const Color workout = Color(0xFF66BB6A);
  static const Color water = Color(0xFF29B6F6);
  static const Color sleep = Color(0xFF7E57C2);
}