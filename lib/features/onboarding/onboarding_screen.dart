import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_duration.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_strings.dart';
import '../../core/routes/route_names.dart';
import '../../core/services/navigation_service.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/buttons/secondary_button.dart';
import 'onboarding_page.dart';

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// File: lib/features/onboarding/onboarding_screen.dart
///
/// Interactive onboarding experience.
///
/// Responsibilities
/// ----------------------------------------------------------------------------
/// • Introduce application features.
/// • Allow users to swipe through onboarding pages.
/// • Display page indicators.
/// • Navigate to the Login screen.
/// • Follow Material Design 3.
///
/// Used By
/// ----------------------------------------------------------------------------
/// • SplashScreen
/// • App Routes
/// ============================================================================
class OnboardingScreen extends StatefulWidget {
  /// Creates an [OnboardingScreen].
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  int _currentPage = 0;

  late final List<_OnboardingItem> _pages;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _pages = [
      _OnboardingItem(
        image: Image.asset(
          AppAssets.onboarding,
          fit: BoxFit.contain,
        ),
        title: AppStrings.onboardingTitle1,
        description: AppStrings.onboardingSubtitle1,
      ),
      _OnboardingItem(
        image: SvgPicture.asset(
          AppAssets.workout,
          fit: BoxFit.contain,
        ),
        title: AppStrings.onboardingTitle2,
        description: AppStrings.onboardingSubtitle2,
      ),
      _OnboardingItem(
        image: Image.asset(
          AppAssets.running,
          fit: BoxFit.contain,
        ),
        title: AppStrings.onboardingTitle3,
        description: AppStrings.onboardingSubtitle3,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _isLastPage => _currentPage == _pages.length - 1;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<void> _nextPage() async {
    if (_isLastPage) {
      _finishOnboarding();
      return;
    }

    await _pageController.nextPage(
      duration: AppDuration.normal,
      curve: Curves.easeInOut,
    );
  }

  void _skipOnboarding() {
    _finishOnboarding();
  }

  void _finishOnboarding() {
    NavigationService.pushReplacementNamed(
      RouteNames.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // -----------------------------------------------------------------
            // Skip Button
            // -----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenHorizontal,
                vertical: AppSpacing.screenVertical,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Visibility(
                  visible: !_isLastPage,
                  child: SecondaryButton(
                    text: 'Skip',
                    isExpanded: false,
                    onPressed: _skipOnboarding,
                  ),
                ),
              ),
            ),

            // -----------------------------------------------------------------
            // Onboarding Pages
            // -----------------------------------------------------------------
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final page = _pages[index];

                  return OnboardingPage(
                    image: page.image,
                    title: page.title,
                    description: page.description,
                  );
                },
              ),
            ),

                        // -----------------------------------------------------------------
            // Bottom Section
            // -----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenHorizontal,
                AppSpacing.lg,
                AppSpacing.screenHorizontal,
                AppSpacing.xxl,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // -----------------------------------------------------------
                  // Page Indicator
                  // -----------------------------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) {
                        final isActive = index == _currentPage;

                        return AnimatedContainer(
                          duration: AppDuration.pageIndicator,
                          margin: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.xs,
                          ),
                          width: isActive ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.primary
                                : AppColors.grey300,
                            borderRadius: BorderRadius.circular(999),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(
                    height: AppSpacing.xxl,
                  ),

                  // -----------------------------------------------------------
                  // Next / Continue Button
                  // -----------------------------------------------------------
                  PrimaryButton(
                    text: _isLastPage
                        ? AppStrings.continueText
                        : AppStrings.next,
                    onPressed: _nextPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================================
/// FitTrack
/// ----------------------------------------------------------------------------
/// Internal model representing a single onboarding page.
/// ============================================================================
class _OnboardingItem {
  const _OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });

  final Widget image;
  final String title;
  final String description;
}