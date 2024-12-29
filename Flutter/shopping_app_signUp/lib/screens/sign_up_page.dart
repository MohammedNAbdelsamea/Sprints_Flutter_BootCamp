import 'package:flutter/material.dart';
import 'package:shopping_app/const.dart';

import 'package:shopping_app/screens/shopping_home.dart';
import '../widgets/custom_app_bar.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_text_form_field.dart'; // Make sure to import your CustomTextField

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomDialog(
          message: 'Account created successfully !',
          onPressed: () {
            // Navigate to ShoppingHomePage when dialog button is pressed
            Navigator.of(context).pop();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ShoppingHomePage()));
          },
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showSuccessDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate responsive sizes
    final verticalSpacing = screenHeight * 0.03; // 3% of screen height
    final horizontalPadding = screenWidth * 0.04; // 4% of screen width
    final titleFontSize = screenWidth * 0.08; // 8% of screen width
    final buttonHeight = screenHeight * 0.08; // 8% of screen height

    return Scaffold(
      appBar:
      // CustomAppBar widget with title 'Sign Up' and no back button
      const CustomAppBar(
        title: 'Sign Up',
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalSpacing,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Let\'s get started!',
                  style: TextStyle(
                    color: appBarColor,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: verticalSpacing * 1.5),
                //CustomTextField widget for Full Name
                CustomTextField(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icons.person,
                  controller: _nameController,
                  fieldType: 'name',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: verticalSpacing),
                //CustomTextField widget for Email
                CustomTextField(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email,
                  controller: _emailController,
                  fieldType: 'email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: verticalSpacing),
                //CustomTextField widget for Password
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock,
                  controller: _passwordController,
                  fieldType: 'password',
                  isPassword: true,
                ),
                SizedBox(height: verticalSpacing),
                //CustomTextField widget for Confirm Password
                CustomTextField(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  prefixIcon: Icons.lock_outline,
                  controller: _confirmPasswordController,
                  fieldType: 'confirmPassword',
                  isPassword: true,
                  passwordController: _passwordController,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: verticalSpacing * 2),
                //CustomButton widget for Sign Up
                CustomButton(
                  text: 'Sign Up',
                  fontSize: screenWidth * 0.04, // 4% of screen width
                  onPressed: _submitForm,
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