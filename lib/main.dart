/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/main.dart
///
/// Entry point of the FitTrack application.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Initialize Flutter bindings.
/// • Configure the application theme.
/// • Configure MaterialApp.
/// • Configure routing.
/// • Launch the FitTrack application.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Flutter Engine
/// ============================================================================
library;

import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/route_names.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const FitTrackApp(),
  );
}

/// Root application widget.
final class FitTrackApp extends StatelessWidget {
  /// Creates the root application.
  const FitTrackApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'FitTrack',

      theme: AppTheme.lightTheme,

      initialRoute: RouteNames.initial,

      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}