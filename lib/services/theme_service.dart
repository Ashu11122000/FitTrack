/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/services/theme_service.dart
///
/// Centralized theme persistence service.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Persist the application's theme mode.
/// • Retrieve the previously selected theme.
/// • Reset theme preferences.
/// • Keep SharedPreferences logic out of providers.
/// • Prepare for future application settings expansion.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • ThemeProvider
/// • main.dart
/// • Settings Screen
/// ============================================================================
library;

import 'package:flutter/material.dart';

import 'preferences_service.dart';

/// SharedPreferences key used to store the selected theme mode.
///
/// Keeping it private prevents accidental use outside this service.
const String _themeModeKey = 'theme_mode';

/// A centralized service responsible for persisting and retrieving
/// the application's theme preference.
///
/// This service depends on [PreferencesService] and should only be used
/// after [PreferencesService.initialize()] has completed.
final class ThemeService {
  ThemeService._();

  /// Saves the selected [ThemeMode].
  static Future<void> saveThemeMode(ThemeMode themeMode) async {
    await PreferencesService.setString(
      _themeModeKey,
      themeMode.name,
    );
  }

  /// Returns the persisted [ThemeMode].
  ///
  /// Defaults to [ThemeMode.system] if no preference has been stored.
  static ThemeMode getThemeMode() {
    final String? storedTheme =
        PreferencesService.getString(_themeModeKey);

    if (storedTheme == null) {
      return ThemeMode.system;
    }

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == storedTheme,
      orElse: () => ThemeMode.system,
    );
  }

  /// Returns whether Dark Mode is currently selected.
  static bool get isDarkMode =>
      getThemeMode() == ThemeMode.dark;

  /// Returns whether Light Mode is currently selected.
  static bool get isLightMode =>
      getThemeMode() == ThemeMode.light;

  /// Returns whether System Theme is currently selected.
  static bool get isSystemMode =>
      getThemeMode() == ThemeMode.system;

  /// Removes the stored theme preference.
  ///
  /// The application will fall back to [ThemeMode.system].
  static Future<void> resetTheme() async {
    await PreferencesService.remove(_themeModeKey);
  }

  /// Toggles between Light and Dark themes.
  ///
  /// If the current theme is System, it switches to Light.
  static Future<ThemeMode> toggleTheme() async {
    final ThemeMode currentTheme = getThemeMode();

    final ThemeMode newTheme = switch (currentTheme) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.light,
    };

    await saveThemeMode(newTheme);

    return newTheme;
  }
}