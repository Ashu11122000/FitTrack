/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/constants/app_radius.dart
///
/// Centralized border radius values used throughout the application.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Define reusable border radius values.
/// • Maintain consistent rounded corners.
/// • Avoid hardcoded radius values.
/// • Follow Material Design 3 guidelines.
/// ============================================================================

import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  // ===========================================================================
  // Radius Values
  // ===========================================================================

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double pill = 40.0;
  static const double circular = 999.0;

  // ===========================================================================
  // BorderRadius
  // ===========================================================================

  static const BorderRadius radiusXs =
      BorderRadius.all(Radius.circular(xs));

  static const BorderRadius radiusSm =
      BorderRadius.all(Radius.circular(sm));

  static const BorderRadius radiusMd =
      BorderRadius.all(Radius.circular(md));

  static const BorderRadius radiusLg =
      BorderRadius.all(Radius.circular(lg));

  static const BorderRadius radiusXl =
      BorderRadius.all(Radius.circular(xl));

  static const BorderRadius radiusXxl =
      BorderRadius.all(Radius.circular(xxl));

  static const BorderRadius radiusXxxl =
      BorderRadius.all(Radius.circular(xxxl));

  static const BorderRadius radiusPill =
      BorderRadius.all(Radius.circular(pill));

  static const BorderRadius radiusCircular =
      BorderRadius.all(Radius.circular(circular));

  // ===========================================================================
  // Component Specific Radius
  // ===========================================================================

  static const BorderRadius button = radiusLg;

  static const BorderRadius card = radiusXl;

  static const BorderRadius dialog = radiusXxl;

  static const BorderRadius input = radiusMd;

  static const BorderRadius bottomSheet = BorderRadius.vertical(
    top: Radius.circular(xxl),
  );

  static const BorderRadius appBar = BorderRadius.vertical(
    bottom: Radius.circular(lg),
  );
}