import '../models/user.dart';
import '../models/weather.dart';
import '../models/clothingItem.dart';
import 'mock_database.md';

abstract class DatabaseRepository {
  // Konstruktor
  DatabaseRepository(MockDatabase mockDatabase);

  // Nutzer hinzufügen
  void addUser(User user);

  // Kleidungsstück hinzufügen
  void addClothingItem(ClothingItem item);

  // Kleidungsstücke nach Kategorie filtern
  List<ClothingItem> getClothingItemsByCategory(String category);

  // Alle Kleidungsstücke abrufen
  List<ClothingItem> getAllClothingItems();

  // Outfit-Vorschläge abrufen
  List<ClothingItem> getOutfitSuggestions(String category);

  // Wetter aktualisieren
  void updateWeather(Weather weather);
}
