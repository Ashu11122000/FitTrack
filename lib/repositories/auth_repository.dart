/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/repositories/auth_repository.dart
///
/// Authentication repository.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage user authentication.
/// • Persist authentication state.
/// • Handle login and logout.
/// • Restore previous authentication session.
/// • Keep authentication persistence separate from providers.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • AuthProvider
/// • Splash Screen
/// • Login Screen
/// • Future REST API integration
/// ============================================================================
library;

import '../services/preferences_service.dart';

/// SharedPreferences keys used by the authentication repository.
///
/// These are intentionally private because only the repository should
/// know how authentication data is stored.
const String _loggedInKey = 'auth_logged_in';
const String _userEmailKey = 'auth_user_email';

/// Repository responsible for authentication persistence.
///
/// Currently this repository provides an offline authentication layer
/// backed by SharedPreferences.
///
/// In future phases this class can be extended to authenticate against
/// Firebase or a REST API without affecting the Provider layer.
final class AuthRepository {
  /// Creates an [AuthRepository].
  const AuthRepository();

  /// Attempts to sign in a user.
  ///
  /// Returns `true` if the login succeeds.
  ///
  /// Phase 9 intentionally performs only local validation and session
  /// persistence. Remote authentication will be added in a future phase.
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final normalizedEmail = email.trim();

    if (normalizedEmail.isEmpty || password.isEmpty) {
      return false;
    }

    await PreferencesService.setBool(
      _loggedInKey,
      true,
    );

    await PreferencesService.setString(
      _userEmailKey,
      normalizedEmail,
    );

    return true;
  }

  /// Logs out the current user.
  Future<void> logout() async {
    await PreferencesService.remove(_loggedInKey);
    await PreferencesService.remove(_userEmailKey);
  }

  /// Returns whether the user is currently authenticated.
  Future<bool> isLoggedIn() async {
    return PreferencesService.getBool(
      _loggedInKey,
      defaultValue: false,
    );
  }

  /// Returns the persisted email address.
  ///
  /// Returns `null` if no authenticated session exists.
  Future<String?> getCurrentUserEmail() async {
    return PreferencesService.getString(
      _userEmailKey,
    );
  }

  /// Restores the previous authentication session.
  ///
  /// Returns `true` if a previous session exists.
  Future<bool> restoreSession() async {
    return isLoggedIn();
  }

  /// Clears every locally stored authentication value.
  ///
  /// Useful for development, account reset, and testing.
  Future<void> clearSession() async {
    await logout();
  }
}