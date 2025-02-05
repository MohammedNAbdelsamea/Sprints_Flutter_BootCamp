import 'package:flutter/material.dart';
import '../const.dart';

class CircularOfferImage extends StatelessWidget {
  // Image path for the offer
  final String imagePath;

  // Constructor
  const CircularOfferImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Calculate responsive measurements
    final double imageSize = _calculateImageSize(screenWidth);
    final double borderWidth = screenWidth * 0.002; // Border width relative to screen
    final double paddingSize = screenWidth * 0.02; // Padding relative to screen

    return Padding(
      padding: EdgeInsets.all(paddingSize),
      child: Container(
        // Container dimensions
        width: imageSize,
        height: imageSize,

        // Circular decoration
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: borderWidth,
          ),
          // Optional shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: screenWidth * 0.01,
              offset: Offset(0, screenWidth * 0.005),
            ),
          ],
        ),

        // Circular image clip
        child: ClipOval(

          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,

            width: imageSize,
            height: imageSize,
          ),
        ),
      ),
    );
  }

  // Helper method to calculate image size based on screen width
  double _calculateImageSize(double screenWidth) {
    // Base size calculation
    double baseSize = screenWidth * 0.2; // 20% of screen width

    // Adjust size based on screen width breakpoints
    if (screenWidth > 600) {
      baseSize = screenWidth * 0.15; // 15% for tablets
    } else if (screenWidth > 900) {
      baseSize = screenWidth * 0.1; // 10% for desktop
    }

    // Ensure minimum and maximum sizes
    const double minSize = 40.0;
    const double maxSize = 120.0;

    return baseSize.clamp(minSize, maxSize);
  }
}