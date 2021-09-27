import 'package:flutter/material.dart';
import 'package:k_weather_app/core/app_appearance/app_colors.dart';

class WeatherConditionItem extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;

  const WeatherConditionItem({
    Key? key,
    required this.title,
    required this.value,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: AppColors.kLightGreyColor)),
        SizedBox(height: 10),
        Text(value, style: TextStyle(fontWeight: FontWeight.w500, color: valueColor)),
      ],
    );
  }
}
