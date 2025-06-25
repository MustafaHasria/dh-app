# TDH App

A modern Flutter application built with clean architecture principles, featuring user authentication, profile management, and secure API communication.

## 🚀 Features

- **User Authentication**
  - Login with email and password
  - User registration with validation
  - Secure token-based authentication
  - Auto-login with token validation

- **Profile Management**
  - View user profile information
  - Update personal information
  - Change password securely
  - Delete account functionality

- **Modern UI/UX**
  - Material Design 3 components
  - Custom AlexandriaFLF font family
  - Responsive design for all screen sizes
  - Intuitive navigation and user feedback

- **Clean Architecture**
  - Domain-driven design
  - Separation of concerns
  - Dependency injection with GetX
  - Repository pattern implementation

## 🏗️ Architecture

The app follows clean architecture principles with the following layers:

```
Presentation Layer (UI)
├── Controllers (GetX)
├── Views (Flutter Widgets)
└── Bindings (Dependency Injection)

Domain Layer (Business Logic)
├── Entities
├── Use Cases
└── Repository Interfaces

Data Layer (Data Management)
├── Repositories (Implementation)
├── Data Sources
└── Models
```

### Key Components

- **GetX State Management** - Reactive state management and dependency injection
- **Repository Pattern** - Clean data access abstraction
- **Use Case Pattern** - Business logic encapsulation
- **Dependency Injection** - GetX built-in DI for clean dependency management

## 🛠️ Tech Stack

- **Framework**: Flutter 3.x
- **State Management**: GetX
- **HTTP Client**: http package
- **Local Storage**: GetStorage
- **Architecture**: Clean Architecture
- **Dependency Injection**: GetX DI
- **UI**: Material Design 3

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/tdh_app.git
   cd tdh_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API endpoint**
   
   Update the API base URL in `lib/main.dart`:
   ```dart
   Get.put(ApiClient('https://your-api-endpoint.com/api'), permanent: true);
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── core/
│   ├── di/           # Dependency injection documentation
│   ├── network/      # API client and network utilities
│   └── storage/      # Local storage utilities
├── data/
│   ├── datasources/  # Remote data sources
│   ├── models/       # Data models
│   └── repositories/ # Repository implementations
├── domain/
│   ├── entities/     # Business entities
│   ├── repositories/ # Repository interfaces
│   └── usecases/     # Business logic use cases
├── presentation/
│   ├── bindings/     # GetX bindings for DI
│   ├── controllers/  # GetX controllers
│   └── views/        # UI screens
└── main.dart         # App entry point
```
**Made with ❤️ using Flutter Mustafa Hasria**
