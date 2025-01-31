import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:breezy_look/config/themes/theme_light.dart';

class FullWidthBanner extends StatelessWidget {
  const FullWidthBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1527155431803-74e5f93c7111?q=80&w=2888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppTheme.secondaryColor.withValues(alpha: 0.3),
                    AppTheme.secondaryColor.withValues(alpha: 0.7),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "20°",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    SvgPicture.asset(
                      "assets/icons/dress_me_icon.svg",
                      width: 32,
                      height: 32,
                      colorFilter: ColorFilter.mode(
                        AppTheme.backgroundColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  "Valletta, Malta",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
