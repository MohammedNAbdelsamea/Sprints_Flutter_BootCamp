import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/firebase_options.dart';
import 'package:shopping_app/screens/login_page.dart';



Future <void> main() async {
  // Initialize Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();

  runApp(
    // Wrap the app with EasyLocalization widget to enable translations
    EasyLocalization(
      // Define supported languages (English and Arabic)
      supportedLocales: const [Locale('en'), Locale('ar')],
      // Path to translation files in assets
      path: 'assets/lang',
      // Default language if translation is missing
      fallbackLocale: const Locale('en'),
      // Use only language code (en, ar) without country code
      useOnlyLangCode: true,
      child: const ShoppingApp(),
    ),
  );
}

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Add localization delegates to support translation
      localizationsDelegates: context.localizationDelegates,
      // Define which locales the app supports
      supportedLocales: context.supportedLocales,
      // Set current locale from context
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      // Translate app title using .tr() extension
      title: 'shopping_app'.tr(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Suwannaphum',
      ),
      home: const LoginPage(),
    );
  }
}