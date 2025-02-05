class FashionItem {
  final String name;
  final String imagePath;

  FashionItem({
    required this.name,
    required this.imagePath,
  });
}

List<FashionItem> fashionItems = [
  FashionItem(
      name: "Braune Jacke", imagePath: "assets/fashion_items/jacket_brown.png"),
  FashionItem(
      name: "Shirt Beige", imagePath: "assets/fashion_items/shirt_beige.png"),
  FashionItem(
      name: "Denim Jacke Grün",
      imagePath: "assets/fashion_items/jacket_denim_green.png"),
  FashionItem(
      name: "Black Pants", imagePath: "assets/fashion_items/pants_blk.png"),
];
