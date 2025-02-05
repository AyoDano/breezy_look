import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:breezy_look/widgets/button_no_icon_widget.dart';
import 'package:breezy_look/widgets/selectable_chips_row.dart';
import 'package:breezy_look/widgets/size_selector.dart';
import 'package:breezy_look/widgets/slider_widget.dart';
import 'package:breezy_look/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class AddItemsScreen extends StatelessWidget {
  const AddItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: AppTheme.backgroundColor,
            elevation: 4,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Add New Item",
                style: AppTheme.lightTheme.textTheme.displaySmall,
              ),
              background: Container(color: AppTheme.backgroundColor),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        label: "Item Name: *",
                        placeholder: "Black Cardigan, Pants..."),
                    const SizedBox(height: 30),
                    SelectableChipsRow(
                      label: 'Category:',
                      chipOptions: ["Shirt", "Pants", "Accessorie", "Shoes"],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Divider(color: Colors.grey.shade300),
                    ),
                    SelectableChipsRow(
                      label: 'Style:',
                      chipOptions: ["Casual", "Formal", "Sport", "Elegant"],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Divider(color: Colors.grey.shade300),
                    ),
                    SizeSelectorRow(label: "Size", chipOptions: [
                      "XS",
                      "S",
                      "M",
                      "L",
                      "XL",
                    ]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Divider(color: Colors.grey.shade300),
                    ),
                    SelectableChipsRow(
                      label: 'Material:',
                      chipOptions: ["Wool", "Leather", "Cotton", "Silk"],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Divider(color: Colors.grey.shade300),
                    ),
                    SelectableChipsRow(
                      label: 'Finishing / Feeling:',
                      chipOptions: [
                        "Waterproof",
                        "Breatheable",
                        "Cotton",
                        "Silk"
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Divider(color: Colors.grey.shade300),
                    ),
                    SliderWidget(label: "Sweat"),
                    const SizedBox(height: 20),
                    IconlessButtonWidget(text: "Add Item", onPressed: () {}),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
