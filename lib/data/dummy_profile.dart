/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/data/dummy_profile.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Provides mock user profile data.
/// • Supplies profile information during Phase 8.
/// • Keeps presentation layer independent of persistence.
/// • Can later be replaced by Provider/Hive/API implementations.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Dashboard
/// • Profile Screen
/// • Settings Screen
/// ============================================================================
library;

import '../core/constants/app_assets.dart';
import '../models/user.dart';

/// Mock user profile used throughout the application during Phase 8.
final User dummyProfile = User(
  id: 'USR001',
  firstName: 'Ashish',
  lastName: 'Sharma',
  email: 'ashish.sharma@example.com',
  profileImage: AppAssets.profile,
  age: 25,
  gender: 'Male',
  height: 175.0,
  weight: 72.5,
  goal: 'Build Muscle',
  dailyStepGoal: 10000,
  dailyCalorieGoal: 2200,
  totalWorkouts: 148,
  completedGoals: 12,
  joinedDate: DateTime(2025, 1, 10),
);

/// Alias that improves readability when consumed by screens.
User get currentUser => dummyProfile;