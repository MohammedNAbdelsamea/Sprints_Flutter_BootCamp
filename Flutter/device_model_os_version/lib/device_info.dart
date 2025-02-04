// Import necessary Flutter and device info packages
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

// StatefulWidget to manage device info page with dynamic state
class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  // Initialize variables to store device model and OS version
  // Default to 'Unknown' in case retrieval fails
  String _deviceModel = 'Unknown';
  String _osVersion = 'Unknown';

  // Lifecycle method called when widget is first created
  @override
  void initState() {
    super.initState();
    // Immediately fetch device information when page loads
    _getDeviceInfo();
  }

  // Async method to retrieve device information
  Future<void> _getDeviceInfo() async {
    // Create device info plugin instance
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      // Check if the app is running on Android
      if (Platform.isAndroid) {
        // Retrieve Android-specific device information
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        // Update state with Android device details
        setState(() {
          _deviceModel = androidInfo.model;
          _osVersion = androidInfo.version.release;
        });
      }
      // Check if the app is running on iOS
      else if (Platform.isIOS) {
        // Retrieve iOS-specific device information
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        // Update state with iOS device details
        setState(() {
          _deviceModel = iosInfo.model;
          _osVersion = iosInfo.systemVersion;
        });
      }
    } catch (e) {
      // Log any errors that occur during device info retrieval
      print('Error getting device info: $e');
    }
  }

  // Build method to create the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with page title
      appBar: AppBar(
        title: Text('Device Information'),
      ),
      // Center the content vertically and horizontally
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display device model with styling
            Text(
              'Device Model: $_deviceModel',
              style: TextStyle(fontSize: 18),
            ),
            // Add some vertical spacing
            SizedBox(height: 10),
            // Display OS version with styling
            Text(
              'OS Version: $_osVersion',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}