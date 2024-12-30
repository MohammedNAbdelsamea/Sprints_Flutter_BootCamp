// utils/fade_page_route.dart
import 'package:flutter/material.dart';

/// Custom page route that provides a fade transition animation between pages
class FadePageRoute extends PageRouteBuilder {
  // The widget (page) to transition to
  final Widget page;

  FadePageRoute({required this.page})
      : super(
    // PageRouteBuilder constructor
    // pageBuilder defines the page that will be navigated to
    pageBuilder: (context, animation, secondaryAnimation) => page,

    // transitionsBuilder defines how the transition animation will look
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation, // The primary animation
        Animation<double> secondaryAnimation, // The secondary animation
        Widget child, // The page being navigated to
        ) {
      return FadeTransition(
        // Animate the opacity from 0.0 to 1.0
        opacity: Tween<double>(
          begin: 0.0, // Start completely transparent
          end: 1.0, // End completely opaque
        ).animate(
          // Apply a curve to the animation
          CurvedAnimation(
            parent: animation, // Use the route's built-in animation
            curve: Curves.easeOut, // Use a bounce effect for the fade
          ),
        ),
        // The widget being animated
        child: child,
      );
    },
    // How long the transition animation should take
    transitionDuration: const Duration(milliseconds: 500),
  );
}