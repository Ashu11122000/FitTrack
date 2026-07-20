import 'package:flutter/material.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/services/navigation_service.dart
///
/// Global Navigation Service.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Perform navigation without BuildContext.
/// • Provide centralized navigation methods.
/// • Support named routes.
/// • Support navigation with arguments.
/// • Improve code reusability.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • AppTheme
/// • AppRoutes
/// • Providers
/// • ViewModels
/// • Services
/// ============================================================================

class NavigationService {
  NavigationService._();

  /// Global navigator key.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Current navigator state.
  static NavigatorState? get navigator => navigatorKey.currentState;

  /// Current build context.
  static BuildContext? get context => navigatorKey.currentContext;

  // ===========================================================================
  // Push
  // ===========================================================================

  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator!.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  // ===========================================================================
  // Push Replacement
  // ===========================================================================

  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigator!.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  // ===========================================================================
  // Push And Remove Until
  // ===========================================================================

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator!.pushNamedAndRemoveUntil<T>(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  // ===========================================================================
  // Pop
  // ===========================================================================

  static void pop<T extends Object?>([T? result]) {
    if (navigator?.canPop() ?? false) {
      navigator?.pop(result);
    }
  }

  // ===========================================================================
  // Can Pop
  // ===========================================================================

  static bool canPop() {
    return navigator?.canPop() ?? false;
  }

  // ===========================================================================
  // Pop Until
  // ===========================================================================

  static void popUntil(String routeName) {
    navigator?.popUntil(
      ModalRoute.withName(routeName),
    );
  }

  // ===========================================================================
  // Maybe Pop
  // ===========================================================================

  static Future<bool> maybePop<T extends Object?>([T? result]) {
    return navigator?.maybePop(result) ?? Future.value(false);
  }

  // ===========================================================================
  // Remove All Routes And Navigate
  // ===========================================================================

  static Future<T?> clearStackAndNavigate<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator!.pushNamedAndRemoveUntil<T>(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  // ===========================================================================
  // Replace Current Route
  // ===========================================================================

  static Future<T?> replaceWith<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }
}