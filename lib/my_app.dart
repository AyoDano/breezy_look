import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:breezy_look/screens/app_navigationbar.dart';
import 'package:breezy_look/screens/login_screen.dart';
import 'package:breezy_look/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreezyLookApp extends StatelessWidget {
  const BreezyLookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        final isLoggedIn = snapshot.data != null;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BreezyLook',
          home: isLoggedIn ? AppNavigation() : LoginScreen(),
          theme: AppTheme.lightTheme,
          key: isLoggedIn ? Key("Logged In") : Key("Not Logged In"),
        );
      },
    );
  }
}
