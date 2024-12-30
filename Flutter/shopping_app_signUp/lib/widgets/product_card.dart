import 'package:flutter/material.dart';

import '../const.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;

  const ProductCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Calculate responsive sizes
    final double cardWidth = (screenWidth - 48) / 2; // Account for padding and 2 cards per row
    final double imageSize = cardWidth * 0.8; // Image takes 80% of card width
    final double imageHeight = imageSize * 0.75; // Image height is 75% of its width
    final double iconSize = screenWidth * 0.07; // Icon size relative to screen width
    final double fontSize = screenWidth * 0.04; // Text size relative to screen width
    final double borderRadius = screenWidth * 0.02; // Border radius relative to screen width
    final double padding = screenWidth * 0.02; // Padding relative to screen width



    return Card(
      elevation: 4.0,
      color: cardColor,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Product Image Container
            Container(
              width: imageSize,
              height: imageHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(
                  image,
                  width: imageSize,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Spacing between image and text
            SizedBox(height: screenHeight * 0.015),
            // Product Name
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
              textAlign: TextAlign.center,
            ),
            // Add to Cart Button
            IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                size: iconSize,
                color: primaryColor,
              ),
              onPressed: () {
                // Show add to cart notification
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Item added to the cart!',
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                      ),
                    ),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating, // Makes SnackBar float
                    shape: RoundedRectangleBorder( // Rounds SnackBar corners
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    margin: EdgeInsets.all(padding), // Adds margin around SnackBar
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}