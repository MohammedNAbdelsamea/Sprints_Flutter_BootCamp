import 'package:biometric_fingerprint/const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'circle_offer_image.dart';

// Configuration class for HotOffers widget containing responsive ratios and styling
class HotOffersConfig {
  static const double containerHeightRatio = 0.15;        // Height ratio relative to screen height
  static const double containerWidthRatio = 0.8;          // Width ratio relative to screen width
  static const double horizontalMarginRatio = 0.02;       // Margin ratio for horizontal spacing
  static const double elementSpacingRatio = 0.03;         // Spacing ratio between elements
  static const double fontSizeRatio = 0.04;               // Font size ratio relative to screen width
  static const Color cardColor = primaryColor;            // Card background color
  static const double cardElevation = 2.0;               // Card shadow elevation
}

// StatefulWidget for displaying hot offers in a horizontal scrollable list
class HotOffers extends StatefulWidget {
  // Lists containing offer data
  final List<String> offersImages;    // Paths to offer images
  final List<String> offersNames;     // Translated offer names
  final List<String> offersValues;    // Translated offer values (e.g., "50% OFF")

  const HotOffers({
    super.key,
    required this.offersImages,
    required this.offersNames,
    required this.offersValues,
  });

  @override
  _HotOffersState createState() => _HotOffersState();
}

class _HotOffersState extends State<HotOffers> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive layout
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Calculate responsive measurements
    final double containerHeight = screenHeight * HotOffersConfig.containerHeightRatio;
    final double containerWidth = screenWidth * HotOffersConfig.containerWidthRatio;
    final double horizontalMargin = screenWidth * HotOffersConfig.horizontalMarginRatio;
    final double elementSpacing = screenWidth * HotOffersConfig.elementSpacingRatio;
    final double fontSize = screenWidth * HotOffersConfig.fontSizeRatio;

    // Main container for horizontal scrolling list
    return SizedBox(
      height: containerHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),  // Bouncing effect when scrolling
        itemCount: widget.offersImages.length,
        itemBuilder: (context, index) {
          return _buildOfferCard(
            context: context,
            index: index,
            containerWidth: containerWidth,
            horizontalMargin: horizontalMargin,
            elementSpacing: elementSpacing,
            fontSize: fontSize,
          );
        },
      ),
    );
  }

  // Helper method to build individual offer cards
  Widget _buildOfferCard({
    required BuildContext context,
    required int index,
    required double containerWidth,
    required double horizontalMargin,
    required double elementSpacing,
    required double fontSize,
  }) {
    return Container(
      width: containerWidth,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: Card(
        color: HotOffersConfig.cardColor,
        elevation: HotOffersConfig.cardElevation,
        child: Padding(
          padding: EdgeInsets.all(horizontalMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side of the card (image and name)
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    // Circular offer image
                    CircularOfferImage(
                      imagePath: widget.offersImages[index],
                    ),
                    SizedBox(width: elementSpacing),
                    // Offer name with overflow handling
                    Flexible(
                      child: Text(
                        widget.offersNames[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Right side of the card (offer value)
              Expanded(
                flex: 2,
                child: Text(
                  widget.offersValues[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}