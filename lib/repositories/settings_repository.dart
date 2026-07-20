/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/repositories/settings_repository.dart
///
/// Application settings repository.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage application settings.
/// • Persist user preferences.
/// • Handle theme settings.
/// • Handle notification settings.
/// • Handle language settings.
/// • Keep persistence logic separate from providers.
/// • Prepare for future REST API integration.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • SettingsProvider
/// • ThemeProvider
/// • Settings Screen
/// • main.dart
/// • Future Cloud Synchronization
/// ============================================================================
library;

import 'package:flutter/material.dart';

import '../services/preferences_service.dart';
import '../services/theme_service.dart';

/// Preference keys used by the repository.
const String _languageKey = 'language';
const String _notificationsEnabledKey = 'notifications_enabled';
const String _reminderEnabledKey = 'reminder_enabled';
const String _reminderTimeKey = 'reminder_time';
const String _onboardingCompletedKey = 'onboarding_completed';

/// Repository responsible for application settings persistence.
///
/// This repository stores lightweight settings using
/// [PreferencesService].
///
/// In future phases it can synchronize settings with
/// a backend service without affecting the Provider layer.
final class SettingsRepository {
  /// Creates a [SettingsRepository].
  const SettingsRepository();

  // ===========================================================================
  // Theme
  // ===========================================================================

  /// Saves the selected theme mode.
  Future<void> saveThemeMode(
    ThemeMode themeMode,
  ) async {
    await ThemeService.saveThemeMode(themeMode);
  }

  /// Returns the saved theme mode.
  Future<ThemeMode> getThemeMode() async {
    return ThemeService.getThemeMode();
  }

  /// Resets the theme preference.
  Future<void> resetTheme() async {
    await ThemeService.resetTheme();
  }

  // ===========================================================================
  // Language
  // ===========================================================================

  /// Saves the selected language.
  Future<void> saveLanguage(
    String language,
  ) async {
    await PreferencesService.setString(
      _languageKey,
      language,
    );
  }

  /// Returns the selected language.
  ///
  /// Defaults to English.
  Future<String> getLanguage() async {
    return PreferencesService.getString(
          _languageKey,
        ) ??
        'en';
  }

  // ===========================================================================
  // Notifications
  // ===========================================================================

  /// Enables or disables notifications.
  Future<void> setNotificationsEnabled(
    bool enabled,
  ) async {
    await PreferencesService.setBool(
      _notificationsEnabledKey,
      enabled,
    );
  }

  /// Returns whether notifications are enabled.
  Future<bool> notificationsEnabled() async {
    return PreferencesService.getBool(
      _notificationsEnabledKey,
      defaultValue: true,
    );
  }

  // ===========================================================================
  // Reminder
  // ===========================================================================

  /// Enables or disables workout reminders.
  Future<void> setReminderEnabled(
    bool enabled,
  ) async {
    await PreferencesService.setBool(
      _reminderEnabledKey,
      enabled,
    );
  }

  /// Returns whether reminders are enabled.
  Future<bool> reminderEnabled() async {
    return PreferencesService.getBool(
      _reminderEnabledKey,
      defaultValue: false,
    );
  }

  /// Saves the reminder time.
  ///
  /// Example:
  /// • 08:00
  /// • 18:30
  Future<void> saveReminderTime(
    String time,
  ) async {
    await PreferencesService.setString(
      _reminderTimeKey,
      time,
    );
  }

  /// Returns the reminder time.
  Future<String> getReminderTime() async {
    return PreferencesService.getString(
          _reminderTimeKey,
        ) ??
        '08:00';
  }

  // ===========================================================================
  // Onboarding
  // ===========================================================================

  /// Marks onboarding as completed.
  Future<void> setOnboardingCompleted(
    bool completed,
  ) async {
    await PreferencesService.setBool(
      _onboardingCompletedKey,
      completed,
    );
  }

  /// Returns whether onboarding has been completed.
  Future<bool> isOnboardingCompleted() async {
    return PreferencesService.getBool(
      _onboardingCompletedKey,
      defaultValue: false,
    );
  }

  // ===========================================================================
  // Reset
  // ===========================================================================

  /// Clears every stored application setting.
  ///
  /// Authentication and Hive data are intentionally
  /// not affected.
  Future<void> resetSettings() async {
    await resetTheme();

    await PreferencesService.remove(
      _languageKey,
    );

    await PreferencesService.remove(
      _notificationsEnabledKey,
    );

    await PreferencesService.remove(
      _reminderEnabledKey,
    );

    await PreferencesService.remove(
      _reminderTimeKey,
    );

    await PreferencesService.remove(
      _onboardingCompletedKey,
    );
  }
}