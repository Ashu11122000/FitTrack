/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/core/utils/validators.dart
///
/// Centralized form validation utilities.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Validate required fields.
/// • Validate email addresses.
/// • Validate passwords.
/// • Validate names.
/// • Validate phone numbers.
/// • Validate numeric input.
/// • Prevent duplicated validation logic.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Login Screen
/// • Profile Screen
/// • Settings Screen
/// • Future Registration Screen
/// • Future Forgot Password Screen
/// ============================================================================
class AppValidators {
  AppValidators._();

  // ===========================================================================
  // Regular Expressions
  // ===========================================================================

  static final RegExp _emailRegex = RegExp(
    r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  static final RegExp _phoneRegex = RegExp(
    r'^[0-9]{10}$',
  );

  static final RegExp _nameRegex = RegExp(
    r"^[A-Za-z\s]+$",
  );

  // ===========================================================================
  // Required Field
  // ===========================================================================

  static String? required(
    String? value, {
    String fieldName = 'This field',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  // ===========================================================================
  // Email Validation
  // ===========================================================================

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!_emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  // ===========================================================================
  // Password Validation
  // ===========================================================================

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  // ===========================================================================
  // Confirm Password
  // ===========================================================================

  static String? confirmPassword(
    String? value,
    String password,
  ) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  // ===========================================================================
  // Name Validation
  // ===========================================================================

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.trim().length < 2) {
      return 'Name is too short';
    }

    if (!_nameRegex.hasMatch(value.trim())) {
      return 'Enter a valid name';
    }

    return null;
  }

  // ===========================================================================
  // Phone Validation
  // ===========================================================================

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    if (!_phoneRegex.hasMatch(value.trim())) {
      return 'Enter a valid 10-digit phone number';
    }

    return null;
  }

  // ===========================================================================
  // Minimum Length
  // ===========================================================================

  static String? minLength(
    String? value,
    int length, {
    String fieldName = 'Field',
  }) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (value.length < length) {
      return '$fieldName must be at least $length characters';
    }

    return null;
  }

  // ===========================================================================
  // Maximum Length
  // ===========================================================================

  static String? maxLength(
    String? value,
    int length, {
    String fieldName = 'Field',
  }) {
    if (value != null && value.length > length) {
      return '$fieldName cannot exceed $length characters';
    }

    return null;
  }

  // ===========================================================================
  // Numeric Validation
  // ===========================================================================

  static String? number(
    String? value, {
    String fieldName = 'Value',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    if (double.tryParse(value) == null) {
      return 'Enter a valid number';
    }

    return null;
  }

  // ===========================================================================
  // Positive Number Validation
  // ===========================================================================

  static String? positiveNumber(
    String? value, {
    String fieldName = 'Value',
  }) {
    final validation = number(
      value,
      fieldName: fieldName,
    );

    if (validation != null) {
      return validation;
    }

    final parsed = double.parse(value!);

    if (parsed <= 0) {
      return '$fieldName must be greater than zero';
    }

    return null;
  }
}