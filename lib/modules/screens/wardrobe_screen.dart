import 'package:flutter/material.dart';
import 'package:breezy_look/modules/data/models/fashion_item.dart';
import 'package:breezy_look/widgets/textfield_input.dart';
import 'package:breezy_look/config/themes/theme_light.dart';

class WardrobeScreen extends StatefulWidget {
  const WardrobeScreen({super.key});

  @override
  State<WardrobeScreen> createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen> {
  bool isListView = false;
  Map<String, List<FashionItem>> categorizedItems = {};
  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    _categorizeItems();
  }

  void _categorizeItems() {
    for (var item in fashionItems) {
      if (!categorizedItems.containsKey(item.category)) {
        categorizedItems[item.category] = [];
      }
      categorizedItems[item.category]!.add(item);
    }
  }

  String formatCategory(String category) {
    return category[0].toUpperCase() + category.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wardrobe",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isListView ? Icons.grid_view : Icons.list,
              color: AppTheme.primaryColor,
            ),
            onPressed: () {
              setState(() {
                isListView = !isListView;
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SearchField(placeholder: "What are you looking for?"),
          ),
          Expanded(
            child: isListView ? _buildListView() : _buildCarouselView(),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselView() {
    return ListView(
      children: categorizedItems.keys.map((category) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatCategory(category),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: categorizedItems[category]!.length,
                  itemBuilder: (context, index) {
                    return _buildItemCard(
                      categorizedItems[category]![index],
                      width: double.infinity,
                      height: 250,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildListView() {
    return ListView(
      children: categorizedItems.keys.map((category) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 10),
              child: Text(
                formatCategory(category),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categorizedItems[category]!
                    .map(
                        (item) => _buildItemCard(item, width: 120, height: 180))
                    .toList(),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildItemCard(FashionItem item, {double? width, double? height}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            item.imagePath,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
