class ClothingItem {
  String category; // Kategorie des Kleidungsstücks
  String description; // Beschreibung des Kleidungsstücks

  // Konstruktor
  ClothingItem(this.category, this.description);

  // Eine Methode, um die Details des Kleidungsstücks anzuzeigen
  void display() {
    print("Kategorie: $category, Beschreibung: $description");
  }
}
