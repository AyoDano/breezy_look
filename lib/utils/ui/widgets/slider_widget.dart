import 'package:breezy_look/config/themes/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliderWidget extends StatefulWidget {
  final String label;

  const SliderWidget({super.key, required this.label});

  @override
  // ignore: library_private_types_in_public_api
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label above the slider
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.secondaryColor,
            ),
          ),
          SizedBox(height: 8),

          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/humidity_slider_icon_min.svg",
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(
                  AppTheme.secondaryColor,
                  BlendMode.srcIn,
                ),
              ), // Left Icon

              Expanded(
                child: Slider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 5.0,
                  divisions: 5,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  activeColor: AppTheme.primaryColor,
                  inactiveColor: AppTheme.colorGreyTwo,
                  thumbColor: AppTheme.backgroundColor,
                ),
              ),
              SvgPicture.asset(
                "assets/icons/humidity_slider_icon_max.svg",
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(
                  AppTheme.secondaryColor,
                  BlendMode.srcIn,
                ),
              ), // Right Icon
            ],
          ),
        ],
      ),
    );
  }
}
