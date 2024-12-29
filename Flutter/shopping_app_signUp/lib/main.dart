import 'package:flutter/material.dart';
import 'package:shopping_app/screens/shopping_home.dart';
import 'package:shopping_app/screens/sign_up_page.dart';

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
        fontFamily: 'Suwannaphum',
      ),
      home: const SignUpPage(),
    );
  }
}










