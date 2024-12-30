import 'package:flutter/material.dart';
import 'package:shopping_app/const.dart';

import 'package:shopping_app/screens/shopping_home.dart';
import '../widgets/custom_app_bar.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/fade_page_route.dart'; // Make sure to import your CustomTextField

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this, // Provides the ticker for the animation
      duration: const Duration(seconds: 3), // Duration of the fade-out animation
    );

    // Create a fade animation that goes from fully visible (1.0) to invisible (0.0)
    _fadeAnimation = Tween<double>(
      begin: 1.0, // Start fully visible
      end: 0.0,   // End fully transparent
    ).animate(
      // Apply easing curve to make the animation smooth
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut, // Easing curve for smooth fade-out
      ),
    );

    // Listen to animation status changes
    _fadeAnimation.addStatusListener((status) {
      // When the fade-out is complete and we're actually animating
      if (status == AnimationStatus.completed && _isAnimating) {
        // Navigate to the shopping home page with a fade-in transition
        Navigator.pushReplacement(
          context,
          FadePageRoute(page: const ShoppingHomePage()),
        );
      }
    });
  }
  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  // Show success dialog and trigger animation
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // User must use the button to dismiss
      builder: (BuildContext context) {
        return CustomDialog(
          message: 'Account created successfully !',
          onPressed: () async {
            Navigator.of(context).pop(); // Close the dialog
            setState(() => _isAnimating = true); // Start animation
            await _animationController.forward(); // Run the fade-out animation
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
        actionButton: false,
      ),
      // Wrap the body in AnimatedBuilder to rebuild when animation value changes
      body: AnimatedBuilder(
        animation: _fadeAnimation, // Listen to fade animation
        builder: (context, child) {
          // Apply opacity based on animation value
          return Opacity(
            opacity: _fadeAnimation.value, // Current opacity from animation
            child: child, // The actual content
          );
        },
        child: SingleChildScrollView(
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
                    'Let\'s get started !',
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
      ),
    );
  }
}