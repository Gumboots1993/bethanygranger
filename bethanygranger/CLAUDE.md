# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter project named "bethanygranger" - a cross-platform mobile/desktop/web application built with Flutter SDK 3.5.4+. The project is currently in early stages with a basic "Hello World" application.

## Platform Support

The project includes platform-specific code for:
- Android (Kotlin/Java)
- iOS (Swift)
- Web
- Windows (C++)
- macOS (Swift)

## Development Commands

### Running the Application
```bash
flutter run                    # Run on default device
flutter run -d chrome          # Run on Chrome (web)
flutter run -d windows         # Run on Windows
flutter run -d android         # Run on Android device/emulator
flutter run -d ios             # Run on iOS simulator
```

### Testing
```bash
flutter test                   # Run all tests
flutter test test/path/to/test_file.dart  # Run single test file
```

### Build
```bash
flutter build apk             # Build Android APK
flutter build appbundle       # Build Android App Bundle
flutter build ios             # Build iOS app
flutter build web             # Build web app
flutter build windows         # Build Windows app
flutter build macos           # Build macOS app
```

### Code Quality
```bash
flutter analyze               # Run static analysis
dart format .                 # Format all Dart files
dart format lib/             # Format lib directory only
```

### Dependencies
```bash
flutter pub get              # Install dependencies
flutter pub upgrade          # Upgrade dependencies
flutter pub outdated         # Check for outdated dependencies
```

### Cleanup
```bash
flutter clean                # Clean build artifacts
```

## Project Structure

- `lib/main.dart` - Application entry point containing MainApp widget
- `pubspec.yaml` - Project dependencies and metadata
- `analysis_options.yaml` - Uses flutter_lints for code analysis
- Platform-specific directories:
  - `android/` - Android native code and configuration
  - `ios/` - iOS native code and configuration
  - `web/` - Web-specific assets and configuration
  - `windows/` - Windows native code
  - `macos/` - macOS native code

## Android Configuration

- Package name: `com.example.bethanygranger`
- Min SDK: Defined by Flutter
- Target SDK: Defined by Flutter
- Currently uses debug signing for release builds (needs production signing config)

## Code Style

The project uses `flutter_lints` package for linting rules, which provides recommended Flutter code style guidelines.
