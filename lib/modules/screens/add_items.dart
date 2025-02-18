import 'package:breezy_look/widgets/button_no_icon.dart';
import 'package:breezy_look/widgets/custom_app_bar_header_animate.dart';
import 'package:breezy_look/widgets/selectable_chips_row.dart';
import 'package:breezy_look/widgets/selector_widget.dart';
import 'package:breezy_look/widgets/slider_widget.dart';
import 'package:breezy_look/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class AddItemsScreen extends StatefulWidget {
  const AddItemsScreen({super.key});

  @override
  State<AddItemsScreen> createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ///TODO: sliver animated AppBar color not in background color
          CustomAppBarHeaderAnimate(),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Card(
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
                  ),
                  const SizedBox(height: 20),
                  TextFieldWithLabel(
                    label: "Item Name:",
                    placeholder: "Black Cardigan, Pants...",
                    controller: controller,
                  ),
                  const SizedBox(height: 30),
                  SelectableChipsRow(
                    label: "Category:",
                    chipOptions: ["Shirt", "Pants", "Accessorie", "Shoes"],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Divider(color: Colors.grey.shade300),
                  ),
                  SizeSelectorRow(
                      label: "Season:",
                      chipOptions: ["Spring", "Summer", "Fall", "Winter"]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Divider(color: Colors.grey.shade300),
                  ),
                  SelectableChipsRow(
                    label: "Style:",
                    chipOptions: ["Casual", "Formal", "Sport", "Elegant"],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Divider(color: Colors.grey.shade300),
                  ),
                  SizeSelectorRow(label: "Size:", chipOptions: [
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
                    label: "Material:",
                    chipOptions: ["Wool", "Leather", "Cotton", "Silk"],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Divider(color: Colors.grey.shade300),
                  ),
                  SelectableChipsRow(
                    label: "Finishing / Feeling:",
                    chipOptions: [
                      "Waterproof",
                      "Breatheable",
                      "Lightweight",
                      "Wrinkle-Free",
                      "Windproof",
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Divider(color: Colors.grey.shade300),
                  ),
                  SliderWidget(label: "Sweat intensity:"),
                  const SizedBox(height: 20),
                  IconlessButtonWidget(text: "Add Item", onPressed: () {}),
                  const SizedBox(height: 20),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
