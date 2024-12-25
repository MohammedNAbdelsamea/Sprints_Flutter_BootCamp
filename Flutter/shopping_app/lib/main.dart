import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/shopping_home.dart';

import 'const.dart';


void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Hamdy',
      ),
      home: const ShoppingHomePage(),
    );
  }
}










