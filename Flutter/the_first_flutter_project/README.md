
# Flutter Image Display App

A simple Flutter application that displays a custom app bar, text, and two images (one local and one from the network) with responsive sizing.

## Description

This Flutter project demonstrates basic UI elements including:
- Material Design implementation
- Image loading from both local assets and the network
- Responsive layouts using MediaQuery
- Custom theme with the Suwannaphum font
- Separation of concerns: Each widget is organized into its own file for maintainability

---

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio/VS Code with Flutter plugins

### Installation

1. **Clone or Create the Project**
   ```bash
   flutter create your_project_name
   ```

2. **Replace Files**
    - Replace the contents of `lib/` with the provided file structure:
      ```plaintext
      lib/
      ├── main.dart
      ├── image_display.dart
      ├── widgets/
          ├── custom_app_bar.dart
          ├── custom_text.dart
          └── image_row.dart
      ```

3. **Update `pubspec.yaml`**
   Update your `pubspec.yaml` file with the following:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     cupertino_icons: ^1.0.2

   flutter:
     uses-material-design: true
     assets:
       - assets/images/img.png
     fonts:
       - family: Suwannaphum
         fonts:
           - asset: assets/fonts/Suwannaphum-Regular.ttf
   ```

4. **Add Assets**
   Ensure the `assets/` folder contains:
   ```plaintext
   assets/
   ├── images/
   │   └── img.png
   └── fonts/
       └── Suwannaphum-Regular.ttf
   ```

5. **Run the App**
   Execute the following commands:
   ```bash
   flutter pub get
   flutter run
   ```

---

## Features

- Custom AppBar with a centered title
- Responsive image sizing based on screen dimensions
- Side-by-side display of local and network images
- Custom font implementation
- Organized widget files for maintainability
- Clean and minimal UI design

---

## Project Structure

### Main Components

- **`main.dart`**:
    - Root entry point for the Flutter application.
    - Configures the `MaterialApp` with theme data and fonts.

- **`image_display_page.dart`**:
    - Main page widget.
    - Implements responsive layout.
    - Handles image display.
    - Contains text elements.

- **Widgets**:
    - **`custom_app_bar.dart`**:
        - Custom AppBar widget with a blue background and bold white title.
    - **`image_row.dart`**:
        - Widget displaying two images in a row (one from assets, one from the network) with responsive sizing.
    - **`custom_text.dart`**:
        - Widget for displaying customized text with a bold font, specific font size, and color.

---

## Customization

### Changing Colors
Modify the primary color in the AppBar by updating the color value:
```dart
backgroundColor: Color(0xff004EFE)
```

### Modifying Image Sources
- **Local image**: Update the file path in `assets/images/`.
- **Network image**: Replace the URL in `Image.network()`.

### Adjusting Sizes
Customize dimensions by modifying MediaQuery calculations:
```dart
height: screenHeight * 0.2,
width: screenWidth * 0.4,
```

---

## Dependencies

- Flutter SDK
- Material Design package
- Suwannaphum font family

---

## Acknowledgments
- Flutter Documentation
- Community tutorials and resources
