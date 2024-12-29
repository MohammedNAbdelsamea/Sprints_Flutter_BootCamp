// Create a new file called custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:shopping_app/const.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final bool centerTitle;
  final bool showBackButton; // New parameter

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = appBarColor,
    this.titleColor = Colors.white,
    this.centerTitle = true,
    this.showBackButton = true, // Default value
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: titleColor,
        ),
      ),
      centerTitle: centerTitle,
      leading: showBackButton
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}