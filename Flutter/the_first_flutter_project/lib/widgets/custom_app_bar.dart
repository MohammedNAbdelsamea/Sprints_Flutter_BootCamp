import 'package:flutter/material.dart';

/// A custom AppBar widget that implements PreferredSizeWidget.
/// This widget can be reused wherever a custom AppBar is required.
class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);

  /// Builds the AppBar with a custom background color, title, and centered text.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Sets the background color of the AppBar
      backgroundColor: const Color(0xff004EFE),

      // Sets the title of the AppBar with custom styling
      title: const Text(
        'My First Project',
        style: TextStyle(
          color: Colors.white, // White text color
          fontWeight: FontWeight.bold, // Bold font weight
        ),
      ),

      // Centers the title in the AppBar
      centerTitle: true,
    );
  }

  /// Specifies the preferred size for the AppBar.
  /// This is required when implementing the PreferredSizeWidget interface.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
