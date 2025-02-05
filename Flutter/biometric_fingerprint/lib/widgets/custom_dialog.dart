// widgets/custom_dialog.dart
import 'package:flutter/material.dart';

import '../screens/shopping_home.dart';
import 'fade_page_route.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;
  final Color? iconColor;
  final IconData? icon;

  const CustomDialog({
    Key? key,
    this.title = 'Success',
    required this.message,
    this.buttonText = 'Close',
    required this.onPressed,
    this.iconColor = Colors.green,
    this.icon = Icons.check_circle,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive sizes
    final dialogWidth = screenWidth * 0.85; // 85% of screen width
    final iconSize = screenWidth * 0.06; // 6% of screen width
    final titleFontSize = screenWidth * 0.045; // 4.5% of screen width
    final messageFontSize = screenWidth * 0.04; // 4% of screen width
    final buttonFontSize = screenWidth * 0.035; // 3.5% of screen width
    final spacing = screenWidth * 0.02; // 2% of screen width
    final padding = screenWidth * 0.04; // 4% of screen width

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          (screenWidth * 0.03).clamp(12.0, 20.0), // Responsive border radius
        ),
      ),
      elevation: 5,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: dialogWidth.clamp(280.0, 400.0), // Min 280, max 400
          maxHeight: screenHeight * 0.3, // 30% of screen height
        ),
        padding: EdgeInsets.all(padding.clamp(16.0, 24.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: iconSize.clamp(24.0, 32.0), // Min 24, max 32
                ),
                SizedBox(width: spacing.clamp(8.0, 16.0)),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize.clamp(18.0, 24.0), // Min 18, max 24
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing * 1.5),
            Text(
              message,
              style: TextStyle(
                fontSize: messageFontSize.clamp(14.0, 18.0), // Min 14, max 18
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: spacing * 2),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                //onPressed:()=> _handleClose(context),
                onPressed:onPressed,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: padding.clamp(16.0, 24.0),
                    vertical: padding * 0.5,
                  ),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: buttonFontSize.clamp(14.0, 16.0), // Min 14, max 16
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}