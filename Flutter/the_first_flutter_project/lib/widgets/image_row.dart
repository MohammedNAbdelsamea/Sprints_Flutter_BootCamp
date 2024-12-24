import 'package:flutter/material.dart';

class ImageRowWidget extends StatelessWidget {
  const ImageRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/img.png',
          height: screenHeight * 0.2,
          width: screenWidth * 0.4,
        ),
        SizedBox(width: screenWidth * 0.05),
        Image.network(
          'https://imgs.search.brave.com/iJbBYb1Qt_QkcVOTuMjnNVx3asBwFyvJMDhEEjrZ7zA/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/c3ByaW50cy5haS9z/dG9yZS85MDA1ODEz/OC8xNzI3MjcwNjM1/NjZmNDBlZWIyMTIz/ZC5wbmc',
          height: screenHeight * 0.2,
          width: screenWidth * 0.4,
        ),
      ],
    );
  }
}
