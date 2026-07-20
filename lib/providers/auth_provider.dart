/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/providers/auth_provider.dart
///
/// Authentication provider.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage authentication state.
/// • Expose login/logout functionality.
/// • Restore persisted session.
/// • Notify the UI of authentication changes.
/// • Keep business logic separate from presentation.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Login Screen
/// • Splash Screen
/// • App Routes
/// • Future Route Guards
/// ============================================================================
library;

import 'package:flutter/foundation.dart';

import '../repositories/auth_repository.dart';

/// Provider responsible for managing authentication state.
///
/// This provider communicates with [AuthRepository] and exposes
/// authentication information to the UI.
///
/// Business logic remains inside the repository while this provider
/// focuses on state management and notifying listeners.
final class AuthProvider extends ChangeNotifier {
  /// Creates an [AuthProvider].
  AuthProvider({
    AuthRepository? repository,
  }) : _repository = repository ?? const AuthRepository();

  final AuthRepository _repository;

  bool _isAuthenticated = false;
  bool _isLoading = false;
  String? _currentUserEmail;

  // ===========================================================================
  // Getters
  // ===========================================================================

  /// Returns whether the user is authenticated.
  bool get isAuthenticated => _isAuthenticated;

  /// Returns whether an authentication operation is in progress.
  bool get isLoading => _isLoading;

  /// Returns the authenticated user's email.
  String? get currentUserEmail => _currentUserEmail;

  // ===========================================================================
  // Initialization
  // ===========================================================================

  /// Restores the previous authentication session.
  Future<void> initialize() async {
    _setLoading(true);

    try {
      _isAuthenticated =
          await _repository.restoreSession();

      _currentUserEmail =
          await _repository.getCurrentUserEmail();
    } finally {
      _setLoading(false);

      notifyListeners();
    }
  }

  // ===========================================================================
  // Authentication
  // ===========================================================================

  /// Attempts to authenticate the user.
  ///
  /// Returns `true` when authentication succeeds.
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _setLoading(true);

    try {
      final success = await _repository.login(
        email: email,
        password: password,
      );

      if (!success) {
        return false;
      }

      _isAuthenticated = true;
      _currentUserEmail = email.trim();

      notifyListeners();

      return true;
    } finally {
      _setLoading(false);
    }
  }

  /// Logs out the authenticated user.
  Future<void> logout() async {
    _setLoading(true);

    try {
      await _repository.logout();

      _isAuthenticated = false;
      _currentUserEmail = null;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // ===========================================================================
  // Private Helpers
  // ===========================================================================

  void _setLoading(bool value) {
    if (_isLoading == value) {
      return;
    }

    _isLoading = value;
    notifyListeners();
  }
}