import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_first_flutter_project/widgets/custom_app_bar.dart';
import 'package:the_first_flutter_project/widgets/custom_text.dart';
import 'package:the_first_flutter_project/widgets/image_row.dart';

/// A page that displays an app bar, a greeting message, two images, and custom text.
/// This page is built using a `Scaffold` and organizes its content in a vertical column layout.
class ImageDisplayPage extends StatelessWidget {
  const ImageDisplayPage({super.key});

  /// Builds the main UI for the image display page.
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Set the background color of the page
      backgroundColor: Colors.white,

      // Use a custom app bar widget
      appBar: const CustomAppBarWidget(),

      // Main content of the page
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
        children: [
          // Display a greeting text at the top
          Text(
            'Hello, Sprints!',
            style: TextStyle(
              fontSize: 20, // Font size of the text
              fontWeight: FontWeight.bold, // Make the text bold
              fontFamily: 'Suwannaphum', // Use the custom Suwannaphum font
              color: Color(0xff004EFE), // Set the text color to a custom blue
            ),
            textAlign: TextAlign.center, // Center the text horizontally
          ),
          // Add some vertical space
          SizedBox(height: screenHeight * 0.05),

          // Display a row of two images (local and network)
          SizedBox(
            width: screenWidth, // Make the row responsive to screen width
            child: const Center(
              child: ImageRowWidget(), // Custom widget for displaying the images
            ),
          ),
          // Add some vertical space
          SizedBox(height: screenHeight * 0.05),

          // Display a customized text widget below the images
          const CustomTextWidget(),
        ],
      ),
    );
  }
}
