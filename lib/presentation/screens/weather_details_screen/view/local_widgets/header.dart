import 'package:flutter/material.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/current_day_weather.dart';
import 'package:k_weather_app/core/app_appearance/app_colors.dart';
import 'package:k_weather_app/presentation/utils/helper.dart';

class Header extends StatelessWidget {
  final String cityName;

  final CurrnetDayWeather currentDayWeather;
  const Header({
    Key? key,
    required this.currentDayWeather,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String weatherIconUrl = Helper.getWeatherIconUrlFromIconCode(code: currentDayWeather.icon, largeSize: true);
    return Container(
      height: 280,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 30.0),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.kGreyColor, AppColors.kBlackColor],
        ),
      ),
      child: Column(
        children: [
          Text(
            "$cityName",
            style: Theme.of(context).textTheme.headline5!.copyWith(color: AppColors.kPrimaryTextColor, fontWeight: FontWeight.bold),
          ),
          Text("${currentDayWeather.description}", style: TextStyle(fontSize: 18, color: AppColors.kPrimaryTextColor)),
          SizedBox(child: Image.network(weatherIconUrl)),
          Text("${currentDayWeather.temp}°", style: TextStyle(fontSize: 70, color: AppColors.kPrimaryTextColor, fontWeight: FontWeight.w400, height: 1)),
        ],
      ),
    );
  }
}
