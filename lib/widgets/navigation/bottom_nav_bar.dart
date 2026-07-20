import 'package:flutter/material.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/navigation/bottom_nav_bar.dart
///
/// Reusable Material 3 Bottom Navigation Bar.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Material Design 3
/// • Theme aware
/// • Configurable current index
/// • Navigation callback
/// • Badges support (future)
/// • Fully reusable
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Screen
/// • Workout Screen
/// • Progress Screen
/// • History Screen
/// • Profile Screen
/// ============================================================================

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  /// Selected tab index.
  final int currentIndex;

  /// Called when a destination is selected.
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,

      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.fitness_center_outlined),
          selectedIcon: Icon(Icons.fitness_center),
          label: 'Workout',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart_outlined),
          selectedIcon: Icon(Icons.bar_chart),
          label: 'Progress',
        ),
        NavigationDestination(
          icon: Icon(Icons.history_outlined),
          selectedIcon: Icon(Icons.history),
          label: 'History',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline_rounded),
          selectedIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}