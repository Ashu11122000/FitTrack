import 'package:flutter/material.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../splash/widgets/splash_logo.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/auth/widgets/login_header.dart
///
/// Login screen header.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display the FitTrack branding.
/// • Display welcome title.
/// • Display login subtitle.
/// • Reuse the SplashLogo widget.
/// • Maintain consistent spacing and typography.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • LoginScreen
/// ============================================================================
class LoginHeader extends StatelessWidget {
  /// Creates a [LoginHeader].
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------------------------------------------------------------------
        // Logo
        // ---------------------------------------------------------------------
        const SplashLogo(),

        const SizedBox(
          height: AppSpacing.xxl,
        ),

        // ---------------------------------------------------------------------
        // Welcome Title
        // ---------------------------------------------------------------------
        Text(
          AppStrings.login,
          textAlign: TextAlign.center,
          style: AppTextTheme.headlineLarge,
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        // ---------------------------------------------------------------------
        // Subtitle
        // ---------------------------------------------------------------------
        Text(
          'Welcome back! Sign in to continue your fitness journey.',
          textAlign: TextAlign.center,
          style: AppTextTheme.bodyMedium,
        ),
      ],
    );
  }
}