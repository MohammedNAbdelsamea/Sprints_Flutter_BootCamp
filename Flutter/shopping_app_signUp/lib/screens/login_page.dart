// Import necessary packages for Firebase authentication and UI components
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/const.dart';
import 'package:shopping_app/screens/shopping_home.dart';
import 'package:shopping_app/screens/sign_up_page.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

// LoginPage widget definition
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form key to validate the form fields
  final _formKey = GlobalKey<FormState>();

  // Controllers for email and password input fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers to release resources when the widget is removed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Login function to handle Firebase authentication
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Attempt to sign in with email and password
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (credential.user != null) {
          // If login is successful, show a success message
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );

          // Navigate to the ShoppingHomePage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ShoppingHomePage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        // Handle Firebase authentication errors
        String errorMessage = 'An error occurred';

        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Invalid email address';
        }

        // Show the error message in a snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Responsive design: calculate screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final verticalSpacing = screenHeight * 0.03; // 3% of screen height
    final horizontalPadding = screenWidth * 0.04; // 4% of screen width
    final titleFontSize = screenWidth * 0.08; // 8% of screen width
    final buttonHeight = screenHeight * 0.08; // 8% of screen height

    return Scaffold(
      // Custom app bar at the top
      appBar: const CustomAppBar(
        title: 'Login',
        showBackButton: false,
        actionButton: false,
      ),
      // SingleChildScrollView to handle overflow on smaller screens
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalSpacing,
          ),
          child: Form(
            key: _formKey, // Link the form to the global key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title text
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: appBarColor,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: verticalSpacing * 2),

                // Email input field using CustomTextField widget
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email,
                  controller: _emailController,
                  fieldType: 'email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: verticalSpacing),

                // Password input field using CustomTextField widget
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock,
                  controller: _passwordController,
                  fieldType: 'password',
                  isPassword: true,
                ),
                SizedBox(height: verticalSpacing * 2),

                // Login button using CustomButton widget
                CustomButton(
                  text: 'Login',
                  fontSize: screenWidth * 0.04, // 4% of screen width
                  onPressed: _login, // Call the login function
                  height: buttonHeight,
                  width: screenWidth * 0.9, // 90% of screen width
                ),
                SizedBox(height: verticalSpacing),

                // Sign Up button to navigate to SignUpPage
                CustomButton(
                  text: 'Sign Up',
                  fontSize: screenWidth * 0.04, // 4% of screen width
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  height: buttonHeight,
                  width: screenWidth * 0.9, // 90% of screen width
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
