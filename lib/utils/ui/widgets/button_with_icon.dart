import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:breezy_look/config/themes/theme_light.dart';

class ButtonWithIcon extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const ButtonWithIcon({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryColor.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/dress_me_icon.svg",
              width: 32,
              height: 32,
              colorFilter: ColorFilter.mode(
                AppTheme.backgroundColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: AppTheme.backgroundColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
