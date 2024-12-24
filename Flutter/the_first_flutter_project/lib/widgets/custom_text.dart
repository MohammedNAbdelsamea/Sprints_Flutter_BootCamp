import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'The two images are displayed',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Suwannaphum',
        color: Color(0xff004EFE),
      ),
      textAlign: TextAlign.center,
    );
  }
}
