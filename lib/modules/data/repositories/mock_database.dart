import 'package:breezy_look/modules/data/models/fashion_item.dart';
import 'package:breezy_look/modules/data/models/user.dart';
import 'package:breezy_look/modules/data/models/weather.dart';
import 'package:breezy_look/modules/data/repositories/database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // Lists to store users and clothing items
  List<User> users = [];
  List<FashionItem> clothingItems = [];
  Weather? currentWeather;

  // Add a user to the mock database
  @override
  void addUser(User user) {
    users.add(user);
  }

  // Add a clothing item to the mock database
  @override
  void addClothingItem(FashionItem item) {
    clothingItems.add(item);
  }

  // Retrieve clothing items filtered by category
  @override
  List<FashionItem> getClothingItemsByCategory(String category) {
    return clothingItems.where((item) => item.category == category).toList();
  }

  // Retrieve all stored clothing items
  @override
  List<FashionItem> getAllClothingItems() {
    return clothingItems;
  }

  // Retrieve outfit suggestions (e.g., returns 3 random items from the given category)
  @override
  List<FashionItem> getOutfitSuggestions(String category) {
    return clothingItems
        .where((item) => item.category == category)
        .take(3)
        .toList();
  }

  // Update the weather data
  @override
  void updateWeather(Weather weather) {
    currentWeather = weather;
  }

  // Debugging: Display all stored clothing items
  void displayAllClothingItems() {
    if (clothingItems.isEmpty) {
      print("No clothing items stored in the database.");
    } else {
      print("Stored clothing items:");
      for (var item in clothingItems) {
        item.display();
      }
    }
  }
}
