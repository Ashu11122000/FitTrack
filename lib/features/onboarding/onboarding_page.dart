import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/onboarding/onboarding_page.dart
///
/// Reusable onboarding page widget.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display onboarding illustration.
/// • Display page title.
/// • Display page description.
/// • Keep onboarding UI reusable.
/// • Adapt gracefully to different screen sizes.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • OnboardingScreen
/// ============================================================================
class OnboardingPage extends StatelessWidget {
  /// Creates an [OnboardingPage].
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  /// Illustration displayed on the page.
  final Widget image;

  /// Main heading.
  final String title;

  /// Supporting description.
  final String description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),

            // -----------------------------------------------------------------
            // Illustration
            // -----------------------------------------------------------------
            Expanded(
              flex: 5,
              child: Center(
                child: image,
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // -----------------------------------------------------------------
            // Title
            // -----------------------------------------------------------------
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextTheme.headlineMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // -----------------------------------------------------------------
            // Description
            // -----------------------------------------------------------------
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextTheme.bodyLarge.copyWith(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}