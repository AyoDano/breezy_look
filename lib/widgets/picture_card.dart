import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:flutter/material.dart';

class CenteredImageWidget extends StatelessWidget {
  final String imagePath;

  const CenteredImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          color: AppTheme.backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
