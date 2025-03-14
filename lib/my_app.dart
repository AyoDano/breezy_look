import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:breezy_look/modules/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BreezyLookApp extends StatelessWidget {
  const BreezyLookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BreezyLook',
      theme: AppTheme.lightTheme, // Custom theme of my application
      home: HomeScreen(),
      // LoginScreen(databaseRepository: MockDatabase()),
      // Starting point
    );
  }
}
