import 'package:breezy_look/modules/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:breezy_look/config/themes/theme_light.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BreezyLook Theme',
      theme: AppTheme.lightTheme, // This is where I use my custom theme
      home: HomeScreen(), // Here is where the App starts / Starting point
    );
  }
}
