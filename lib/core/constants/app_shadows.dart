import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppShadows {
  const AppShadows._();

  // Small Shadow
  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.05),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  // Medium Shadow
  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ];

  // Large Shadow
  static const List<BoxShadow> large = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  // Floating Shadow
  static const List<BoxShadow> floating = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.10),
      blurRadius: 24,
      offset: Offset(0, 10),
    ),
  ];

  // Dialog Shadow
  static const List<BoxShadow> dialog = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.15),
      blurRadius: 30,
      offset: Offset(0, 12),
    ),
  ];

  // Card Shadow
  static const List<BoxShadow> card = medium;

  // Button Shadow
  static const List<BoxShadow> button = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];

  // Workout Card Shadow
  static const List<BoxShadow> workoutCard = [
    BoxShadow(
      color: Color.fromRGBO(76, 175, 80, 0.15),
      blurRadius: 18,
      offset: Offset(0, 8),
    ),
  ];

  // Progress Card Shadow
  static const List<BoxShadow> progressCard = [
    BoxShadow(
      color: Color.fromRGBO(33, 150, 243, 0.15),
      blurRadius: 18,
      offset: Offset(0, 8),
    ),
  ];

  // Primary Shadow
  static List<BoxShadow> primary = [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.20),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];

  // Success Shadow
  static List<BoxShadow> success = [
    BoxShadow(
      color: AppColors.success.withOpacity(0.18),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];

  // Warning Shadow
  static List<BoxShadow> warning = [
    BoxShadow(
      color: AppColors.warning.withOpacity(0.18),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];

  // Error Shadow
  static List<BoxShadow> error = [
    BoxShadow(
      color: AppColors.error.withOpacity(0.18),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];
}