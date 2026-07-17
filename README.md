# FitTrack

A modern Fitness Tracker mobile application built using Flutter and Dart.

The project is being developed as part of a mobile application assignment to demonstrate Flutter UI development, reusable components, responsive layouts, navigation, and Figma-based UI/UX design.

---

# Project Information

**Project Name:** FitTrack

**Technology Stack**

* Flutter 3.44.5
* Dart 3.12.x
* Material Design 3
* Provider
* Google Fonts
* Flutter SVG
* FL Chart
* Lottie
* Flutter ScreenUtil

---

# Assignment Objectives

This project is designed to satisfy the following requirements:

* Create a simple mobile app landing page layout using basic shapes and frames.
* Practice using the Pen tool to create custom icons or vector shapes.
* Experiment with typography scales and color palettes to create a style guide.
* Use Auto Layout to design responsive button components with different states.
* Build a multi-screen prototype with transitions and interactions.
* Create reusable UI components such as buttons, inputs, toggles, and cards.
* Organize layers and pages to maintain a scalable design.
* Explore and remix UI Kits from the Figma Community.
* Demonstrate collaboration using comments and multiplayer editing.
* Export assets for Flutter implementation.

---

# Development Environment

| Software    | Version                                |
| ----------- | -------------------------------------- |
| Flutter     | 3.44.5                                 |
| Dart        | 3.12.x                                 |
| Android SDK | 36.1.0                                 |
| Windows     | Windows 11 Home Single Language (25H2) |
| VS Code     | Latest                                 |
| Git         | Installed                              |

---

# Flutter Doctor Status

Current environment status:

* Flutter SDK installed
* Android SDK configured
* Android licenses accepted
* Chrome support available
* Connected devices detected

Visual Studio for Windows desktop development is not installed, which is acceptable because this project targets Android.

---

# Project Initialization

The project was created using:

```bash
flutter create fittrack
```

Run the application:

```bash
cd fittrack
flutter run
```

---

# Git Setup

Initialize Git:

```bash
git init
```

Add Remote Repository:

```bash
git remote add origin https://github.com/Ashu11122000/FitTrack.git
```

Verify Remote:

```bash
git remote -v
```

Rename Branch:

```bash
git branch -M main
```

---

# Dependencies

Install project dependencies:

```bash
flutter pub get
```

Main packages used:

* provider
* flutter_svg
* google_fonts
* font_awesome_flutter
* animations
* percent_indicator
* fl_chart
* lottie
* flutter_screenutil
* gap

---

# Project Structure
```
fittrack/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── assets/
│   │
│   ├── animations/
│   │     splash.json
│   │     success.json
│   │
│   ├── fonts/
│   │
│   ├── icons/
│   │     app_logo.svg
│   │     calories.svg
│   │     heart.svg
│   │     workout.svg
│   │
│   ├── images/
│   │     onboarding.png
│   │     profile.png
│   │     workout.png
│   │     yoga.png
│   │
│   └── illustrations/
│         fitness.png
│         running.png
│
├── lib/
│   │
│   ├── main.dart
│   │
│   ├── app/
│   │     app.dart
│   │
│   ├── core/
│   │
│   │     ├── constants/
│   │     │
│   │     │      app_assets.dart
│   │     │      app_colors.dart
│   │     │      app_strings.dart
│   │     │      app_sizes.dart
│   │     │      app_radius.dart
│   │     │      app_spacing.dart
│   │     │      app_duration.dart
│   │     │
│   │     ├── routes/
│   │     │
│   │     │      app_routes.dart
│   │     │      route_names.dart
│   │     │
│   │     ├── theme/
│   │     │
│   │     │      app_theme.dart
│   │     │      app_text_theme.dart
│   │     │      app_button_theme.dart
│   │     │      app_input_theme.dart
│   │     │
│   │     ├── utils/
│   │     │
│   │     │      validators.dart
│   │     │      extensions.dart
│   │     │      helpers.dart
│   │     │
│   │     └── services/
│   │
│   │            navigation_service.dart
│   │
│   ├── models/
│   │
│   │      workout.dart
│   │      user.dart
│   │      activity.dart
│   │      statistic.dart
│   │
│   ├── providers/
│   │
│   │      theme_provider.dart
│   │      workout_provider.dart
│   │      profile_provider.dart
│   │
│   ├── data/
│   │
│   │      dummy_workouts.dart
│   │      dummy_statistics.dart
│   │      dummy_profile.dart
│   │
│   ├── widgets/
│   │
│   │      buttons/
│   │      │
│   │      │      primary_button.dart
│   │      │      secondary_button.dart
│   │      │
│   │      cards/
│   │      │
│   │      │      workout_card.dart
│   │      │      statistic_card.dart
│   │      │      progress_card.dart
│   │      │
│   │      inputs/
│   │      │
│   │      │      custom_text_field.dart
│   │      │      password_field.dart
│   │      │
│   │      navigation/
│   │      │
│   │      │      bottom_nav_bar.dart
│   │      │      custom_app_bar.dart
│   │      │
│   │      common/
│   │             loading_indicator.dart
│   │             empty_state.dart
│   │             section_title.dart
│   │             progress_ring.dart
│   │             custom_switch.dart
│   │
│   ├── features/
│   │
│   │      splash/
│   │      │
│   │      │      splash_screen.dart
│   │      │
│   │      ├── onboarding/
│   │      │
│   │      │      onboarding_screen.dart
│   │      │      onboarding_page.dart
│   │      │
│   │      ├── auth/
│   │      │
│   │      │      login_screen.dart
│   │      │
│   │      ├── home/
│   │      │
│   │      │      home_screen.dart
│   │      │
│   │      ├── workout/
│   │      │
│   │      │      workout_details_screen.dart
│   │      │
│   │      ├── history/
│   │      │
│   │      │      history_screen.dart
│   │      │
│   │      ├── progress/
│   │      │
│   │      │      progress_screen.dart
│   │      │
│   │      ├── profile/
│   │      │
│   │      │      profile_screen.dart
│   │      │
│   │      └── settings/
│   │
│   │             settings_screen.dart
│   │
│   └── generated/
│
├── test/
│
├── .gitignore
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
└── README.md
```
---

