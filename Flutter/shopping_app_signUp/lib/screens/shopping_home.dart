import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/custom_app_bar.dart';
import 'package:shopping_app/widgets/product_grid.dart';
import '../const.dart';
import '../widgets/hot_offers.dart';

// Configuration class for ShoppingHomePage
class ShoppingHomeConfig {
  // Colors
  static const Color backgroundColor = Color(0xfff6f6f6);
  static const Color appBarColor = Color(0xff593db9);
  static const Color textColor = Colors.black;

  // Sizes
  static const double titleFontSizeRatio = 0.06;
  static const double pageViewHeightRatio = 0.3;
  static const double sectionSpacingRatio = 0.025;
  static const double bottomSpacingRatio = 0.05;

  // Padding
  static const double sectionPadding = 16.0;
}

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({Key? key}) : super(key: key);

  @override
  _ShoppingHomePageState createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  // Product data
  final List<String> productImages = [
    'assets/images/camera2.jpg',
    'assets/images/shoes.jpg',
    'assets/images/watch.jpg',
    'assets/images/perfume.jpg',
  ];

  final List<String> productsNames = [
    'Camera',
    'Shoes',
    'Watch',
    'Perfume',
  ];

  // Offers data
  final List<String> offersNames = [
    'Bag',
    'Glass',
    'Hat',
    'Head Phone',
    'Necktie',
  ];

  final List<String> offersImages = [
    'assets/images/bag.jpg',
    'assets/images/glass.jpg',
    'assets/images/hat.jpg',
    'assets/images/head_phone.jpg',
    'assets/images/Necktie.jpg',
  ];

  final List<String> offersValues = [
    '50% off',
    '30% off',
    '15% off',
    '23% off',
    '46% off',
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    // Calculate responsive measurements
    final double titleFontSize = screenWidth * ShoppingHomeConfig.titleFontSizeRatio;
    final double sectionSpacing = screenHeight * ShoppingHomeConfig.sectionSpacingRatio;
    final double bottomSpacing = screenHeight * ShoppingHomeConfig.bottomSpacingRatio;

    return Scaffold(
      backgroundColor: ShoppingHomeConfig.backgroundColor,
      appBar: const CustomAppBar(title: 'Shopping App',),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Products Section Title
            _buildSectionTitle('Our Products', titleFontSize),

            // Products PageView
            _buildProductsPageView(screenHeight),

            SizedBox(height: sectionSpacing),

            // Products Grid
            ProductGrid(
              productImages: productImages,
              productsNames: productsNames,
            ),

            SizedBox(height: sectionSpacing),

            // Hot Offers Section Title
            _buildSectionTitle('Hot Offers', titleFontSize),

            // Hot Offers List
            HotOffers(
              offersImages: offersImages,
              offersNames: offersNames,
              offersValues: offersValues,
            ),

            SizedBox(height: bottomSpacing),
          ],
        ),
      ),
    );
  }




  // Helper method to build section titles
  Widget _buildSectionTitle(String title, double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(ShoppingHomeConfig.sectionPadding),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: ShoppingHomeConfig.textColor,
        ),
      ),
    );
  }

  // Helper method to build products PageView
  Widget _buildProductsPageView(double screenHeight) {
    return SizedBox(
      height: screenHeight * ShoppingHomeConfig.pageViewHeightRatio,
      child: PageView.builder(
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ShoppingHomeConfig.sectionPadding,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                productImages[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}