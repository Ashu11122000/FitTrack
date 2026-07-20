/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/models/user.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Defines the application's user model.
/// • Stores profile information used throughout the application.
/// • Provides immutable data representation.
/// • Supports serialization for future persistence layers.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Dashboard
/// • Profile Screen
/// • Settings Screen
/// • Dummy Profile Data
/// • Future Provider/Hive implementation
/// ============================================================================
class User {
  /// Creates a [User].
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileImage,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.goal,
    required this.dailyStepGoal,
    required this.dailyCalorieGoal,
    required this.totalWorkouts,
    required this.completedGoals,
    required this.joinedDate,
  });

  /// Unique identifier.
  final String id;

  /// User first name.
  final String firstName;

  /// User last name.
  final String lastName;

  /// Email address.
  final String email;

  /// Profile image asset path.
  final String profileImage;

  /// Age in years.
  final int age;

  /// Gender.
  final String gender;

  /// Height in centimeters.
  final double height;

  /// Weight in kilograms.
  final double weight;

  /// Primary fitness goal.
  final String goal;

  /// Daily step target.
  final int dailyStepGoal;

  /// Daily calorie target.
  final int dailyCalorieGoal;

  /// Total completed workouts.
  final int totalWorkouts;

  /// Total achieved milestones.
  final int completedGoals;

  /// Account creation date.
  final DateTime joinedDate;

  /// User full name.
  String get fullName => '$firstName $lastName';

  /// Body Mass Index.
  double get bmi => weight / ((height / 100) * (height / 100));

  /// Creates a copy with updated values.
  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? profileImage,
    int? age,
    String? gender,
    double? height,
    double? weight,
    String? goal,
    int? dailyStepGoal,
    int? dailyCalorieGoal,
    int? totalWorkouts,
    int? completedGoals,
    DateTime? joinedDate,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      goal: goal ?? this.goal,
      dailyStepGoal: dailyStepGoal ?? this.dailyStepGoal,
      dailyCalorieGoal: dailyCalorieGoal ?? this.dailyCalorieGoal,
      totalWorkouts: totalWorkouts ?? this.totalWorkouts,
      completedGoals: completedGoals ?? this.completedGoals,
      joinedDate: joinedDate ?? this.joinedDate,
    );
  }

  /// Converts the model into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profileImage': profileImage,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'goal': goal,
      'dailyStepGoal': dailyStepGoal,
      'dailyCalorieGoal': dailyCalorieGoal,
      'totalWorkouts': totalWorkouts,
      'completedGoals': completedGoals,
      'joinedDate': joinedDate.toIso8601String(),
    };
  }

  /// Creates a model from JSON.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      profileImage: json['profileImage'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      goal: json['goal'] as String,
      dailyStepGoal: json['dailyStepGoal'] as int,
      dailyCalorieGoal: json['dailyCalorieGoal'] as int,
      totalWorkouts: json['totalWorkouts'] as int,
      completedGoals: json['completedGoals'] as int,
      joinedDate: DateTime.parse(json['joinedDate'] as String),
    );
  }

  @override
  String toString() {
    return 'User('
        'id: $id, '
        'fullName: $fullName, '
        'email: $email'
        ')';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}