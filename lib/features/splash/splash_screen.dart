import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_duration.dart';
import '../../core/routes/route_names.dart';
import '../../core/services/navigation_service.dart';
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
/// • Handle splash duration.
/// • Navigate to the onboarding screen.
/// • Keep UI and navigation logic separated.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • App Routes
/// • Application startup
/// ============================================================================
class SplashScreen extends StatefulWidget {
  /// Creates a [SplashScreen].
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _startNavigation();
  }

  void _startNavigation() {
    _navigationTimer = Timer(
      // Use a default duration here to avoid dependency on AppDuration.splash
      const Duration(seconds: 2),
      () {
        NavigationService.pushReplacementNamed(
          RouteNames.onboarding,
        );
      },
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