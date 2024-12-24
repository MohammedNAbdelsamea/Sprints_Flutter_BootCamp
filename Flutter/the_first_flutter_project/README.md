# Flutter Image Display App

A simple Flutter application that displays a custom app bar, text, and two images (one local and one from network) with responsive sizing.

## Description

This Flutter project demonstrates basic UI elements including:
- Material Design implementation
- Image loading from both local assets and network
- Responsive layouts using MediaQuery
- Custom theme with Suwannaphum font

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio/VS Code with Flutter plugins

### Installation

1. Clone this repository or create a new Flutter project
   ```bash
   flutter create your_project_name
   ```

2. Replace the contents of lib/main.dart with the provided code

3. Update your pubspec.yaml with the following:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     cupertino_icons: ^1.0.2

   flutter:
     assets:
       - assets/images/img.png
     fonts:
       - family: Suwannaphum
         fonts:
           - asset: assets/fonts/Suwannaphum-Regular.ttf
   ```

4. Create the following directory structure:
   ```
   your_project_name/
   ├── lib/
   │   └── main.dart
   ├── assets/
   │   ├── images/
   │   │   └── img.png
   │   └── fonts/
   │       └── Suwannaphum-Regular.ttf
   └── pubspec.yaml
   ```

5. Run the following commands:
   ```bash
   flutter pub get
   flutter run
   ```

## Features

- Custom AppBar with centered title
- Responsive image sizing based on screen dimensions
- Side-by-side display of local and network images
- Custom font implementation
- Clean and minimal UI design

## Project Structure

### Main Components

- `MyApp`: Root widget that configures the MaterialApp
    - Sets theme data
    - Disables debug banner
    - Sets custom font family

- `ImageDisplayPage`: Main page widget
    - Implements responsive layout
    - Handles image display
    - Contains text elements

## Customization

### Changing Colors
The primary color can be modified by updating the Color value in AppBar:
```dart
backgroundColor: Color(0xff004EFE)
```

### Modifying Image Sources
- Local image: Update the path in `assets/images/`
- Network image: Replace the URL in `Image.network()`

### Adjusting Sizes
Modify the multipliers in MediaQuery calculations:
```dart
height: screenHeight * 0.2,
width: screenWidth * 0.4,
```

## Dependencies

- Flutter SDK
- Material Design package
- Suwannaphum font family