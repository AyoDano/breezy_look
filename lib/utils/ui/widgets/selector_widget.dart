import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:flutter/material.dart';

class SizeSelectorRow extends StatefulWidget {
  final String label;
  final List<String> chipOptions;

  const SizeSelectorRow({
    super.key,
    required this.label,
    required this.chipOptions,
  });

  @override
  SelectableChipsRowState createState() => SelectableChipsRowState();
}

class SelectableChipsRowState extends State<SizeSelectorRow> {
  String selectedChip = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 14),
          // Scrollable row for selector chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.chipOptions.map((option) {
                final bool isSelected = selectedChip == option;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedChip = isSelected ? "" : option;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.primaryColor
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppTheme.primaryColor
                                    .withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
