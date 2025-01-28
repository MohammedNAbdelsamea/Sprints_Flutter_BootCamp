import 'package:flutter/material.dart';
import 'package:user_info_firebase/pages/user_info_form.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp()); // Run the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'User Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set app theme
      ),
      home: UserInfoForm(), // Set the home page
    );
  }
}
