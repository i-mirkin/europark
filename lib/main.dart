import 'package:europark/screens/about_screen.dart';
import 'package:europark/screens/catalog_screen.dart';
import 'package:europark/screens/login_screen.dart';
import 'package:europark/screens/personal_screen.dart';
import 'package:europark/screens/product_screen.dart';
import 'package:europark/screens/splash_screen.dart';
import 'package:europark/screens/user_screen.dart';
import 'package:europark/screens/welcome_screen.dart';
import 'package:europark/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences.setMockInitialValues({}); // задает начальные значения или обнуляет
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Europark',
      theme: lightMode,
      home: const SplashScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        UserScreen.routeName: (context) => const UserScreen(),
        PersonalScreen.routeName: (context) => const PersonalScreen(),
        AboutScreen.routeName: (context) => const AboutScreen(),
        CatalogScreen.routeName: (context) => const CatalogScreen(),
        ProductScreen.routeName: (context) => const ProductScreen()

      },
    );
  }
}

