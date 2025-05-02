import 'dart:async';
import '../models/fashion_item.dart';
import '../models/user.dart';
import 'weather.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // Lists to store mock data
  List<User> users = [];
  List<FashionItem> clothingItems = [];
  Weather? currentWeather;

  // Helper function to simulate a fixed delay of 2 seconds
  Future<void> _simulateDelay() async {
    await Future.delayed(Duration(seconds: 2));
  }

  // Add a user
  @override
  Future<void> addUser(User user) async {
    await _simulateDelay();
    users.add(user);
  }

  // Get all users
  @override
  Future<List<User>> getAllUsers() async {
    await _simulateDelay();
    return List.from(users);
  }

  // Add a clothing item
  @override
  Future<void> addClothingItem(FashionItem item) async {
    await _simulateDelay();
    clothingItems.add(item);
  }

  // Get clothing items by category
  @override
  Future<List<FashionItem>> getClothingItemsByCategory(String category) async {
    await _simulateDelay();
    return clothingItems.where((item) => item.category == category).toList();
  }

  // Get all clothing items
  @override
  Future<List<FashionItem>> getAllClothingItems() async {
    await _simulateDelay();
    return clothingItems;
  }

  // Get outfit suggestions
  @override
  Future<List<FashionItem>> getOutfitSuggestions(String category) async {
    await _simulateDelay();
    return clothingItems
        .where((item) => item.category == category)
        .take(3)
        .toList();
  }

  // Update weather data
  @override
  Future<void> updateWeather(Weather weather) async {
    await _simulateDelay();
    currentWeather = weather;
  }
}
