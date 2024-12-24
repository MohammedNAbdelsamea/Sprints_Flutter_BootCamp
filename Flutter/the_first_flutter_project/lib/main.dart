import 'package:flutter/material.dart';
import 'image_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Flutter Project',
      theme: ThemeData(primarySwatch: Colors.blue,
      fontFamily: 'Suwannaphum',
      ),
      home: const ImageDisplayPage(),
    );
  }
}