# Application Screens

The application includes the following screens:

1. Splash Screen
2. Onboarding
3. Login
4. Home Dashboard
5. Workout Details
6. Activity History
7. Progress
8. Profile
9. Settings

---

# Screen Flow

```
Splash
    │
    ▼
Onboarding
    │
    ▼
Login
    │
    ▼
Home
 ├──────────────┐
 ▼              ▼
Workout     Progress
 │              │
 ▼              ▼
History      Profile
      │
      ▼
   Settings
```

---

# Reusable Widgets

The application is built using reusable widgets.

Buttons

* Primary Button
* Secondary Button

Cards

* Workout Card
* Progress Card
* Statistic Card

Inputs

* Text Field
* Password Field

Navigation

* Custom App Bar
* Bottom Navigation Bar

Common Components

* Progress Ring
* Toggle Switch
* Loading Indicator
* Empty State
* Section Title

---

# Theme System

The application uses a centralized theme.

## Colors

* Primary
* Secondary
* Accent
* Background
* Surface
* Card
* Success
* Warning
* Error
* Text Primary
* Text Secondary

## Typography

* Display
* Headline
* Title
* Subtitle
* Body
* Caption
* Button

---

# Folder Organization

The project follows a feature-first architecture.

```
Core
│
├── Constants
├── Theme
├── Routes
├── Services
└── Utilities

Features
│
├── Splash
├── Onboarding
├── Authentication
├── Home
├── Workout
├── History
├── Progress
├── Profile
└── Settings

Widgets
│
├── Buttons
├── Cards
├── Inputs
├── Navigation
└── Common
```

---

# Development Phases

## Phase 1

Project Initialization

* Create Flutter project
* Configure Android environment
* Initialize Git repository
* Connect GitHub repository

Status: Completed

---

## Phase 2

Project Configuration

* Configure pubspec.yaml
* Install dependencies
* Create assets folder
* Configure fonts and assets

Status: Completed

---

## Phase 3

Project Architecture

* Create scalable folder structure
* Configure feature-first architecture
* Organize assets
* Organize widgets

Status: Completed

---

## Phase 4

Design System

* Color system
* Typography
* Spacing
* Border radius
* Durations
* Shadows

Status: Pending

---

## Phase 5

Application Theme

* Material 3 Theme
* Light Theme
* Button Theme
* Input Theme
* Text Theme

Status: Pending

---

## Phase 6

Routing

* Route Names
* Route Generator
* Navigation Service

Status: Pending

---

## Phase 7

Reusable Components

* Buttons
* Cards
* Inputs
* Progress Indicators
* Toggles
* Navigation Components

Status: Pending

---

## Phase 8

Application Screens

* Splash
* Onboarding
* Login
* Home
* Workout
* History
* Progress
* Profile
* Settings

Status: Pending

---

## Phase 9

State Management

* Provider Setup
* Theme Provider
* Workout Provider
* Profile Provider

Status: Pending

---

## Phase 10

Dummy Data

* User
* Workouts
* Activities
* Statistics

Status: Pending

---

## Phase 11

Animations

* Page Transitions
* Hero Animations
* Lottie Animations
* Interactive Components

Status: Pending

---

## Phase 12

Responsive UI

* ScreenUtil Configuration
* Responsive Layouts
* Adaptive Components

Status: Pending

---

## Phase 13

Testing

* UI Testing
* Navigation Testing
* Responsiveness Testing

Status: Pending

---

## Phase 14

Figma Design

* Style Guide
* Components
* Screens
* Prototype
* Assets Export

Status: Pending

---

## Phase 15

Final Review

* UI Polish
* Bug Fixes
* Performance Improvements
* Documentation
* GitHub Push

Status: Pending

---

# Repository

GitHub Repository

https://github.com/Ashu11122000/FitTrack

---

# License

This project is developed for educational purposes as part of a Flutter mobile application assignment.
