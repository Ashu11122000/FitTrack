/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/repositories/user_repository.dart
///
/// User repository.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage user profile persistence.
/// • Read and write user information.
/// • Update user profile.
/// • Delete user profile.
/// • Keep data persistence separate from providers.
/// • Prepare for future REST API integration.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • UserProvider
/// • Home Screen
/// • Profile Screen
/// • Settings Screen
/// • Future Cloud Synchronization
/// ============================================================================
library;

import 'package:hive/hive.dart';

import '../models/user.dart';
import '../services/hive_service.dart';
import '../storage/hive_boxes.dart';

/// Repository responsible for user profile persistence.
///
/// This repository currently stores user data locally using Hive.
///
/// In future phases this repository can be extended to synchronize
/// with Firebase or a REST API without affecting the Provider layer.
final class UserRepository {
  /// Creates a [UserRepository].
  const UserRepository();

  /// Returns the application's user box.
  Box<dynamic> get _box => HiveService.box<dynamic>(HiveBoxes.user);

  // ===========================================================================
  // Create / Update
  // ===========================================================================

  /// Saves a user profile.
  ///
  /// If a user with the same id already exists,
  /// it will be replaced.
  Future<void> saveUser(User user) async {
    await _box.put(user.id, user.toJson());
  }

  /// Updates an existing user.
  Future<void> updateUser(User user) async {
    await saveUser(user);
  }

  // ===========================================================================
  // Read
  // ===========================================================================

  /// Returns the user with the given id.
  ///
  /// Returns `null` if no matching user exists.
  Future<User?> getUser(String id) async {
    final dynamic data = _box.get(id);

    if (data == null) {
      return null;
    }

    if (data is Map) {
      return User.fromJson(
        Map<String, dynamic>.from(data),
      );
    }

    return null;
  }

  /// Returns the first stored user.
  ///
  /// FitTrack currently supports a single local user profile.
  Future<User?> getCurrentUser() async {
    if (_box.isEmpty) {
      return null;
    }

    final dynamic data = _box.values.first;

    if (data is Map) {
      return User.fromJson(
        Map<String, dynamic>.from(data),
      );
    }

    return null;
  }

  /// Returns whether a user profile exists.
  Future<bool> hasUser() async {
    return _box.isNotEmpty;
  }

  // ===========================================================================
  // Delete
  // ===========================================================================

  /// Deletes a user by id.
  Future<void> deleteUser(String id) async {
    await _box.delete(id);
  }

  /// Removes every stored user profile.
  Future<void> clearUsers() async {
    await _box.clear();
  }

  // ===========================================================================
  // Utility
  // ===========================================================================

  /// Returns every stored user.
  ///
  /// Currently FitTrack supports a single user, but this
  /// method prepares the repository for future expansion.
  Future<List<User>> getAllUsers() async {
    return _box.values
        .whereType<Map>()
        .map(
          (dynamic json) => User.fromJson(
            Map<String, dynamic>.from(json as Map),
          ),
        )
        .toList();
  }

  /// Returns the total number of stored users.
  Future<int> userCount() async {
    return _box.length;
  }

  /// Returns whether a specific user exists.
  Future<bool> exists(String id) async {
    return _box.containsKey(id);
  }
}