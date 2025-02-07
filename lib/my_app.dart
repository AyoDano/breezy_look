import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:breezy_look/modules/screens/main_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BreezyLook',
      theme: AppTheme.lightTheme, // Custom theme of my application
      home: MainScreen(), // Starting point
    );
  }
}
