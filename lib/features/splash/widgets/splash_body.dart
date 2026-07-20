import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_theme.dart';
import 'splash_logo.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/splash/widgets/splash_body.dart
///
/// Splash screen content.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display the splash animation.
/// • Display FitTrack branding.
/// • Display application name and tagline.
/// • Keep the splash UI modular and reusable.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • SplashScreen
/// ============================================================================
class SplashBody extends StatelessWidget {
  /// Creates a [SplashBody].
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              const Spacer(),

              // -----------------------------------------------------------------
              // Splash Animation
              // -----------------------------------------------------------------
              Expanded(
                flex: 5,
                child: Center(
                  child: Lottie.asset(
                    AppAssets.splashAnimation,
                    repeat: true,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // -----------------------------------------------------------------
              // App Branding
              // -----------------------------------------------------------------
              const SplashLogo(),

              const SizedBox(height: AppSpacing.lg),

              Text(
                AppStrings.appName,
                style: AppTextTheme.displaySmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.sm),

              Text(
                AppStrings.appTagline,
                style: AppTextTheme.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              // -----------------------------------------------------------------
              // Loading Indicator
              // -----------------------------------------------------------------
              const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),

              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}