import 'package:flutter/material.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/current_day_weather.dart';
import 'package:k_weather_app/presentation/screens/shared_widgets/weather_condition_item.dart';
import 'package:k_weather_app/core/app_appearance/app_colors.dart';

class WeatherConditions extends StatelessWidget {
  final CurrnetDayWeather currentDaywWeather;

  const WeatherConditions({Key? key, required this.currentDaywWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherConditionItem(
            title: "Humadity",
            value: "${currentDaywWeather.humadity} %",
            valueColor: AppColors.kPrimaryTextColor,
          ),
          VerticalDivider(
            thickness: 1.5,
            indent: 8,
            endIndent: 8,
          ),
          WeatherConditionItem(
            title: "Feels Like",
            value: "${currentDaywWeather.feelLike}°",
            valueColor: AppColors.kPrimaryTextColor,
          ),
          VerticalDivider(
            thickness: 1.5,
            indent: 8,
            endIndent: 8,
          ),
          WeatherConditionItem(
            title: "Wind Speed",
            value: "${currentDaywWeather.windSpeed} kh/h",
            valueColor: AppColors.kPrimaryTextColor,
          ),
        ],
      ),
    );
  }
}
