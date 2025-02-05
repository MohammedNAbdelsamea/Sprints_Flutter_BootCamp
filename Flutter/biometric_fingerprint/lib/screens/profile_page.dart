// profile_page.dart
import 'package:biometric_fingerprint/screens/login_page.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import '../const.dart';
import '../widgets/custom_app_bar.dart';


import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For handling file paths


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  File? _profileImage;

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
      await _saveImageLocally(_profileImage!);
    }
  }

  // Save the selected image to local storage
  Future<void> _saveImageLocally(File image) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/profile_image.jpg';
      await image.copy(imagePath);
      print('Image saved locally at: $imagePath');
    } catch (e) {
      print('Error saving image locally: $e');
    }
  }

  // Load the saved image from local storage
  Future<File?> _loadImageLocally() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/profile_image.jpg';
      if (await File(imagePath).exists()) {
        return File(imagePath);
      }
    } catch (e) {
      print('Error loading image locally: $e');
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _loadImageLocally().then((image) {
      setState(() {
        _profileImage = image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile',
        showBackButton: true,
        showProfileIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.03),

              // Profile Image/Avatar
              GestureDetector(
                onTap: _pickImage,
                child: Center(
                  child: Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: appBarColor,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: _profileImage != null
                          ? Image.file(
                        _profileImage!,
                        fit: BoxFit.cover,
                      )
                          : Icon(
                        Icons.person,
                        size: screenWidth * 0.15,
                        color: appBarColor,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // User Name
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.person, color: appBarColor),
                  title: const Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(
                    user?.displayName ?? 'Not set',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // User Email
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.email, color: appBarColor),
                  title: const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(
                    user?.email ?? 'Not set',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Account Creation Date
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.calendar_today, color: appBarColor),
                  title: const Text(
                    'Account Created',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(
                    user?.metadata.creationTime?.toString().split(' ')[0] ?? 'Not available',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Sign Out Button
              ElevatedButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                          (route) => false,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: appBarColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.08,
                    vertical: screenHeight * 0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}