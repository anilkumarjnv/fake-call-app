# FakeCall App Blueprint

## Overview

This document outlines the architecture and setup for the FakeCall Flutter application. The app is designed to simulate incoming phone calls for entertainment purposes, adhering to Google Play policies. It follows a strict Clean Architecture pattern to ensure separation of concerns, scalability, and maintainability.

## Project Structure (Clean Architecture)

```
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── utils/
│   └── theme/
│
├── features/
│   └── fake_call/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── local/
│       │   ├── models/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       └── presentation/
│           ├── controllers/
│           ├── pages/
│           └── widgets/
│
├── di/
│   └── injection_container.dart
│
└── main.dart
```

## Implemented Features & Style

*   **Architecture**: Clean Architecture with Domain, Data, and Presentation layers.
*   **State Management**: Riverpod for managing UI state.
*   **Dependency Injection**: Manual DI via a centralized `injection_container.dart`.
*   **UI**: Material 3 with a neutral color palette and support for dark mode.
*   **Core Functionality (Setup)**:
    *   Scheduling a fake call.
    *   Handling local notifications for the call.
    *   Managing audio playback.
    *   Keeping the screen awake during the call.

## Current Plan

1.  **Initialize Project**: Set up the initial Flutter project.
2.  **Create Directory Structure**: Create the folders for the Clean Architecture layers.
3.  **Update `pubspec.yaml`**: Add all required dependencies for Riverpod, local notifications, audio, etc.
4.  **Create Core Files**:
    *   `main.dart`: The application entry point with Riverpod setup.
    *   `di/injection_container.dart`: The skeleton for dependency injection.
5.  **Domain Layer**:
    *   Define `FakeCallEntity`.
    *   Define the `FakeCallRepository` abstract class.
    *   Define the use cases: `ScheduleFakeCall`, `StartFakeCall`, `EndFakeCall`.
6.  **Data Layer**:
    *   Create `FakeCallModel`.
    *   Create `FakeCallLocalDataSource` for handling notifications and audio.
    *   Create `FakeCallRepositoryImpl` to implement the repository interface.
7.  **Presentation Layer**:
    *   Create empty page scaffolds for `SetupPage`, `IncomingCallPage`, and `ActiveCallPage`.
    *   Create a basic `FakeCallController` using Riverpod.
8.  **Android Configuration**: Note the necessary permissions in `AndroidManifest.xml`.
