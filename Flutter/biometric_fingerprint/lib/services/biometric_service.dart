// biometric_service.dart
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class BiometricService {
  // Instance of LocalAuthentication to handle biometric authentication
  final LocalAuthentication _localAuth = LocalAuthentication();

  // Method to authenticate the user using biometrics
  Future<bool> authenticateWithBiometrics() async {
    try {
      // Check if the device supports biometric authentication
      final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;

      // Check if the device is capable of biometric authentication
      final bool canAuthenticate = canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();

      // If the device does not support biometric authentication, return false
      if (!canAuthenticate) {
        return false;
      }

      // Perform biometric authentication
      return await _localAuth.authenticate(
        localizedReason: 'Please authenticate to view your profile', // Message shown to the user
        options: const AuthenticationOptions(
          stickyAuth: true, // Keep the authentication dialog open until the user completes the process
          biometricOnly: true, // Only allow biometric authentication (no fallback to PIN/pattern)
        ),
      );
    } on PlatformException catch (_) {
      // Handle any platform-specific exceptions (e.g., if biometric hardware is unavailable)
      return false;
    }
  }
}