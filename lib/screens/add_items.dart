import 'dart:io';

import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:breezy_look/utils/ui/widgets/button_no_icon.dart';
import 'package:breezy_look/utils/ui/widgets/custom_app_bar_header_animate.dart';
import 'package:breezy_look/utils/ui/widgets/selectable_chips_row.dart';
import 'package:breezy_look/utils/ui/widgets/selector_widget.dart';
import 'package:breezy_look/utils/ui/widgets/slider_widget.dart';
import 'package:breezy_look/utils/ui/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class AddItemsScreen extends StatefulWidget {
  const AddItemsScreen({super.key});

  @override
  State<AddItemsScreen> createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  final TextEditingController controller = TextEditingController();

  File? _selectedImageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAndCropImage() async {
    final ImageSource source = await _showImageSourceDialog();

    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );

    if (pickedFile == null) return;

    File imageFile = File(pickedFile.path);

    if (Platform.isIOS) {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          IOSUiSettings(
            title: 'Crop Picture',
          ),
        ],
      );
      if (croppedFile == null) return;
      imageFile = File(croppedFile.path);
    }

    setState(() {
      _selectedImageFile = imageFile;
    });
  }

  Future<ImageSource> _showImageSourceDialog() async {
    return await showDialog<ImageSource>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Choose a source'),
            titleTextStyle: Theme.of(context).textTheme.displaySmall,
            backgroundColor: AppTheme.backgroundColor,
            content: const Text(
                'Do you want to take a picture or upload from your gallery?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(_).pop(ImageSource.camera),
                child: Text(
                  'Camera',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(_).pop(ImageSource.gallery),
                child: Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ) ??
        ImageSource.gallery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ///TODO: sliver animated AppBar color not in background color
          const CustomAppBarHeaderAnimate(),
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
                      child: GestureDetector(
                        onTap: _pickAndCropImage,
                        child: _selectedImageFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(
                                  _selectedImageFile!,
                                  width: 200,
                                  height: 280,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                width: 200,
                                height: 280,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add_a_photo,
                                      size: 64,
                                      color: AppTheme.primaryColor,
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      'Add Photo',
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
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
                  const SliderWidget(label: "Sweat intensity:"),
                  const SizedBox(height: 20),
                  IconlessButtonWidget(text: "Add Item", onPressed: () {}),
                  const SizedBox(height: 50),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
