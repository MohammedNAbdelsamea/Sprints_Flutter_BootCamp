import 'package:flutter/material.dart';

/// A custom text widget that displays a styled text message.
/// This widget can be reused wherever the same text style is needed.
class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({Key? key}) : super(key: key);

  /// Builds a Text widget with custom styling.
  @override
  Widget build(BuildContext context) {
    return const Text(
      // The text to display
      'The two images are displayed',

      // Custom styling for the text
      style: TextStyle(
        fontSize: 20, // Sets the font size to 20
        fontWeight: FontWeight.bold, // Makes the text bold
        fontFamily: 'Suwannaphum', // Sets the font family to 'Suwannaphum'
        color: Color(0xff004EFE), // Sets the text color to a custom blue
      ),

      // Centers the text horizontally within its parent widget
      textAlign: TextAlign.center,
    );
  }
}
