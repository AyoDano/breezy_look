import 'package:breezy_look/modules/data/navigation_provider.dart';
import 'package:breezy_look/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider<NavigationProvider>(
          create: (_) => NavigationProvider(),
        ),
      ],
      child: const BreezyLookApp(),
    ),
  );
}
