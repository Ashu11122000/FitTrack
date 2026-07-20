/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/providers/user_provider.dart
///
/// User provider.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage the current user's profile state.
/// • Load and persist user information.
/// • Update user profile.
/// • Delete user profile.
/// • Notify the UI when profile data changes.
/// • Keep presentation logic separate from persistence.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Profile Screen
/// • Settings Screen
/// • UserRepository
/// ============================================================================
library;

import 'package:flutter/foundation.dart';

import '../models/user.dart';
import '../repositories/user_repository.dart';

/// Provider responsible for managing the application's user profile.
///
/// This provider communicates with [UserRepository] while exposing
/// reactive state to the presentation layer.
///
/// Persistence remains inside the repository, while this provider
/// focuses on state management and UI notifications.
final class UserProvider extends ChangeNotifier {
  /// Creates a [UserProvider].
  UserProvider({
    UserRepository? repository,
  }) : _repository = repository ?? const UserRepository();

  final UserRepository _repository;

  User? _user;
  bool _isLoading = false;

  // ===========================================================================
  // Getters
  // ===========================================================================

  /// Returns the current user.
  User? get user => _user;

  /// Returns whether user data is currently loading.
  bool get isLoading => _isLoading;

  /// Returns whether a user profile exists.
  bool get hasUser => _user != null;

  // ===========================================================================
  // Initialization
  // ===========================================================================

  /// Loads the persisted user profile.
  Future<void> initialize() async {
    _setLoading(true);

    try {
      _user = await _repository.getCurrentUser();
    } finally {
      _setLoading(false);

      notifyListeners();
    }
  }

  // ===========================================================================
  // CRUD Operations
  // ===========================================================================

  /// Saves a new user profile.
  Future<void> saveUser(User user) async {
    _setLoading(true);

    try {
      await _repository.saveUser(user);

      _user = user;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Updates the current user profile.
  Future<void> updateUser(User user) async {
    _setLoading(true);

    try {
      await _repository.updateUser(user);

      _user = user;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Deletes the current user profile.
  Future<void> deleteUser() async {
    if (_user == null) {
      return;
    }

    _setLoading(true);

    try {
      await _repository.deleteUser(_user!.id);

      _user = null;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Reloads the current user profile from storage.
  Future<void> refresh() async {
    await initialize();
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