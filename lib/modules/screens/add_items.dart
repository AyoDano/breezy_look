import 'package:breezy_look/widgets/selectable_chips_row.dart';
import 'package:breezy_look/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class AddItemsScreen extends StatelessWidget {
  const AddItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // No back chevron in appbar
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(
                  context); // Closes the page and back to starting point
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/fashion_items/longsleeve_striped_red_wht.png",
                  width: 200,
                  height: 280,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFieldWithLabel(
                label: "Item Name: *", placeholder: "Black Cardigan, Pants..."),
            const SizedBox(height: 20),
            SelectableChipsRow(
              label: 'Category: *',
              chipOptions: ["Shirt", "Pants", "Accessorie", "Shoes"],
            ),
            Divider(),
            SelectableChipsRow(
              label: 'Style: *',
              chipOptions: ["Casual", "Formal", "Sport", "Elegant"],
            ),
          ],
        ),
      ),
    );
  }
}
