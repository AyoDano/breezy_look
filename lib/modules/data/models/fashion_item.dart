class FashionItem {
  final String name;
  final String imagePath;
  final String category;
  final String description;

  // Constructor to initialize all required fields
  FashionItem({
    required this.name,
    required this.imagePath,
    required this.category,
    required this.description,
  });

  // Method to display details of the fashion item
  void display() {
    print("Name: $name, Category: $category, Description: $description");
  }
}

// Example list of FashionItems (mock database)
List<FashionItem> fashionItems = [
  FashionItem(
    name: "Brown Jacket",
    imagePath: "assets/fashion_items/jacket_brown.png",
    category: "jackets",
    description: "A warm brown jacket for chilly days.",
  ),
  FashionItem(
    name: "Beige Shirt",
    imagePath: "assets/fashion_items/shirt_beige.png",
    category: "shirts",
    description: "A casual beige shirt for everyday wear.",
  ),
  FashionItem(
    name: "Green Denim Jacket",
    imagePath: "assets/fashion_items/jacket_denim_green.png",
    category: "jackets",
    description: "Stylish green denim jacket for autumn.",
  ),
  FashionItem(
    name: "Black Pants",
    imagePath: "assets/fashion_items/pants_blk.png",
    category: "pants",
    description: "Black pants that go with everything.",
  ),
  FashionItem(
    name: "White Sneakers",
    imagePath: "assets/fashion_items/shoes_sneaker_white.png",
    category: "shoes",
    description: "Comfortable white sneakers for sporty outfits.",
  ),
  FashionItem(
    name: "Sunglasses",
    imagePath:
        "assets/fashion_items/accessories_glasses_sunglasses_horn_brown.png",
    category: "accessories",
    description: "Sunglasses with a brown horn frame.",
  ),
];
