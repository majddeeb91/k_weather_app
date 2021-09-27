import 'package:flutter/material.dart';

class WeatherConditionItem extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;

  const WeatherConditionItem({
    Key? key,
    required this.title,
    required this.value,
    this.valueColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Colors.grey.withOpacity(0.7))),
        SizedBox(height: 10),
        Text(value, style: TextStyle(fontWeight: FontWeight.w500, color: valueColor)),
      ],
    );
  }
}
