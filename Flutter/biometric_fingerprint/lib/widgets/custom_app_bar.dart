import 'package:biometric_fingerprint/const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart'; // Add this import for biometric authentication

import '../screens/shopping_home.dart';
import '../screens/profile_page.dart'; // Import the profile page

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final bool centerTitle;
  final bool showBackButton;
  final bool showProfileIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = appBarColor,
    this.titleColor = Colors.white,
    this.centerTitle = true,
    this.showBackButton = true,
    this.showProfileIcon = true,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<void> _authenticateAndNavigate() async {
    try {
      bool canAuthenticate = await _localAuth.canCheckBiometrics;
      if (!canAuthenticate) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Biometric authentication not available')),
        );
        return;
      }

      bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to access your profile',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (isAuthenticated && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authentication failed')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      title: Text(
        widget.title.tr(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: widget.titleColor,
        ),
      ),
      centerTitle: widget.centerTitle,
      leading: widget.showBackButton
          ? IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      )
          : null,
      actions: [
        if (widget.showProfileIcon)
          IconButton(
            onPressed: _authenticateAndNavigate,
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}