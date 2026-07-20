import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_strings.dart';
import '../../data/dummy_profile.dart';
import '../../data/dummy_statistics.dart';
import '../../widgets/navigation/bottom_nav_bar.dart';
import '../../widgets/navigation/custom_app_bar.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/profile/profile_screen.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display user profile
/// • Display personal information
/// • Display fitness information
/// • Display achievements
/// • Navigate to settings
/// • Consume dummy profile data
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Bottom Navigation
/// • Home Screen
///
/// Notes
/// ----------------------------------------------------------------------------
/// • Uses dummy profile data during Phase 8.
/// • Provider/Hive integration will be added in Phase 9.
/// • Uses reusable widgets from the shared widget library.
/// ============================================================================
class ProfileScreen extends StatefulWidget {
  /// Creates a [ProfileScreen].
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  /// Selected navigation index.
  int _currentIndex = 4;

  /// Current user.
  final user = currentUser;

  /// Dashboard statistics.
  final statistics = dummyStatistics;

  /// Handles bottom navigation.
  void _onNavigationChanged(int index) {
    if (_currentIndex == index) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });

    // Navigation will be connected
    // after all Phase 8 screens
    // are completed.
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,

      appBar: CustomAppBar(
        title: AppStrings.profile,
        centerTitle: true,
        showBackButton: false,
        actions: [
          IconButton(
            tooltip: 'Edit Profile',
            onPressed: () {
              // Profile editing will be added
              // in a future phase.
            },
            icon: const Icon(
              Icons.edit_outlined,
            ),
          ),
        ],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                            // =============================================================
              // Profile Header
              // =============================================================

              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 56,
                      backgroundColor:
                          theme.colorScheme.primaryContainer,
                      backgroundImage: user.profileImage.isNotEmpty
                          ? AssetImage(user.profileImage)
                          : null,
                      child: user.profileImage.isEmpty
                          ? Icon(
                              Icons.person_rounded,
                              size: 56,
                              color: theme.colorScheme.primary,
                            )
                          : null,
                    ),

                    const SizedBox(
                      height: AppSpacing.lg,
                    ),

                    Text(
                      user.fullName,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: AppSpacing.xs,
                    ),

                    Text(
                      user.email,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: AppSpacing.lg,
                    ),

                    Chip(
                      avatar: Icon(
                        Icons.flag_rounded,
                        color: theme.colorScheme.primary,
                        size: 18,
                      ),
                      label: Text(
                        user.goal,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xxl,
              ),

              // =============================================================
              // Quick Statistics
              // =============================================================

              Text(
                'Quick Statistics',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Row(
                children: [
                  Expanded(
                    child: _ProfileStatCard(
                      icon: Icons.fitness_center_rounded,
                      title: 'Workouts',
                      value: '${user.totalWorkouts}',
                    ),
                  ),

                  const SizedBox(
                    width: AppSpacing.md,
                  ),

                  Expanded(
                    child: _ProfileStatCard(
                      icon: Icons.emoji_events_rounded,
                      title: 'Goals',
                      value: '${user.completedGoals}',
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Row(
                children: [
                  Expanded(
                    child: _ProfileStatCard(
                      icon: Icons.monitor_weight_outlined,
                      title: 'Weight',
                      value: '${user.weight} kg',
                    ),
                  ),

                  const SizedBox(
                    width: AppSpacing.md,
                  ),

                  Expanded(
                    child: _ProfileStatCard(
                      icon: Icons.height_rounded,
                      title: 'Height',
                      value: '${user.height.toInt()} cm',
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Row(
                children: [
                  Expanded(
                    child: _ProfileStatCard(
                      icon: Icons.cake_outlined,
                      title: 'Age',
                      value: '${user.age}',
                    ),
                  ),

                  const SizedBox(
                    width: AppSpacing.md,
                  ),

                  Expanded(
                    child: _ProfileStatCard(
                      icon: Icons.monitor_heart_outlined,
                      title: 'BMI',
                      value: user.bmi.toStringAsFixed(1),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppSpacing.xxl,
              ),

              // =============================================================
              // Profile Summary
              // =============================================================

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile Summary',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: AppSpacing.md,
                      ),

                      _ProfileInfoRow(
                        title: 'Member Since',
                        value:
                            '${user.joinedDate.day}/${user.joinedDate.month}/${user.joinedDate.year}',
                      ),

                      const Divider(),

                      _ProfileInfoRow(
                        title: 'Gender',
                        value: user.gender,
                      ),

                      const Divider(),

                      _ProfileInfoRow(
                        title: 'Daily Step Goal',
                        value:
                            '${user.dailyStepGoal} steps',
                      ),

                      const Divider(),

                      _ProfileInfoRow(
                        title: 'Daily Calorie Goal',
                        value:
                            '${user.dailyCalorieGoal} kcal',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

                            // =============================================================
              // Personal Information
              // =============================================================

              Text(
                'Personal Information',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Column(
                    children: [
                      _ProfileInfoRow(
                        title: 'Full Name',
                        value: user.fullName,
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Email',
                        value: user.email,
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Age',
                        value: '${user.age} Years',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Gender',
                        value: user.gender,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Fitness Information
              // =============================================================

              Text(
                'Fitness Information',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Column(
                    children: [
                      _ProfileInfoRow(
                        title: 'Fitness Goal',
                        value: user.goal,
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Height',
                        value:
                            '${user.height.toStringAsFixed(0)} cm',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Weight',
                        value:
                            '${user.weight.toStringAsFixed(1)} kg',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'BMI',
                        value:
                            user.bmi.toStringAsFixed(1),
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Daily Step Goal',
                        value:
                            '${user.dailyStepGoal}',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Daily Calorie Goal',
                        value:
                            '${user.dailyCalorieGoal} kcal',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Achievement Summary
              // =============================================================

              Text(
                'Achievement Summary',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Column(
                    children: [
                      _ProfileInfoRow(
                        title: 'Completed Workouts',
                        value:
                            '${user.totalWorkouts}',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Goals Achieved',
                        value:
                            '${user.completedGoals}',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Completed Daily Goals',
                        value:
                            '$completedGoals / ${statistics.length}',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Overall Progress',
                        value:
                            '${(overallProgress * 100).round()}%',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Account Information
              // =============================================================

              Text(
                'Account Information',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSpacing.md,
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppSpacing.lg,
                  ),
                  child: Column(
                    children: [
                      _ProfileInfoRow(
                        title: 'Member Since',
                        value:
                            '${user.joinedDate.day}/${user.joinedDate.month}/${user.joinedDate.year}',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Account Status',
                        value: 'Active',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Subscription',
                        value: 'Free Plan',
                      ),
                      const Divider(),
                      _ProfileInfoRow(
                        title: 'Data Sync',
                        value: 'Local Storage',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xxl,
              ),

                            // =============================================================
              // Profile Actions
              // =============================================================

              Text(
                'Quick Actions',
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
                    _ProfileMenuTile(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      subtitle: 'Manage your preferences',
                      onTap: () {
                        // Navigate to Settings screen.
                      },
                    ),
                    const Divider(height: 1),
                    _ProfileMenuTile(
                      icon: Icons.notifications_outlined,
                      title: 'Notifications',
                      subtitle: 'Manage reminders and alerts',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _ProfileMenuTile(
                      icon: Icons.help_outline_rounded,
                      title: 'Help & Support',
                      subtitle: 'Get assistance',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _ProfileMenuTile(
                      icon: Icons.info_outline_rounded,
                      title: 'About FitTrack',
                      subtitle: 'Application information',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: AppSpacing.xl,
              ),

              // =============================================================
              // Logout
              // =============================================================

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Logout will be implemented
                    // with Provider/Auth in Phase 9.
                  },
                  icon: const Icon(
                    Icons.logout_rounded,
                  ),
                  label: const Text(
                    'Logout',
                  ),
                ),
              ),

              const SizedBox(
                height: AppSpacing.xxl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ============================================================================
/// Private Widgets
/// ============================================================================

class _ProfileStatCard extends StatelessWidget {
  const _ProfileStatCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSpacing.lg,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: theme.colorScheme.primary,
              size: 30,
            ),
            const SizedBox(
              height: AppSpacing.md,
            ),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: AppSpacing.xs,
            ),
            Text(
              title,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  const _ProfileMenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primaryContainer,
        child: Icon(
          icon,
          color: theme.colorScheme.primary,
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.chevron_right_rounded,
      ),
      onTap: onTap,
    );
  }
}