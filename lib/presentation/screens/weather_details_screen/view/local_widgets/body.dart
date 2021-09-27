import 'package:flutter/material.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/current_day_weather.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/daily_data_entity.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/hourly_data.dart';
import 'package:k_weather_app/presentation/screens/weather_details_screen/view/local_widgets/weather_conditions.dart';
import 'package:k_weather_app/presentation/screens/weather_details_screen/view_model/weather_details_viewmodel.dart';
import 'header.dart';
import 'hourly_horizontal_list_view.dart';
import 'next_days_vertical_list_view.dart';

class Body extends StatelessWidget {
  final WeatherDetailsViewModel viewModel;

  const Body({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrnetDayWeather currentDayWeather = viewModel.weahterDetails!.currnetDayWeather;
    List<HourlyData> hourlyDataList = viewModel.weahterDetails!.hourlyData;
    List<DailyData> dailyDataList = viewModel.weahterDetails!.dailyData;

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Header(currentDayWeather: currentDayWeather, cityName: viewModel.weahterDetails!.cityName),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WeatherConditions(currentDaywWeather: currentDayWeather),
            ),
            SizedBox(height: 10),
            HourlyHorizontalListView(hourlyDataList: hourlyDataList),
            SizedBox(height: 10),
            NexgDaysVerticalListView(dailyDataList: dailyDataList),
          ],
        ),
      ),
    );
  }
}
