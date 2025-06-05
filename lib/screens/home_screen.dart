import 'package:firebase_auth/firebase_auth.dart';
import 'package:breezy_look/modules/data/models/fashion_item.dart';
import 'package:breezy_look/utils/ui/widgets/greetings_header.dart';
import 'package:breezy_look/utils/ui/widgets/location_banner.dart';
import 'package:breezy_look/utils/ui/widgets/picture_card.dart';
import 'package:breezy_look/utils/ui/widgets/today_location_forecast.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String profileImage = "assets/user/profile_image.jpg";

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String userName = user?.displayName ?? "User not logged in";

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            // Greetings header + user picture
            GreetingHeader(
              userName: userName,
              profileImage: profileImage,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, bottom: 10),
                      child: Text(
                        "Your latest picks",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SizedBox(
                        height: 150,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: fashionItems.take(5).map((item) {
                              return PictureCard(imagePath: item.imagePath);
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    const LocationBanner(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: TodayForecast(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
