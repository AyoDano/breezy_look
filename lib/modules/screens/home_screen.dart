import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:breezy_look/config/greetings.dart';
import 'package:breezy_look/widgets/full_width_banner.dart';
import 'package:breezy_look/widgets/ios_button.dart';
import 'package:breezy_look/widgets/today_location_forecast.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String userName = "Enrique";
  final String profileImageUrl =
      "https://images.unsplash.com/photo-1698510047345-ff32de8a3b74?q=80&w=2648&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Greetings.getGreeting(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 4),
                          Text(
                            userName,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: AppTheme.secondaryColor),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(profileImageUrl),
                      backgroundColor:
                          AppTheme.primaryColor.withValues(alpha: 0.5),
                    )
                  ],
                ),
              ),
              //ArticleForecastTitle(),
              FullWidthBanner(),
              TodayForecast(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Divider(
                      indent: 16,
                      endIndent: 16,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    IosStyleButton(
                      text: "Dress Me",
                      onPressed: () {
                        print("Button gedrückt!");
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
