import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/splash/widgets/splash_logo.dart
///
/// Reusable FitTrack application logo.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display the FitTrack logo.
/// • Encapsulate branding into a reusable widget.
/// • Maintain consistent logo sizing throughout the application.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • SplashBody
/// • Onboarding Screen
/// • Login Screen
/// • Profile Screen
/// ============================================================================
class SplashLogo extends StatelessWidget {
  /// Creates a [SplashLogo].
  const SplashLogo({
    super.key,
    this.size = 120.0,
    this.color,
  });

  /// Size of the logo.
  final double size;

  /// Optional color filter for the SVG logo.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.asset(
        AppAssets.appLogo,
        fit: BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
      ),
    );
  }
}