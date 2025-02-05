import 'dart:math';

class Greetings {
  static String getGreeting() {
    final hour = DateTime.now().hour;
    List<String> morningGreetings = [
      "Rise and shine!",
      "Good morning, sunny!",
      "A fresh day ahead!"
    ];
    List<String> afternoonGreetings = [
      "Welcome!",
      "Hey there!",
      "Looking stylish today!"
    ];

    List<String> eveningGreetings = [
      "Good evening!",
      "Time to unwind!",
      "Time to Relax!"
    ];

    final random = Random();
    if (hour >= 5 && hour < 12) {
      return morningGreetings[random.nextInt(morningGreetings.length)];
    } else if (hour >= 12 && hour < 18) {
      return afternoonGreetings[random.nextInt(afternoonGreetings.length)];
    } else {
      return eveningGreetings[random.nextInt(eveningGreetings.length)];
    }
  }
}
