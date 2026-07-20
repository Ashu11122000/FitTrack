import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/auth/login_screen.dart
///
/// Login screen.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display the application login UI.
/// • Compose the login header and login form.
/// • Provide a responsive, scrollable authentication layout.
/// • Follow Material Design 3 guidelines.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • App Routes
/// • SplashScreen
/// • OnboardingScreen
/// ============================================================================
class LoginScreen extends StatelessWidget {
  /// Creates a [LoginScreen].
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenHorizontal,
              vertical: AppSpacing.screenVertical,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 420,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  // -----------------------------------------------------------
                  // Header
                  // -----------------------------------------------------------
                  LoginHeader(),

                  SizedBox(
                    height: AppSpacing.massive,
                  ),

                  // -----------------------------------------------------------
                  // Login Form
                  // -----------------------------------------------------------
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}