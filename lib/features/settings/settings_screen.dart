import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_strings.dart';
import '../../data/dummy_profile.dart';
import '../../widgets/navigation/bottom_nav_bar.dart';
import '../../widgets/navigation/custom_app_bar.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/settings/settings_screen.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display application settings
/// • Manage appearance preferences
/// • Manage notification preferences
/// • Manage fitness preferences
/// • Manage privacy & security
/// • Display application information
/// • Consume dummy profile data during Phase 8
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Profile Screen
/// • Bottom Navigation
///
/// Notes
/// ----------------------------------------------------------------------------
/// • All switches are local state only during Phase 8.
/// • Provider, Hive and SharedPreferences integration will
///   be implemented during Phase 9.
/// • Uses reusable widgets from the shared widget library.
/// ============================================================================
class SettingsScreen extends StatefulWidget {
  /// Creates a [SettingsScreen].
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {
  /// Selected navigation index.
  int _currentIndex = 4;

  /// Current signed-in user.
  final user = currentUser;

  // ===========================================================
  // Local Settings State (Phase 8)
  // ===========================================================

  bool _darkMode = false;
  bool _notificationsEnabled = true;
  bool _workoutReminder = true;
  bool _goalReminder = true;
  bool _waterReminder = false;
  bool _biometricLock = false;
  bool _cloudSync = false;

  /// Handles bottom navigation.
  void _onNavigationChanged(int index) {
    if (_currentIndex == index) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });

    // Navigation will be connected after
    // all Phase 8 screens are completed.
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,

      appBar: CustomAppBar(
        title: AppStrings.settings,
        centerTitle: true,
        showBackButton: true,
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavigationChanged,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

                            // =============================================================
              // Profile Summary
              // =============================================================

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            theme.colorScheme.primaryContainer,
                        backgroundImage:
                            user.profileImage.isNotEmpty
                                ? AssetImage(user.profileImage)
                                : null,
                        child: user.profileImage.isEmpty
                            ? Icon(
                                Icons.person_rounded,
                                color:
                                    theme.colorScheme.primary,
                              )
                            : null,
                      ),

                      const SizedBox(
                        width: AppSpacing.lg,
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.fullName,
                              style: theme
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                            ),

                            const SizedBox(
                              height: AppSpacing.xs,
                            ),

