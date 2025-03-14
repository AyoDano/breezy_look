// Zu erst erstelle ich in dieser Datei meine Klasse Wardrobe
class Wardrobe {
// Diese beinhaltet eine Funktion Liste zum um die Kleidungsstücke in einer Map zu speichern
  List<Map<String, String>> clothingItems = [];

// Die Methode addClothingItem fügt der obigen Liste clothingItems ein weiteres
// Kleidungsstück hinzu mit der Kategorie und der Beschreibung des Teils
  void addClothingItem(String category, String description) {
    clothingItems.add({'Category': category, 'Description': description});
  }

// Die Funktion getOutfitSuggestions soll mit dem Parameter
// String category die ausgabe geben wonach der User sucht
// Die Liste clothingItems wird dann vom Compiler nach den Inhalten durchsucht
// und nach dem Keywort welches zu der Kategorie passt.
// Danach werden die gefundenen items in einer Liste auf displayAllClothing
  List<Map<String, String>> getOutfitSuggestions(String category) {
    return clothingItems.where((item) => item['Category'] == category).toList();
  }

// Die displayAllClothing Methode, soll dem User alle gespeicherten Teile anzeigen
// Durch das if else for statement soll abgewogen werden ob sich etwas im
// kleiderschrank befindet oder nicht. Wenn doch soll diese alle
// clothingItems aus der Map ausgeben
  void displayAllClothing() {
    if (clothingItems.isEmpty) {
      print("Your wardrobe is empty.");
    } else {
      print("Your items");
      for (var item in clothingItems) {
        print("- ${item['Category']}: ${item['Description']}");
      }
    }
  }
}
