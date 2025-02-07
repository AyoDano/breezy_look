import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final String placeholder;

  const TextFieldWithLabel({
    super.key,
    required this.label,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.secondaryColor,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(color: AppTheme.colorGreyTwo),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final String placeholder;

  const SearchField({
    super.key,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(color: AppTheme.colorGreyTwo),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              filled: false,
              focusColor: AppTheme.teritaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppTheme.secondaryColor,
                  width: 1.5,
                ),
              ),
              // Focused mode color
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppTheme.primaryColor,
                ),
              ),
              // Active mode color
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppTheme.teritaryColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
