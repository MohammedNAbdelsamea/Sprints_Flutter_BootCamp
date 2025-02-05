import 'package:biometric_fingerprint/widgets/custom_app_bar.dart';
import 'package:biometric_fingerprint/widgets/product_grid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../widgets/hot_offers.dart';

// Configuration class containing static values for the ShoppingHomePage
class ShoppingHomeConfig {
  // Colors configuration
  static const Color backgroundColor = Color(0xfff6f6f6);
  static const Color appBarColor = Color(0xff593db9);
  static const Color textColor = Colors.black;

  // Responsive size ratios
  static const double titleFontSizeRatio = 0.06;      // Title font size relative to screen width
  static const double pageViewHeightRatio = 0.3;      // PageView height relative to screen height
  static const double sectionSpacingRatio = 0.025;    // Spacing between sections
  static const double bottomSpacingRatio = 0.05;      // Bottom padding ratio

  // Fixed padding values
  static const double sectionPadding = 16.0;
}

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({Key? key}) : super(key: key);

  @override
  _ShoppingHomePageState createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  // Static image paths for products
  final List<String> productImages = [
    'assets/images/camera2.jpg',
    'assets/images/shoes.jpg',
    'assets/images/watch.jpg',
    'assets/images/perfume.jpg',
  ];

  // Lists that will hold translated strings
  late List<String> productsNames;    // Product names in current language
  late List<String> offersNames;      // Offer names in current language
  late List<String> offersValues;     // Offer values in current language

  // Static image paths for offers
  final List<String> offersImages = [
    'assets/images/bag.jpg',
    'assets/images/glass.jpg',
    'assets/images/hat.jpg',
    'assets/images/head_phone.jpg',
    'assets/images/Necktie.jpg',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTranslations();  // Update translations when dependencies change (e.g., locale)
  }

  // Method to update all translated strings
  void _updateTranslations() {
    // Translate product names
    productsNames = [
      'camera',
      'shoes',
      'watch',
      'perfume',
    ].map((e) => e.tr()).toList();

    // Translate offer names
    offersNames = [
      'bag',
      'glass',
      'hat',
      'head_phone',
      'necktie',
    ].map((e) => e.tr()).toList();

    // Create list of translated offer values
    offersValues = List.filled(5, '50%_off'.tr());
  }
  bool isChangingLocale = false;

  // Add the translation method
  Future<void> _changeLanguage() async {
    if (isChangingLocale) return;

    setState(() {
      isChangingLocale = true;
    });

    try {
      if (context.locale == const Locale('en')) {
        await context.setLocale(const Locale('ar'));
      } else {
        await context.setLocale(const Locale('en'));
      }

      if (mounted) {
        // Update translations after language change
        _updateTranslations();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('language_changed'.tr())),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('error_changing_language'.tr())),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isChangingLocale = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive layout
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    // Calculate responsive sizes
    final double titleFontSize = screenWidth * ShoppingHomeConfig.titleFontSizeRatio;
    final double sectionSpacing = screenHeight * ShoppingHomeConfig.sectionSpacingRatio;
    final double bottomSpacing = screenHeight * ShoppingHomeConfig.bottomSpacingRatio;

    return Scaffold(
      backgroundColor: ShoppingHomeConfig.backgroundColor,
      appBar: const CustomAppBar(
        title: 'Shopping App',
        showBackButton: true,

        showProfileIcon: true, // Enable profile icon
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('our_product', titleFontSize),
            _buildProductsPageView(screenHeight),
            SizedBox(height: sectionSpacing),
            ProductGrid(
              productImages: productImages,
              productsNames: productsNames,
            ),
            SizedBox(height: sectionSpacing),
            _buildSectionTitle('hot_offers', titleFontSize),
            HotOffers(
              offersImages: offersImages,
              offersNames: offersNames,
              offersValues: offersValues,
            ),
            SizedBox(height: bottomSpacing),
          ],
        ),

      ),
      // Add FloatingActionButton for language switching
      floatingActionButton: FloatingActionButton(
        onPressed: isChangingLocale ? null : _changeLanguage,
        backgroundColor: appBarColor,
        child: isChangingLocale
            ? const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        )
            : const Icon(
          Icons.g_translate_outlined,
          color: Colors.white,
        ),
      ),
      // Optional: Adjust FAB position if needed
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Helper method to build section titles with translations
  Widget _buildSectionTitle(String title, double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(ShoppingHomeConfig.sectionPadding),
      child: Text(
        title.tr(),  // Translate the title
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: ShoppingHomeConfig.textColor,
        ),
      ),
    );
  }

  // Helper method to build the products PageView
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