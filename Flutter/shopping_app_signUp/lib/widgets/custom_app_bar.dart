import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/const.dart';
import '../screens/shopping_home.dart';

// Custom AppBar widget that implements PreferredSizeWidget for proper sizing
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  // Properties for customizing the AppBar
  final String title;              // Title text to display
  final Color backgroundColor;     // Background color of AppBar
  final Color titleColor;          // Color of the title text
  final bool centerTitle;          // Whether to center the title
  final bool showBackButton;       // Whether to show back button
  final bool actionButton;         // Whether to show language switch button

  // Constructor with default values
  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = appBarColor,
    this.titleColor = Colors.white,
    this.centerTitle = true,
    this.showBackButton = true,
    this.actionButton = true,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  // Required by PreferredSizeWidget to set AppBar height
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  // Flag to prevent multiple rapid language changes
  bool isChangingLocale = false;

  // Method to handle language change
  Future<void> _changeLanguage() async {
    if (isChangingLocale) return; // Prevent multiple clicks

    setState(() {
      isChangingLocale = true;
    });

    try {
      // Change language based on current locale
      if (context.locale == const Locale('en')) {
        await context.setLocale(const Locale('ar'));
      } else {
        await context.setLocale(const Locale('en'));
      }

      if (mounted) {
        // Rebuild the entire app to reflect language change
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ShoppingHomePage(),
          ),
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
    return AppBar(
      backgroundColor: widget.backgroundColor,
      // Title with translation using .tr() extension
      title: Text(
        widget.title.tr(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: widget.titleColor,
        ),
      ),
      centerTitle: widget.centerTitle,
      // Back button configuration
      leading: widget.showBackButton
          ? IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      )
          : null,
      // Actions section (language switch button)
      actions: [
        if (widget.actionButton)
          IconButton(
            onPressed: isChangingLocale ? null : _changeLanguage,
            icon: isChangingLocale
                ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
                : const Icon(
              Icons.g_translate_outlined,
              color: Colors.white,
            ),
          )
        else
          Container(),
      ],
    );
  }
}