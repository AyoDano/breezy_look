import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:breezy_look/config/themes/theme_light.dart';

class FullWidthBanner extends StatelessWidget {
  const FullWidthBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: SizedBox(
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
                      Colors.black.withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.9),
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
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: AppTheme.backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                      ),
                      ClipOval(
                        child: Container(
                          width: 45,
                          height: 45,
                          color: const Color(0xFFEDAA0D),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.asset(
                              "assets/icons/weather_sunny_icon.svg",
                              colorFilter: ColorFilter.mode(
                                AppTheme.backgroundColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Valletta, Malta",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppTheme.backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
