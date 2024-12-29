import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  // Lists to hold product data
  final List<String> productImages;
  final List<String> productsNames;

  const ProductGrid({
    super.key,
    required this.productImages,
    required this.productsNames,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Calculate responsive measurements
    final double horizontalPadding = screenWidth * 0.04; // 4% of screen width
    final double gridSpacing = screenWidth * 0.04; // 4% of screen width
    final double aspectRatio = screenWidth > 600 ? 0.9 : 0.8; // Adjust for tablets

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: GridView.builder(
        // Grid configuration
        physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
        shrinkWrap: true, // Take only needed space

        // Grid layout settings
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _calculateCrossAxisCount(screenWidth), // Responsive column count
          crossAxisSpacing: gridSpacing, // Horizontal spacing between items
          mainAxisSpacing: gridSpacing, // Vertical spacing between items
          childAspectRatio: aspectRatio, // Width to height ratio of items
        ),

        // Grid items
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return ProductCard(
            image: productImages[index],
            name: productsNames[index],
          );
        },
      ),
    );
  }

  // Helper method to calculate number of columns based on screen width
  int _calculateCrossAxisCount(double screenWidth) {
    if (screenWidth > 900) {
      return 4; // 4 columns for large screens
    } else if (screenWidth > 600) {
      return 3; // 3 columns for medium screens
    } else {
      return 2; // 2 columns for small screens
    }
  }
}