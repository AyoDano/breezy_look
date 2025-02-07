class FashionItem {
  final String name;
  final String imagePath;
  final String category;

  FashionItem({
    required this.name,
    required this.imagePath,
    required this.category,
  });
}

List<FashionItem> fashionItems = [
  FashionItem(
      name: "Braune Jacke",
      imagePath: "assets/fashion_items/jacket_brown.png",
      category: "jackets"),
  FashionItem(
      name: "Shirt Beige",
      imagePath: "assets/fashion_items/shirt_beige.png",
      category: "shirts"),
  FashionItem(
      name: "Denim Jacke Grün",
      imagePath: "assets/fashion_items/jacket_denim_green.png",
      category: "jackets"),
  FashionItem(
      name: "Black Pants",
      imagePath: "assets/fashion_items/pants_blk.png",
      category: "pants"),
  FashionItem(
      name: "Sneaker Weiß",
      imagePath: "assets/fashion_items/shoes_sneaker_white.png",
      category: "shoes"),
  FashionItem(
      name: "Sonnenbrille",
      imagePath:
          "assets/fashion_items/accessories_glasses_sunglasses_horn_brown.png",
      category: "accessories"),
];
