import 'package:flutter/material.dart';
import 'package:k_weather_app/core/app_appearance/app_colors.dart';

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
          AppColors.kPrimaryColor,
        )),
      ),
    );
  }
}
