import 'package:flutter/material.dart';
import 'image_display.dart';

/// The main entry point of the Flutter application.
void main() {
  runApp(const MyApp()); // Runs the MyApp widget
}

/// The root widget of the application.
/// Configures the app's theme, title, and initial home page.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// Builds the MaterialApp with theme and navigation settings.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      title: 'First Flutter Project', // Title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue, // Sets the primary color scheme
        fontFamily: 'Suwannaphum', // Applies the custom font globally
      ),
      home: const ImageDisplayPage(), // Sets the initial page to ImageDisplayPage
    );
  }
}
