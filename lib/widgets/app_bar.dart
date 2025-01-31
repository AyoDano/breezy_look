import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData? iconData;
  const CustomAppBar({required this.title, this.iconData, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: AppTheme.secondaryColor),
      ),
      // Wenn kein Icon mitgegeben wurde, dann wird keins angezeigt. Wenn ja, dann wird dieses
      // angezeigt.
      actions: iconData == null ? null : [Icon(iconData)],
    );
  }
}
