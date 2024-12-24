import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_first_flutter_project/widgets/custom_app_bar.dart';
import 'package:the_first_flutter_project/widgets/custom_text.dart';
import 'package:the_first_flutter_project/widgets/image_row.dart';

class ImageDisplayPage extends StatelessWidget {
  const ImageDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello, Sprints!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Suwannaphum',
              color: Color(0xff004EFE),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.05),
          // Row of two images
          SizedBox(
            width: screenWidth,
            child: const Center(
              child: ImageRowWidget(),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          // Customized text
          const CustomTextWidget(),
        ],
      ),
    );
  }
}