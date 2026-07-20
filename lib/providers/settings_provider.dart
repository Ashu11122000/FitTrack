/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/providers/settings_provider.dart
///
/// Application settings provider.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Manage application settings state.
/// • Persist user preferences.
/// • Manage notification settings.
/// • Manage reminder settings.
/// • Manage language settings.
/// • Manage onboarding state.
/// • Notify the UI when settings change.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Settings Screen
/// • Home Screen
/// • main.dart
/// • SettingsRepository
/// ============================================================================
library;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../repositories/settings_repository.dart';

/// Provider responsible for managing application settings.
///
/// This provider communicates with [SettingsRepository] while exposing
/// reactive settings to the presentation layer.
///
/// Persistence remains inside the repository while this provider
/// focuses on state management and notifying listeners.
final class SettingsProvider extends ChangeNotifier {
  /// Creates a [SettingsProvider].
  SettingsProvider({
    SettingsRepository? repository,
  }) : _repository = repository ?? const SettingsRepository();

  final SettingsRepository _repository;

  ThemeMode _themeMode = ThemeMode.system;
  String _language = 'en';
  bool _notificationsEnabled = true;
  bool _reminderEnabled = false;
  String _reminderTime = '08:00';
  bool _onboardingCompleted = false;
  bool _isLoading = false;

  // ===========================================================================
  // Getters
  // ===========================================================================

  /// Returns the selected theme mode.
  ThemeMode get themeMode => _themeMode;

  /// Returns the selected language.
  String get language => _language;

  /// Returns whether notifications are enabled.
  bool get notificationsEnabled => _notificationsEnabled;

  /// Returns whether workout reminders are enabled.
  bool get reminderEnabled => _reminderEnabled;

  /// Returns the reminder time.
  String get reminderTime => _reminderTime;

  /// Returns whether onboarding has been completed.
  bool get onboardingCompleted => _onboardingCompleted;

  /// Returns whether settings are currently loading.
  bool get isLoading => _isLoading;

  // ===========================================================================
  // Initialization
  // ===========================================================================

  /// Loads all persisted settings.
  Future<void> initialize() async {
    _setLoading(true);

    try {
      _themeMode = await _repository.getThemeMode();
      _language = await _repository.getLanguage();
      _notificationsEnabled =
          await _repository.notificationsEnabled();
      _reminderEnabled =
          await _repository.reminderEnabled();
      _reminderTime =
          await _repository.getReminderTime();
      _onboardingCompleted =
          await _repository.isOnboardingCompleted();
    } finally {
      _setLoading(false);

      notifyListeners();
    }
  }

  // ===========================================================================
  // Theme
  // ===========================================================================

  /// Updates the application's theme.
  Future<void> setThemeMode(
    ThemeMode themeMode,
  ) async {
    _setLoading(true);

    try {
      await _repository.saveThemeMode(themeMode);

      _themeMode = themeMode;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // ===========================================================================
  // Language
  // ===========================================================================

  /// Updates the application's language.
  Future<void> setLanguage(
    String language,
  ) async {
    _setLoading(true);

    try {
      await _repository.saveLanguage(language);

      _language = language;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // ===========================================================================
  // Notifications
  // ===========================================================================

  /// Enables or disables notifications.
  Future<void> setNotificationsEnabled(
    bool enabled,
  ) async {
    _setLoading(true);

    try {
      await _repository.setNotificationsEnabled(enabled);

      _notificationsEnabled = enabled;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // ===========================================================================
  // Reminder
  // ===========================================================================

  /// Enables or disables workout reminders.
  Future<void> setReminderEnabled(
    bool enabled,
  ) async {
    _setLoading(true);

    try {
      await _repository.setReminderEnabled(enabled);

      _reminderEnabled = enabled;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Updates the reminder time.
  Future<void> setReminderTime(
    String time,
  ) async {
    _setLoading(true);

    try {
      await _repository.saveReminderTime(time);

      _reminderTime = time;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // ===========================================================================
  // Onboarding
  // ===========================================================================

  /// Marks onboarding as completed.
  Future<void> completeOnboarding() async {
    _setLoading(true);

    try {
      await _repository.setOnboardingCompleted(true);

      _onboardingCompleted = true;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  // ===========================================================================
  // Reset
  // ===========================================================================

  /// Restores every setting to its default value.
  Future<void> resetSettings() async {
    _setLoading(true);

    try {
      await _repository.resetSettings();

      _themeMode = ThemeMode.system;
      _language = 'en';
      _notificationsEnabled = true;
      _reminderEnabled = false;
      _reminderTime = '08:00';
      _onboardingCompleted = false;

      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Reloads every persisted setting.
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