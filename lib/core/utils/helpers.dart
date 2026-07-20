import 'package:flutter/material.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/utils/helpers.dart
///
/// General helper methods.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display SnackBars.
/// • Hide keyboard.
/// • Show dialogs.
/// • Utility methods used across the application.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • All Screens
/// • Providers
/// • Services
/// ============================================================================
class AppHelpers {
  AppHelpers._();

  // ===========================================================================
  // Keyboard
  // ===========================================================================

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  // ===========================================================================
  // SnackBar
  // ===========================================================================

  static void showSnackBar(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  // ===========================================================================
  // Dialog
  // ===========================================================================

  static Future<void> showMessageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'OK',
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  // ===========================================================================
  // Bottom Sheet
  // ===========================================================================

  static Future<T?> showBottomSheetModal<T>(
    BuildContext context, {
    required Widget child,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (_) => child,
    );
  }

  // ===========================================================================
  // Loading Dialog
  // ===========================================================================

  static Future<void> showLoadingDialog(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  // ===========================================================================
  // Close Dialog
  // ===========================================================================

  static void closeDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}