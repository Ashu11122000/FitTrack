import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text_field.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/widgets/inputs/password_field.dart
///
/// Reusable password input field.
///
/// Features
/// ----------------------------------------------------------------------------
/// • Password visibility toggle
/// • Validation support
/// • Prefix icon
/// • Read-only mode
/// • Autofill support
/// • Material Design 3
/// • Reuses CustomTextField
///
/// Used By
/// ----------------------------------------------------------------------------
/// • Login Screen
/// • Register Screen
/// • Change Password Screen
/// • Reset Password Screen
/// ============================================================================

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText = 'Password',
    this.hintText = 'Enter your password',
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.autofillHints,
    this.textInputAction = TextInputAction.done,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
  });

  /// Controller
  final TextEditingController? controller;

  /// Focus node
  final FocusNode? focusNode;

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

  /// Validator
  final String? Function(String?)? validator;

  /// Changed callback
  final ValueChanged<String>? onChanged;

  /// Tap callback
  final VoidCallback? onTap;

  /// Submitted callback
  final ValueChanged<String>? onFieldSubmitted;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Autofill hints
  final Iterable<String>? autofillHints;

  /// Text input action
  final TextInputAction textInputAction;

  /// Enabled
  final bool enabled;

  /// Read only
  final bool readOnly;

  /// Autofocus
  final bool autofocus;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      labelText: widget.labelText,
      hintText: widget.hintText,
      helperText: widget.helperText,
      errorText: widget.errorText,

      prefixIcon:
          widget.prefixIcon ??
          const Icon(Icons.lock_outline_rounded),

      suffixIcon: IconButton(
        tooltip: _obscureText ? 'Show Password' : 'Hide Password',
        onPressed: _toggleVisibility,
        icon: Icon(
          _obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
      ),

      obscureText: _obscureText,

      keyboardType: TextInputType.visiblePassword,

      textInputAction: widget.textInputAction,

      validator: widget.validator,

      onChanged: widget.onChanged,

      onTap: widget.onTap,

      onFieldSubmitted: widget.onFieldSubmitted,

      inputFormatters: widget.inputFormatters,

      autofillHints:
          widget.autofillHints ?? const [AutofillHints.password],

      enabled: widget.enabled,

      readOnly: widget.readOnly,

      autofocus: widget.autofocus,
    );
  }
}