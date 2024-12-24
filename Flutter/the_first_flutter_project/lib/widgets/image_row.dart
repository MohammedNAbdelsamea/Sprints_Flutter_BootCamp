import 'package:flutter/material.dart';

/// A custom widget that displays two images side by side in a row.
/// One image is loaded from local assets, and the other is loaded from a network URL.
/// The sizes of the images are responsive to the screen dimensions.
class ImageRowWidget extends StatelessWidget {
  const ImageRowWidget({Key? key}) : super(key: key);

  /// Builds a Row widget containing two images with a gap between them.
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      // Center the images horizontally in the row
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // First image loaded from local assets
        Image.asset(
          'assets/images/img.png', // Path to the local image
          height: screenHeight * 0.2, // Set height relative to screen size
          width: screenWidth * 0.4,  // Set width relative to screen size
        ),
        // Gap between the two images
        SizedBox(width: screenWidth * 0.05),
        // Second image loaded from a network URL
        Image.network(
          'https://imgs.search.brave.com/iJbBYb1Qt_QkcVOTuMjnNVx3asBwFyvJMDhEEjrZ7zA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/c3ByaW50cy5haS9z/dG9yZS85MDA1ODEz/OC8xNzI3MjcwNjM1/NjZmNDBlZWIyMTIz/ZC5wbmc', // Network image URL
          height: screenHeight * 0.2, // Set height relative to screen size
          width: screenWidth * 0.4,  // Set width relative to screen size
        ),
      ],
    );
  }
}
