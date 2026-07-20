/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/models/activity.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Defines the activity timeline model.
/// • Represents a user's fitness activity.
/// • Supports immutable data handling.
/// • Provides JSON serialization for future persistence.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Dashboard
/// • History Screen
/// • Progress Screen
/// • Dummy Activity Data
/// • Future Provider/Hive implementation
/// ============================================================================
class Activity {
  /// Creates an [Activity].
  const Activity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.icon,
    required this.value,
    required this.unit,
    required this.recordedAt,
  });

  /// Unique activity identifier.
  final String id;

  /// Activity title.
  ///
  /// Examples:
  /// • Morning Run
  /// • Evening Walk
  /// • Cycling Session
  /// • Yoga Practice
  final String title;

  /// Additional activity description.
  final String subtitle;

  /// Activity category.
  ///
  /// Examples:
  /// • Running
  /// • Walking
  /// • Cycling
  /// • Yoga
  /// • Workout
  final String type;

  /// Activity icon asset path.
  final String icon;

  /// Numeric value associated with the activity.
  ///
  /// Examples:
  /// • Steps
  /// • Calories
  /// • Distance
  /// • Duration
  final double value;

  /// Display unit.
  ///
  /// Examples:
  /// • steps
  /// • kcal
  /// • km
  /// • min
  final String unit;

  /// Date and time when the activity occurred.
  final DateTime recordedAt;

  /// Returns the formatted value for UI display.
  String get formattedValue {
    if (value == value.roundToDouble()) {
      return '${value.toInt()} $unit';
    }

    return '${value.toStringAsFixed(1)} $unit';
  }

  /// Returns only the activity date.
  DateTime get date => DateTime(
        recordedAt.year,
        recordedAt.month,
        recordedAt.day,
      );

  /// Returns whether the activity occurred today.
  bool get isToday {
    final now = DateTime.now();

    return recordedAt.year == now.year &&
        recordedAt.month == now.month &&
        recordedAt.day == now.day;
  }

  /// Creates a copy of this activity with updated values.
  Activity copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? type,
    String? icon,
    double? value,
    String? unit,
    DateTime? recordedAt,
  }) {
    return Activity(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      value: value ?? this.value,
      unit: unit ?? this.unit,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  /// Converts this activity into JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'type': type,
      'icon': icon,
      'value': value,
      'unit': unit,
      'recordedAt': recordedAt.toIso8601String(),
    };
  }

  /// Creates an [Activity] from JSON.
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      type: json['type'] as String,
      icon: json['icon'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      recordedAt: DateTime.parse(json['recordedAt'] as String),
    );
  }

  @override
  String toString() {
    return 'Activity('
        'id: $id, '
        'title: $title, '
        'type: $type'
        ')';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Activity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}