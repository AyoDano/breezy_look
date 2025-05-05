import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final String? username;

  const PlaceholderScreen({
    super.key,
    required this.title,
    this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          username == null
              ? "$title Page coming soon!"
              : "Welcome, $username! $title Page coming soon!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
