/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/models/statistic.dart
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Defines the statistic data model.
/// • Represents dashboard fitness metrics.
/// • Supports immutable data handling.
/// • Provides JSON serialization for future persistence.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Home Dashboard
/// • Progress Screen
/// • Statistic Card
/// • Dummy Statistics Data
/// • Future Provider/Hive implementation
/// ============================================================================
class Statistic {
  /// Creates a [Statistic].
  const Statistic({
    required this.id,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.progress,
    required this.target,
    required this.current,
  });

  /// Unique statistic identifier.
  final String id;

  /// Statistic title.
  ///
  /// Examples:
  /// • Steps
  /// • Calories
  /// • Distance
  /// • Heart Rate
  final String title;

  /// Display value.
  ///
  /// Example:
  /// • "8,452"
  /// • "520"
  /// • "6.8"
  /// • "82"
  final String value;

  /// Display unit.
  ///
  /// Examples:
  /// • steps
  /// • kcal
  /// • km
  /// • bpm
  final String unit;

  /// Icon asset path.
  final String icon;

  /// Progress between 0.0 and 1.0.
  final double progress;

  /// Goal value.
  final double target;

  /// Current achieved value.
  final double current;

  /// Returns whether the target has been achieved.
  bool get isGoalCompleted => current >= target;

  /// Returns remaining value to reach the target.
  double get remaining =>
      (target - current).clamp(0.0, double.infinity);

  /// Returns completion percentage.
  double get percentage => progress * 100;

  /// Creates a copy with updated values.
  Statistic copyWith({
    String? id,
    String? title,
    String? value,
    String? unit,
    String? icon,
    double? progress,
    double? target,
    double? current,
  }) {
    return Statistic(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
      unit: unit ?? this.unit,
      icon: icon ?? this.icon,
      progress: progress ?? this.progress,
      target: target ?? this.target,
      current: current ?? this.current,
    );
  }

  /// Converts this model into JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'unit': unit,
      'icon': icon,
      'progress': progress,
      'target': target,
      'current': current,
    };
  }

  /// Creates a [Statistic] from JSON.
  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
      id: json['id'] as String,
      title: json['title'] as String,
      value: json['value'] as String,
      unit: json['unit'] as String,
      icon: json['icon'] as String,
      progress: (json['progress'] as num).toDouble(),
      target: (json['target'] as num).toDouble(),
      current: (json['current'] as num).toDouble(),
    );
  }

  @override
  String toString() {
    return 'Statistic('
        'id: $id, '
        'title: $title, '
        'value: $value $unit'
        ')';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Statistic &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}