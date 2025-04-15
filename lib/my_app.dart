import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:breezy_look/utils/app_navigationbar.dart';
import 'package:flutter/material.dart';

class BreezyLookApp extends StatelessWidget {
  const BreezyLookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BreezyLook',
      theme: AppTheme.lightTheme, // Custom theme of my application
      home: AppNavigation(),
      // MainScreen(),
      // HomeScreen(),
      // LoginScreen(databaseRepository: MockDatabase()),
      // Starting point
    );
  }
}
