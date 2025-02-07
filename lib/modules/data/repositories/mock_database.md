import '../models/fashion_item.dart';
import '../models/user.dart';
import '../models/weather.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // Datenstrukturen zum Speichern der Daten
  List<User> users = [];
  List<FashionItem> clothingItems = [];
  Weather? currentWeather;

  // Nutzer hinzufügen
  @override
  void addUser(User user) {
    users.add(user);
  }

  // Kleidungsstück hinzufügen
  @override
  void addClothingItem(FashionItem item) {
    clothingItems.add(item);
  }

  // Kleidungsstücke nach Kategorie abrufen
  @override
  List<FashionItem> getClothingItemsByCategory(String category) {
    return clothingItems.where((item) => item.category == category).toList();
  }

  // Alle Kleidungsstücke abrufen
  @override
  List<FashionItem> getAllClothingItems() {
    return clothingItems;
  }

  // Outfit-Vorschläge abrufen
  @override
  List<FashionItem> getOutfitSuggestions(String category) {
    return clothingItems
        .where((item) => item.category == category)
        .take(3)
        .toList();
  }

  // Wetter aktualisieren
  @override
  void updateWeather(Weather weather) {
    currentWeather = weather;
  }
}
