/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/services/preferences_service.dart
///
/// Centralized SharedPreferences service.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Initialize SharedPreferences.
/// • Provide strongly typed read/write methods.
/// • Persist lightweight application preferences.
/// • Keep SharedPreferences logic out of repositories and providers.
/// • Provide helper methods for removing and clearing preferences.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • ThemeService
/// • AuthRepository
/// • SettingsRepository
/// • AuthProvider
/// • ThemeProvider
/// • SettingsProvider
/// ============================================================================
library;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A centralized service for managing lightweight persistent preferences.
///
/// This service should be initialized once during application startup before
/// any repositories or providers attempt to access SharedPreferences.
final class PreferencesService {
  PreferencesService._();

  static SharedPreferences? _preferences;

  /// Initializes the SharedPreferences instance.
  ///
  /// Safe to call multiple times.
  static Future<void> initialize() async {
    if (_preferences != null) {
      return;
    }

    try {
      _preferences = await SharedPreferences.getInstance();

      debugPrint('[Preferences] Initialization completed.');
    } catch (error, stackTrace) {
      debugPrint('[Preferences] Initialization failed.');
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());

      rethrow;
    }
  }

  /// Returns the initialized SharedPreferences instance.
  static SharedPreferences get instance {
    final preferences = _preferences;

    if (preferences == null) {
      throw StateError(
        'PreferencesService has not been initialized.\n'
        'Call PreferencesService.initialize() first.',
      );
    }

    return preferences;
  }

  // ===========================================================================
  // String
  // ===========================================================================

  static Future<bool> setString(String key, String value) {
    return instance.setString(key, value);
  }

  static String? getString(String key) {
    return instance.getString(key);
  }

  // ===========================================================================
  // Bool
  // ===========================================================================

  static Future<bool> setBool(String key, bool value) {
    return instance.setBool(key, value);
  }

  static bool getBool(
    String key, {
    bool defaultValue = false,
  }) {
    return instance.getBool(key) ?? defaultValue;
  }

  // ===========================================================================
  // Integer
  // ===========================================================================

  static Future<bool> setInt(String key, int value) {
    return instance.setInt(key, value);
  }

  static int getInt(
    String key, {
    int defaultValue = 0,
  }) {
    return instance.getInt(key) ?? defaultValue;
  }

  // ===========================================================================
  // Double
  // ===========================================================================

  static Future<bool> setDouble(String key, double value) {
    return instance.setDouble(key, value);
  }

  static double getDouble(
    String key, {
    double defaultValue = 0.0,
  }) {
    return instance.getDouble(key) ?? defaultValue;
  }

  // ===========================================================================
  // String List
  // ===========================================================================

  static Future<bool> setStringList(
    String key,
    List<String> value,
  ) {
    return instance.setStringList(key, value);
  }

  static List<String> getStringList(String key) {
    return instance.getStringList(key) ?? <String>[];
  }

  // ===========================================================================
  // Generic Operations
  // ===========================================================================

  /// Returns whether the specified key exists.
  static bool containsKey(String key) {
    return instance.containsKey(key);
  }

  /// Removes a stored preference.
  static Future<bool> remove(String key) {
    return instance.remove(key);
  }

  /// Clears every stored preference.
  static Future<bool> clear() {
    return instance.clear();
  }

  /// Reloads preferences from disk.
  static Future<void> reload() {
    return instance.reload();
  }

  /// Returns every stored preference key.
  static Set<String> getKeys() {
    return instance.getKeys();
  }

  /// Returns whether the service has been initialized.
  static bool get isInitialized => _preferences != null;
}