                            Text(
                              user.email,
                              style: theme
                                  .textTheme
                                  .bodyMedium,
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          // Navigate to Profile
                        },
                        icon: const Icon(
                          Icons.chevron_right_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Appearance
              // =============================================================

              Text(
                'Appearance',
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Column(
                  children: [
                    SwitchListTile(
                      value: _darkMode,
                      onChanged: (value) {
                        setState(() {
                          _darkMode = value;
                        });
                      },
                      secondary: const Icon(
                        Icons.dark_mode_outlined,
                      ),
                      title: const Text(
                        'Dark Mode',
                      ),
                      subtitle: const Text(
                        'Use dark appearance',
                      ),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.palette_outlined,
                      ),
                      title: const Text(
                        'Theme',
                      ),
                      subtitle: const Text(
                        'System Default',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {},
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.text_fields_rounded,
                      ),
                      title: const Text(
                        'Font Size',
                      ),
                      subtitle: const Text(
                        'Medium',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Notifications
              // =============================================================

              Text(
                'Notifications',
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Column(
                  children: [
                    SwitchListTile(
                      value: _notificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          _notificationsEnabled =
                              value;
                        });
                      },
                      secondary: const Icon(
                        Icons.notifications_outlined,
                      ),
                      title: const Text(
                        'Enable Notifications',
                      ),
                      subtitle: const Text(
                        'Receive application alerts',
                      ),
                    ),

                    const Divider(height: 1),

                    SwitchListTile(
                      value: _workoutReminder,
                      onChanged: (value) {
                        setState(() {
                          _workoutReminder = value;
                        });
                      },
                      secondary: const Icon(
                        Icons.fitness_center_rounded,
                      ),
                      title: const Text(
                        'Workout Reminder',
                      ),
                      subtitle: const Text(
                        'Daily workout notifications',
                      ),
                    ),

                    const Divider(height: 1),

                    SwitchListTile(
                      value: _goalReminder,
                      onChanged: (value) {
                        setState(() {
                          _goalReminder = value;
                        });
                      },
                      secondary: const Icon(
                        Icons.flag_outlined,
                      ),
                      title: const Text(
                        'Goal Reminder',
                      ),
                      subtitle: const Text(
                        'Remind me about my goals',
                      ),
                    ),

                    const Divider(height: 1),

                    SwitchListTile(
                      value: _waterReminder,
                      onChanged: (value) {
                        setState(() {
                          _waterReminder = value;
                        });
                      },
                      secondary: const Icon(
                        Icons.water_drop_outlined,
                      ),
                      title: const Text(
                        'Water Reminder',
                      ),
                      subtitle: const Text(
                        'Stay hydrated throughout the day',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

                            // =============================================================
              // Fitness Preferences
              // =============================================================

              Text(
                'Fitness Preferences',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.flag_outlined,
                      ),
                      title: const Text(
                        'Fitness Goal',
                      ),
                      subtitle: Text(
                        user.goal,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {
                        // Phase 9
                      },
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.directions_walk_rounded,
                      ),
                      title: const Text(
                        'Daily Step Goal',
                      ),
                      subtitle: Text(
                        '${user.dailyStepGoal} steps',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {},
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.local_fire_department_rounded,
                      ),
                      title: const Text(
                        'Daily Calorie Goal',
                      ),
                      subtitle: Text(
                        '${user.dailyCalorieGoal} kcal',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {},
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.monitor_weight_outlined,
                      ),
                      title: const Text(
                        'Weight',
                      ),
                      subtitle: Text(
                        '${user.weight.toStringAsFixed(1)} kg',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {},
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.height_rounded,
                      ),
                      title: const Text(
                        'Height',
                      ),
                      subtitle: Text(
                        '${user.height.toStringAsFixed(0)} cm',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Privacy & Security
              // =============================================================

              Text(
                'Privacy & Security',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Column(
                  children: [
                    SwitchListTile(
                      value: _biometricLock,
                      onChanged: (value) {
                        setState(() {
                          _biometricLock = value;
                        });
                      },
                      secondary: const Icon(
                        Icons.fingerprint_rounded,
                      ),
                      title: const Text(
                        'Biometric Lock',
                      ),
                      subtitle: const Text(
                        'Protect the application using biometrics',
                      ),
                    ),

                    const Divider(height: 1),

                    SwitchListTile(
                      value: _cloudSync,
                      onChanged: (value) {
                        setState(() {
                          _cloudSync = value;
                        });
                      },
                      secondary: const Icon(
                        Icons.cloud_sync_outlined,
                      ),
                      title: const Text(
                        'Cloud Sync',
                      ),
                      subtitle: const Text(
                        'Sync your data across devices',
                      ),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.lock_outline_rounded,
                      ),
                      title: const Text(
                        'Change Password',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {},
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.privacy_tip_outlined,
                      ),
                      title: const Text(
                        'Privacy Policy',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // About FitTrack
              // =============================================================

              Text(
                'About FitTrack',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(
                        Icons.info_outline_rounded,
                      ),
                      title: Text(
                        'Version',
                      ),
                      subtitle: Text(
                        '1.0.0',
                      ),
                    ),

                    const Divider(height: 1),

                    const ListTile(
                      leading: Icon(
                        Icons.flutter_dash_rounded,
                      ),
                      title: Text(
                        'Framework',
                      ),
                      subtitle: Text(
                        'Flutter • Material Design 3',
                      ),
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.description_outlined,
                      ),
                      title: const Text(
                        'Licenses',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {
                        showLicensePage(
                          context: context,
                        );
                      },
                    ),

                    const Divider(height: 1),

                    ListTile(
                      leading: const Icon(
                        Icons.favorite_outline_rounded,
                      ),
                      title: const Text(
                        'Open Source Libraries',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xxl,
              ),

                            // =============================================================
              // Reset Settings
              // =============================================================

              Text(
                'Reset',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.restore_rounded,
                        color: theme.colorScheme.primary,
                      ),
                      title: const Text(
                        'Reset Preferences',
                      ),
                      subtitle: const Text(
                        'Restore default application settings',
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                      onTap: () {
                        setState(() {
                          _darkMode = false;
                          _notificationsEnabled = true;
                          _workoutReminder = true;
                          _goalReminder = true;
                          _waterReminder = false;
                          _biometricLock = false;
                          _cloudSync = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Settings restored successfully.',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Developer Information
              // =============================================================

              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite_rounded,
                      color: theme.colorScheme.primary,
                      size: 28,
                    ),

                    const SizedBox(
                      height: AppSpacing.md,
                    ),

                    Text(
                      'FitTrack',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: AppSpacing.xs,
                    ),

                    Text(
                      'Version 1.0.0',
                      style: theme.textTheme.bodyMedium,
                    ),

                    const SizedBox(
                      height: AppSpacing.sm,
                    ),

                    Text(
                      'Built with Flutter & Material Design 3',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),

                    const SizedBox(
                      height: AppSpacing.sm,
                    ),

                    Text(
                      '© 2026 FitTrack',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xxxl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}