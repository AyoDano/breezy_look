import 'package:flutter/material.dart';

class TodayForecast extends StatelessWidget {
  const TodayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
          "Today in Barcelona, you can expect sun giving way to increasing clouds, with a high of 16°C and a low of 13°C. Given the mild temperatures, a light sweater or long-sleeved shirt should suffice during the day. \n\nIn the evening, consider adding a light jacket to stay comfortable as temperatures dip. Long pants and comfortable footwear are recommended for exploring the city. While rain isn't expected today, it's always a good idea to carry a small umbrella or a waterproof layer, just in case.",
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyLarge),
    ]);
  }
}

/* class ArticleForecastTitle extends StatelessWidget {
  const ArticleForecastTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Text(
            "Today's forecast'",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
 */
