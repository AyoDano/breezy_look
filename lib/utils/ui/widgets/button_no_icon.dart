import 'package:flutter/material.dart';
import 'package:breezy_look/config/themes/theme_light.dart';

class IconlessButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const IconlessButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color:
                  isDisabled ? AppTheme.teritaryColor : AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: isDisabled
                  ? []
                  : [
                      BoxShadow(
                        color: AppTheme.primaryColor.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: AppTheme.backgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
