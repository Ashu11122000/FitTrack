import 'package:flutter/material.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/route_names.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/utils/validators.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/inputs/custom_text_field.dart';
import '../../../widgets/inputs/password_field.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/auth/widgets/login_form.dart
///
/// Login form widget.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Display login form.
/// • Validate user input.
/// • Handle Remember Me option.
/// • Simulate authentication for demo purposes.
/// • Navigate to Home after successful validation.
/// • Keep authentication UI modular.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • LoginScreen
/// ============================================================================
class LoginForm extends StatefulWidget {
  /// Creates a [LoginForm].
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // ===========================================================================
  // Form Key
  // ===========================================================================

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ===========================================================================
  // Controllers
  // ===========================================================================

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  // ===========================================================================
  // State
  // ===========================================================================

  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ===========================================================================
  // Login
  // ===========================================================================

  Future<void> _login() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate a network request for demo purposes.
    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
    });

    NavigationService.pushReplacementNamed(
      RouteNames.home,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ---------------------------------------------------------------
            // Email
            // ---------------------------------------------------------------
            CustomTextField(
              controller: _emailController,
              labelText: AppStrings.email,
              hintText: AppStrings.email,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [
                AutofillHints.email,
              ],
              validator: AppValidators.email,
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            // ---------------------------------------------------------------
            // Password
            // ---------------------------------------------------------------
            PasswordField(
              controller: _passwordController,
              labelText: AppStrings.password,
              hintText: AppStrings.password,
              validator: AppValidators.password,
            ),

            const SizedBox(
              height: AppSpacing.md,
            ),

            // ---------------------------------------------------------------
            // Remember Me
            // ---------------------------------------------------------------
            CheckboxListTile(
              value: _rememberMe,
              contentPadding: EdgeInsets.zero,
              controlAffinity:
                  ListTileControlAffinity.leading,
              title: const Text(
                AppStrings.rememberMe,
              ),
              onChanged: _isLoading
                  ? null
                  : (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
            ),

            const SizedBox(
              height: AppSpacing.lg,
            ),

            // ---------------------------------------------------------------
            // Forgot Password
            // ---------------------------------------------------------------
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        // TODO(Ashish): Implement Forgot Password
                      },
                child: const Text(
                  AppStrings.forgotPassword,
                ),
              ),
            ),

            const SizedBox(
              height: AppSpacing.xl,
            ),

            // ---------------------------------------------------------------
            // Sign In Button
            // ---------------------------------------------------------------
            PrimaryButton(
              text: AppStrings.signIn,
              isLoading: _isLoading,
              onPressed: _isLoading ? null : _login,
            ),
          ],
        ),
      ),
    );
  }
}