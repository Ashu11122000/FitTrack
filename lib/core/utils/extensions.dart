import 'package:flutter/material.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/utils/extensions.dart
///
/// Common Dart and Flutter extensions.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Improve code readability.
/// • Reduce duplicated utility code.
/// • Provide reusable helper extensions.
/// • Follow Effective Dart guidelines.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • All Screens
/// • Widgets
/// • Providers
/// ============================================================================
extension BuildContextExtension on BuildContext {
  /// Theme
  ThemeData get theme => Theme.of(this);

  /// Color Scheme
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Text Theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Screen Size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Screen Width
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Screen Height
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Keyboard Visible
  bool get isKeyboardVisible =>
      MediaQuery.viewInsetsOf(this).bottom > 0;
}

extension StringExtension on String {
  /// Returns true if the string is a valid email.
  bool get isEmail {
    final regex = RegExp(
      r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    return regex.hasMatch(trim());
  }

  /// Capitalizes the first letter.
  String get capitalize {
    if (isEmpty) return this;

    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalizes every word.
  String get capitalizeWords {
    return split(' ')
        .map(
          (word) => word.capitalize,
        )
        .join(' ');
  }
}

extension NumExtension on num {
  /// Vertical Space
  SizedBox get heightBox => SizedBox(
        height: toDouble(),
      );

  /// Horizontal Space
  SizedBox get widthBox => SizedBox(
        width: toDouble(),
      );
}

extension DurationExtension on int {
  /// Milliseconds
  Duration get milliseconds =>
      Duration(milliseconds: this);

  /// Seconds
  Duration get seconds =>
      Duration(seconds: this);

  /// Minutes
  Duration get minutes =>
      Duration(minutes: this);
}