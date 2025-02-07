import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:flutter/material.dart';

class CustomAppBarHeaderAnimate extends StatelessWidget {
  const CustomAppBarHeaderAnimate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: AppTheme.backgroundColor,
      elevation: 4,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "Add New Item",
          style: AppTheme.lightTheme.textTheme.displaySmall
              ?.copyWith(fontSize: 16),
        ),
        background: Container(color: AppTheme.backgroundColor),
      ),
    );
  }
}
