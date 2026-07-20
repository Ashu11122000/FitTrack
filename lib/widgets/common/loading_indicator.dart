import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_spacing.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/common/loading_indicator.dart
///
/// Reusable loading indicator.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Circular & Linear indicators
/// • Configurable size
/// • Configurable stroke width
/// • Optional loading message
/// • Centered by default
/// • Theme aware
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Splash Screen
/// • Login Screen
/// • Home Screen
/// • Workout Screen
/// • Profile Screen
/// • Settings Screen
/// ============================================================================

enum LoadingIndicatorType {
  circular,
  linear,
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.type = LoadingIndicatorType.circular,
    this.size = AppSizes.progressMedium,
    this.strokeWidth = 3,
    this.message,
    this.center = true,
  });

  /// Indicator type
  final LoadingIndicatorType type;

  /// Circular size
  final double size;

  /// Stroke width
  final double strokeWidth;

  /// Optional message
  final String? message;

  /// Center widget
  final bool center;

  @override
  Widget build(BuildContext context) {
    Widget indicator;

    switch (type) {
      case LoadingIndicatorType.linear:
        indicator = const LinearProgressIndicator();
        break;

      case LoadingIndicatorType.circular:
        indicator = SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth,
          ),
        );
        break;
    }

    Widget child;

    if (message == null || message!.isEmpty) {
      child = indicator;
    } else {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          indicator,
          const SizedBox(
            height: AppSpacing.lg,
          ),
          Text(
            message!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    if (center) {
      return Center(child: child);
    }

    return child;
  }
}