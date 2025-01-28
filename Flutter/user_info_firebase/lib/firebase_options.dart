// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDcIX4USd3DqcJWD3UekC561ZnVpL3MnQs',
    appId: '1:720565354458:web:1f52ae098cce853044cae3',
    messagingSenderId: '720565354458',
    projectId: 'shopping-app-998fc',
    authDomain: 'shopping-app-998fc.firebaseapp.com',
    storageBucket: 'shopping-app-998fc.firebasestorage.app',
    measurementId: 'G-3MXFJ2JSC2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBypDfA3nuXUOrFsoDIw705FYJmGLIPJqE',
    appId: '1:720565354458:android:d974471f96475c4344cae3',
    messagingSenderId: '720565354458',
    projectId: 'shopping-app-998fc',
    storageBucket: 'shopping-app-998fc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDY4S8yQsIxOjazZQGDOOldlvs4jrcEi34',
    appId: '1:720565354458:ios:803a7388f5d395c444cae3',
    messagingSenderId: '720565354458',
    projectId: 'shopping-app-998fc',
    storageBucket: 'shopping-app-998fc.firebasestorage.app',
    iosBundleId: 'com.example.userInfoFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDY4S8yQsIxOjazZQGDOOldlvs4jrcEi34',
    appId: '1:720565354458:ios:803a7388f5d395c444cae3',
    messagingSenderId: '720565354458',
    projectId: 'shopping-app-998fc',
    storageBucket: 'shopping-app-998fc.firebasestorage.app',
    iosBundleId: 'com.example.userInfoFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDcIX4USd3DqcJWD3UekC561ZnVpL3MnQs',
    appId: '1:720565354458:web:54894a83b3e426c644cae3',
    messagingSenderId: '720565354458',
    projectId: 'shopping-app-998fc',
    authDomain: 'shopping-app-998fc.firebaseapp.com',
    storageBucket: 'shopping-app-998fc.firebasestorage.app',
    measurementId: 'G-QMF691WGX0',
  );
}
