/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/models/workout.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Defines the workout data model.
/// • Represents a completed or scheduled workout session.
/// • Supports immutable data handling.
/// • Provides JSON serialization for future local/database storage.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Dashboard
/// • Workout Details Screen
/// • History Screen
/// • Dummy Workout Data
/// • Future Provider/Hive implementation
/// ============================================================================
class Workout {
  /// Creates a [Workout].
  const Workout({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.duration,
    required this.caloriesBurned,
    required this.distance,
    required this.steps,
    required this.averageHeartRate,
    required this.completed,
    required this.date,
  });

  /// Unique workout identifier.
  final String id;

  /// Workout title.
  final String title;

  /// Workout category.
  ///
  /// Examples:
  /// • Running
  /// • Cycling
  /// • Yoga
  /// • Strength
  /// • Cardio
  final String category;

  /// Workout description.
  final String description;

  /// Workout image asset.
  final String image;

  /// Workout duration in minutes.
  final int duration;

  /// Calories burned.
  final int caloriesBurned;

  /// Distance covered in kilometers.
  final double distance;

  /// Total steps.
  final int steps;

  /// Average heart rate (BPM).
  final int averageHeartRate;

  /// Indicates whether the workout has been completed.
  final bool completed;

  /// Workout date.
  final DateTime date;

  /// Returns the formatted duration.
  String get formattedDuration => '$duration min';

  /// Returns the formatted distance.
  String get formattedDistance => '${distance.toStringAsFixed(1)} km';

  /// Returns the formatted calories.
  String get formattedCalories => '$caloriesBurned kcal';

  /// Creates a copy of this workout with updated values.
  Workout copyWith({
    String? id,
    String? title,
    String? category,
    String? description,
    String? image,
    int? duration,
    int? caloriesBurned,
    double? distance,
    int? steps,
    int? averageHeartRate,
    bool? completed,
    DateTime? date,
  }) {
    return Workout(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      image: image ?? this.image,
      duration: duration ?? this.duration,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      distance: distance ?? this.distance,
      steps: steps ?? this.steps,
      averageHeartRate: averageHeartRate ?? this.averageHeartRate,
      completed: completed ?? this.completed,
      date: date ?? this.date,
    );
  }

  /// Converts this workout into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'image': image,
      'duration': duration,
      'caloriesBurned': caloriesBurned,
      'distance': distance,
      'steps': steps,
      'averageHeartRate': averageHeartRate,
      'completed': completed,
      'date': date.toIso8601String(),
    };
  }

  /// Creates a [Workout] from JSON.
  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      duration: json['duration'] as int,
      caloriesBurned: json['caloriesBurned'] as int,
      distance: (json['distance'] as num).toDouble(),
      steps: json['steps'] as int,
      averageHeartRate: json['averageHeartRate'] as int,
      completed: json['completed'] as bool,
      date: DateTime.parse(json['date'] as String),
    );
  }

  @override
  String toString() {
    return 'Workout('
        'id: $id, '
        'title: $title, '
        'category: $category'
        ')';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Workout &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}