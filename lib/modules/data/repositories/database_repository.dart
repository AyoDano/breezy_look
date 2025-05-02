import 'package:breezy_look/modules/data/models/fashion_item.dart';
import 'package:breezy_look/modules/data/models/user.dart';
import 'package:breezy_look/modules/data/repositories/weather.dart';

abstract class DatabaseRepository {
  // Constructor
  DatabaseRepository();

  // Add a user asynchronously
  Future<void> addUser(User user);

  // Get all users asynchronously
  Future<List<User>> getAllUsers();

  // Add a clothing item asynchronously
  Future<void> addClothingItem(FashionItem item);

  // Get clothing items by category asynchronously
  Future<List<FashionItem>> getClothingItemsByCategory(String category);

  // Get all clothing items asynchronously
  Future<List<FashionItem>> getAllClothingItems();

  // Get outfit suggestions asynchronously
  Future<List<FashionItem>> getOutfitSuggestions(String category);

  // Update weather data asynchronously
  Future<void> updateWeather(Weather weather);
}
