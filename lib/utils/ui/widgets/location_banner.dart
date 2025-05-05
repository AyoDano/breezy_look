import 'dart:ui';

import 'package:breezy_look/modules/data/repositories/location_service.dart';
import 'package:breezy_look/modules/data/repositories/unsplash_service.dart';
import 'package:breezy_look/modules/data/repositories/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:breezy_look/config/themes/theme_light.dart';

class LocationBanner extends StatefulWidget {
  const LocationBanner({super.key});

  @override
  State<LocationBanner> createState() => _LocationBannerState();
}

class _LocationBannerState extends State<LocationBanner> {
  String? locationName;
  String? country;
  double? temperature;
  String? weatherIconCode;
  String? backgroundImageUrl;
  String? weatherDescription;
  double? highTemp;
  double? lowTemp;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _loadBannerData();
  }

  Future<void> _loadBannerData() async {
    try {
      final position = await LocationService.getCurrentLocation();
      final weather = await WeatherService.fetchWeather(
        position.latitude,
        position.longitude,
      );
      String imageUrl;

      try {
        imageUrl =
            await UnsplashService.fetchImage(weather.location, weather.country);
      } catch (_) {
        imageUrl =
            await UnsplashService.fetchImage(weather.country, weather.country);
      }

      setState(() {
        locationName = weather.location;
        country = weather.country;
        temperature = weather.temperature;
        weatherIconCode = weather.iconCode;
        backgroundImageUrl = imageUrl;
        weatherDescription = weather.description;
        highTemp = weather.highTemp;
        lowTemp = weather.lowTemp;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
          child: Padding(
        padding: EdgeInsets.all(80.0),
        child: CircularProgressIndicator(
          color: AppTheme.secondaryColor,
          strokeWidth: 4.5,
          strokeCap: StrokeCap.round,
        ),
      ));
    }

    if (hasError) {
      return const Center(child: Text("Not able to load weather"));
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backgroundImageUrl!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.colorGreyTwo.withValues(alpha: 0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.01),
                      Colors.black.withValues(alpha: 0.9),
                    ],
                    stops: const [0.0, 0.01, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(20),
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
                        "${temperature?.round()}°",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: AppTheme.backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                      ),
                      const SizedBox(width: 8),
                      ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppTheme.backgroundColorTransparent,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: weatherIconCode != null
                                  ? Image.network(
                                      "https://openweathermap.org/img/wn/${weatherIconCode}@2x.png",
                                      width: 35,
                                      height: 35,
                                      errorBuilder: (_, error, stackTrace) =>
                                          const Icon(Icons.error),
                                    )
                                  : const Icon(Icons.help_outline),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Hi: ${highTemp?.round()}°",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.backgroundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Lo: ${lowTemp?.round()}°",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.backgroundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "-",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.backgroundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "$weatherDescription",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.backgroundColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "$locationName, $country",
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
