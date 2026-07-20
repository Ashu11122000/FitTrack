import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_duration.dart';
import '../../core/routes/route_names.dart';
import '../../core/services/navigation_service.dart';
import '../../providers/auth_provider.dart';
import '../../providers/settings_provider.dart';
import 'widgets/splash_body.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/splash/splash_screen.dart
///
/// Production-ready splash screen.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display the FitTrack splash experience.
/// • Initialize application startup flow.
/// • Check onboarding status.
/// • Check authentication status.
/// • Navigate to the correct screen.
/// • Keep UI and business logic separated.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • App Routes
/// • Application startup
/// ============================================================================
class SplashScreen extends StatefulWidget {
  /// Creates a [SplashScreen].
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

    _navigationTimer = Timer(
      AppDuration.medium,
      _initializeApplication,
    );
  }

  Future<void> _initializeApplication() async {
    if (!mounted) {
      return;
    }

    final settingsProvider =
        context.read<SettingsProvider>();

    final authProvider =
        context.read<AuthProvider>();

    final onboardingCompleted =
        settingsProvider.onboardingCompleted;

    final authenticated =
        authProvider.isAuthenticated;

    if (!mounted) {
      return;
    }

    if (!onboardingCompleted) {
      NavigationService.pushReplacementNamed(
        RouteNames.onboarding,
      );
      return;
    }

    if (!authenticated) {
      NavigationService.pushReplacementNamed(
        RouteNames.login,
      );
      return;
    }

    NavigationService.pushReplacementNamed(
      RouteNames.home,
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SplashBody(),
      ),
    );
  }
}