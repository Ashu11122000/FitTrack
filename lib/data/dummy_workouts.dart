/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/data/dummy_workouts.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Provides mock workout data.
/// • Supplies workout information during Phase 8.
/// • Keeps UI independent from persistence.
/// • Can later be replaced by Provider/Hive/API implementations.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Dashboard
/// • Workout Details Screen
/// • History Screen
/// ============================================================================
library;

import '../core/constants/app_assets.dart';
import '../models/workout.dart';

/// Mock workout collection used throughout Phase 8.
final List<Workout> dummyWorkouts = [
  Workout(
    id: 'WK001',
    title: 'Morning Run',
    category: 'Running',
    description:
        'A refreshing outdoor run focused on improving endurance and cardiovascular fitness.',
    image: AppAssets.workoutImage,
    duration: 35,
    caloriesBurned: 420,
    distance: 6.2,
    steps: 8120,
    averageHeartRate: 138,
    completed: true,
    date: DateTime(2026, 7, 20, 6, 30),
  ),
  Workout(
    id: 'WK002',
    title: 'Strength Training',
    category: 'Strength',
    description:
        'Upper-body resistance workout targeting chest, shoulders, back, and arms.',
    image: AppAssets.workoutImage,
    duration: 50,
    caloriesBurned: 510,
    distance: 0.0,
    steps: 1680,
    averageHeartRate: 126,
    completed: true,
    date: DateTime(2026, 7, 19, 18, 0),
  ),
  Workout(
    id: 'WK003',
    title: 'Yoga Flow',
    category: 'Yoga',
    description:
        'Full-body flexibility and balance session with breathing exercises.',
    image: AppAssets.yoga,
    duration: 40,
    caloriesBurned: 245,
    distance: 0.0,
    steps: 940,
    averageHeartRate: 82,
    completed: true,
    date: DateTime(2026, 7, 18, 7, 15),
  ),
  Workout(
    id: 'WK004',
    title: 'Cycling Session',
    category: 'Cycling',
    description:
        'Moderate-intensity cycling workout focused on endurance and stamina.',
    image: AppAssets.workoutImage,
    duration: 60,
    caloriesBurned: 670,
    distance: 18.4,
    steps: 0,
    averageHeartRate: 145,
    completed: true,
    date: DateTime(2026, 7, 17, 17, 30),
  ),
  Workout(
    id: 'WK005',
    title: 'HIIT Workout',
    category: 'HIIT',
    description:
        'High-intensity interval training with short recovery periods for maximum calorie burn.',
    image: AppAssets.workoutImage,
    duration: 28,
    caloriesBurned: 390,
    distance: 2.5,
    steps: 3520,
    averageHeartRate: 158,
    completed: true,
    date: DateTime(2026, 7, 16, 19, 0),
  ),
  Workout(
    id: 'WK006',
    title: 'Evening Walk',
    category: 'Walking',
    description:
        'Relaxed evening walk to maintain daily activity and improve recovery.',
    image: AppAssets.workoutImage,
    duration: 45,
    caloriesBurned: 210,
    distance: 4.1,
    steps: 5630,
    averageHeartRate: 94,
    completed: false,
    date: DateTime(2026, 7, 21, 18, 30),
  ),
];

/// Most recently completed workout.
Workout get latestWorkout => dummyWorkouts.first;

/// Completed workout sessions.
List<Workout> get completedWorkouts =>
    dummyWorkouts.where((workout) => workout.completed).toList();

/// Scheduled or incomplete workout sessions.
List<Workout> get upcomingWorkouts =>
    dummyWorkouts.where((workout) => !workout.completed).toList();

/// Total calories burned across completed workouts.
int get totalCaloriesBurned => completedWorkouts.fold(
      0,
      (sum, workout) => sum + workout.caloriesBurned,
    );

/// Total workout duration in minutes.
int get totalWorkoutDuration => completedWorkouts.fold(
      0,
      (sum, workout) => sum + workout.duration,
    );

/// Total distance covered in kilometers.
double get totalDistanceCovered => completedWorkouts.fold(
      0.0,
      (sum, workout) => sum + workout.distance,
    );

/// Total steps recorded.
int get totalSteps => completedWorkouts.fold(
      0,
      (sum, workout) => sum + workout.steps,
    );