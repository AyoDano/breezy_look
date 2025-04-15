import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:flutter/material.dart';

class PictureCard extends StatelessWidget {
  final String imagePath;

  const PictureCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.center,
        width: 110,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
          color: AppTheme.backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox.expand(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
