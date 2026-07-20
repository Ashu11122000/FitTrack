import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_theme.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/inputs/custom_text_field.dart
///
/// Reusable Material 3 text field.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Fully theme-driven
/// • Validation support
/// • Prefix & suffix icons
/// • Read-only mode
/// • Enabled/disabled state
/// • Obscure text support
/// • Multiline support
/// • Text capitalization
/// • Keyboard type customization
/// • Input formatters
/// • Autofill support
/// • Callbacks
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Login Screen
/// • Profile Screen
/// • Settings Screen
/// • Search Fields
/// • Forms
/// ============================================================================

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.autofillHints,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.autofocus = false,
    this.expands = false,
    this.initialValue,
  });

  /// Controller
  final TextEditingController? controller;

  /// Focus node
  final FocusNode? focusNode;

  /// Initial value
  final String? initialValue;

  /// Label
  final String? labelText;

  /// Hint
  final String? hintText;

  /// Helper text
  final String? helperText;

  /// Error text
  final String? errorText;

  /// Prefix icon
  final Widget? prefixIcon;

  /// Suffix icon
  final Widget? suffixIcon;

  /// Keyboard type
  final TextInputType keyboardType;

  /// Text input action
  final TextInputAction textInputAction;

  /// Text capitalization
  final TextCapitalization textCapitalization;

  /// Validator
  final String? Function(String?)? validator;

  /// On changed
  final ValueChanged<String>? onChanged;

  /// On tap
  final VoidCallback? onTap;

  /// On submitted
  final ValueChanged<String>? onFieldSubmitted;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Autofill hints
  final Iterable<String>? autofillHints;

  /// Maximum lines
  final int? maxLines;

  /// Minimum lines
  final int? minLines;

  /// Maximum length
  final int? maxLength;

  /// Enabled
  final bool enabled;

  /// Read only
  final bool readOnly;

  /// Obscure text
  final bool obscureText;

  /// Autofocus
  final bool autofocus;

  /// Expands
  final bool expands;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: controller == null ? initialValue : null,

      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,

      validator: validator,

      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,

      inputFormatters: inputFormatters,
      autofillHints: autofillHints,

      maxLines: expands ? null : maxLines,
      minLines: expands ? null : minLines,
      maxLength: maxLength,

      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      autofocus: autofocus,
      expands: expands,

      style: AppTextTheme.bodyLarge,

      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        counterText: '',

        prefixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: AppSizes.inputMd,
        ),

        suffixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: AppSizes.inputMd,
        ),
      ),
    );
  }
}