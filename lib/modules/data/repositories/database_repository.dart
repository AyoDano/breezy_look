import 'package:breezy_look/modules/data/models/fashion_item.dart';
import 'package:breezy_look/modules/data/models/user.dart';
import 'package:breezy_look/modules/data/models/weather.dart';

abstract class DatabaseRepository {
  // Constructor
  DatabaseRepository();

  // Add a user to the database
  void addUser(User user);

  // Add a clothing item to the database
  void addClothingItem(FashionItem item);

  // Retrieve clothing items by category
  List<FashionItem> getClothingItemsByCategory(String category);

  // Retrieve all clothing items
  List<FashionItem> getAllClothingItems();

  // Retrieve outfit suggestions based on a category
  List<FashionItem> getOutfitSuggestions(String category);

  // Update the current weather data
  void updateWeather(Weather weather);
}
