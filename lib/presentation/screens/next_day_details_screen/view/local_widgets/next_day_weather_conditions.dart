import 'package:flutter/material.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/daily_data_entity.dart';
import 'package:k_weather_app/presentation/screens/shared_widgets/weather_condition_item.dart';

class NextDayWeahterConditionds extends StatelessWidget {
  final DailyData currentNextDayDetails;

  const NextDayWeahterConditionds({
    Key? key,
    required this.currentNextDayDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherConditionItem(title: "Max", value: "${currentNextDayDetails.maxTemp}°"),
          VerticalDivider(
            thickness: 1.5,
            indent: 8,
            endIndent: 8,
          ),
          WeatherConditionItem(title: "Min", value: "${currentNextDayDetails.minTemp}°"),
          VerticalDivider(
            thickness: 1.5,
            indent: 8,
            endIndent: 8,
          ),
          WeatherConditionItem(title: "Humadity", value: "${currentNextDayDetails.humadity} %"),
          VerticalDivider(
            thickness: 1.5,
            indent: 8,
            endIndent: 8,
          ),
          WeatherConditionItem(title: "Wind Speed", value: "${currentNextDayDetails.windSpeed} kh/h"),
        ],
      ),
    );
  }
}
