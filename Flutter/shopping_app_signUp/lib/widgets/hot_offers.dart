import 'package:flutter/material.dart';
import 'package:shopping_app/const.dart';
import 'circle_offer_image.dart';

// Configuration class for HotOffers
class HotOffersConfig {
  // Layout configurations
  static const double containerHeightRatio = 0.15;
  static const double containerWidthRatio = 0.8;

  // Spacing configurations
  static const double horizontalMarginRatio = 0.02;
  static const double elementSpacingRatio = 0.04;

  // Text configurations
  static const double fontSizeRatio = 0.04;

  // Colors
  static const Color cardColor = primaryColor;
  static const double cardElevation = 2.0;
}

class HotOffers extends StatelessWidget {
  // Lists to hold offer data
  final List<String> offersImages;
  final List<String> offersNames;
  final List<String> offersValues;

  const HotOffers({
    super.key,
    required this.offersImages,
    required this.offersNames,
    required this.offersValues,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Calculate responsive measurements
    final double containerHeight = screenHeight * HotOffersConfig.containerHeightRatio;
    final double containerWidth = screenWidth * HotOffersConfig.containerWidthRatio;
    final double horizontalMargin = screenWidth * HotOffersConfig.horizontalMarginRatio;
    final double elementSpacing = screenWidth * HotOffersConfig.elementSpacingRatio;
    final double fontSize = screenWidth * HotOffersConfig.fontSizeRatio;

    return SizedBox(
      height: containerHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: offersImages.length,
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
              // Left side: Image and Name
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    CircularOfferImage(
                      imagePath: offersImages[index],
                    ),
                    SizedBox(width: elementSpacing),
                    Flexible(
                      child: Text(
                        offersNames[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          color: Colors.white
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              // Right side: Offer Value
              Expanded(
                flex: 2,
                child: Text(
                  offersValues[index],
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