// Import necessary packages for Firebase authentication and UI components
import 'package:biometric_fingerprint/const.dart';
import 'package:biometric_fingerprint/screens/shopping_home.dart';
import 'package:biometric_fingerprint/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';


import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Form key to validate the form fields
  final _formKey = GlobalKey<FormState>();

  // Controllers for email, name, password, and confirm password input fields
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Instance of AuthService
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    // Dispose of controllers to release resources when the widget is removed
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Sign-up function to handle Firebase user registration
  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      // Check if the password and confirm password fields match
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      try {
        // Show loading indicator
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Attempt to create a new user with email and password
        final user = await _authService.signUpWithEmailAndPassword(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _nameController.text.trim(),
        );

        if (user != null) {
          // If registration is successful, show a success message
          if (!mounted) return;

          // Close loading indicator
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully!')),
          );

          // Navigate to the ShoppingHomePage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ShoppingHomePage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        // Close loading indicator if it's showing
        if (mounted && Navigator.canPop(context)) {
          Navigator.pop(context);
        }

        // Handle Firebase authentication errors
        String errorMessage = 'An error occurred';

        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'An account already exists for that email';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Invalid email address';
        }

        // Show the error message in a snackbar
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      } catch (e) {
        // Close loading indicator if it's showing
        if (mounted && Navigator.canPop(context)) {
          Navigator.pop(context);
        }

        // Handle any other exceptions
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        }
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
      // Custom app bar with a back button
      appBar: const CustomAppBar(
        title: 'Sign Up',
        showBackButton: true,
        showProfileIcon: false,

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
                  'Create Account',
                  style: TextStyle(
                    color: appBarColor,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: verticalSpacing * 2),

                // Full Name input field using CustomTextField widget
                CustomTextField(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icons.person,
                  controller: _nameController,
                  fieldType: 'name',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: verticalSpacing),

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
                SizedBox(height: verticalSpacing),

                // Confirm password input field using CustomTextField widget
                CustomTextField(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  prefixIcon: Icons.lock_outline,
                  controller: _confirmPasswordController,
                  fieldType: 'confirmPassword',
                  isPassword: true,
                  passwordController: _passwordController,
                ),
                SizedBox(height: verticalSpacing * 2),

                // Sign-Up button using CustomButton widget
                CustomButton(
                  text: 'Sign Up',
                  fontSize: screenWidth * 0.04, // 4% of screen width
                  onPressed: _signUp, // Call the sign-up function
                  height: buttonHeight,
                  width: screenWidth * 0.9, // 90% of screen width
                ),
                SizedBox(height: verticalSpacing),

                // Back to Login button to navigate to the login page
                CustomButton(
                  text: 'Back to Login',
                  fontSize: screenWidth * 0.04, // 4% of screen width
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
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
