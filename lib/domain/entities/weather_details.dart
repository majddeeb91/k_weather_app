import 'package:k_weather_app/data/models/weather_details_data_model+Extension.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/current_day_weather.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/daily_data_entity.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/hourly_data.dart';

// class WeahterDetails {
//   final String cityName;
//   final List<DailyData> dailyData;

//   WeahterDetails(this.cityName, this.dailyData);
// }

// class DailyData {
//   final String description;
//   final String tempMin;
//   final String tempMax;
//   final String humadity;
//   final String wind;
//   final String feelLike;
//   final String icon;
//   final String date;

//   DailyData({
//     required this.tempMin,
//     required this.tempMax,
//     required this.humadity,
//     required this.wind,
//     required this.feelLike,
//     required this.description,
//     required this.icon,
//     required this.date,
//   });
// }

class WeahterDetails {
  final String cityName;
  final CurrnetDayWeather currnetDayWeather;
  final List<HourlyData> hourlyData;
  final List<DailyData> dailyData;

  WeahterDetails({
    required this.cityName,
    required this.currnetDayWeather,
    required this.hourlyData,
    required this.dailyData,
  });
}
