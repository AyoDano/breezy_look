import 'package:flutter/material.dart';

class PlaceholderScreenUser extends StatelessWidget {
  final String title;
  final String username;

  const PlaceholderScreenUser({
    super.key,
    required this.title,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          "Welcome, $username! Page coming soon!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
