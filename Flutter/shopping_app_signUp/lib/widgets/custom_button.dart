// widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:shopping_app/const.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;  // Made optional
  final double? height; // Made optional
  final double? fontSize; // Made optional

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive dimensions
    final buttonWidth = width ?? screenWidth * 0.9; // 90% of screen width if not provided
    final buttonHeight = height ?? screenHeight * 0.08; // 8% of screen height if not provided
    final responsiveFontSize = fontSize ?? screenWidth * 0.04; // 4% of screen width if not provided

    // Calculate responsive padding
    final verticalPadding = screenHeight * 0.015; // 1.5% of screen height

    // Calculate responsive border radius
    final borderRadius = screenWidth * 0.02; // 2% of screen width

    return SizedBox(
      width: buttonWidth.clamp(200.0, screenWidth * 0.9), // Min width of 200
      height: buttonHeight.clamp(48.0, 70.0), // Min height of 48, max of 70
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: appBarColor,
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.clamp(8.0, 16.0)),
          ),
          elevation: 3,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: responsiveFontSize.clamp(14.0, 24.0), // Min 14, max 24
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}