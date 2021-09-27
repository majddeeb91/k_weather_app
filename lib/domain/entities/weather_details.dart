import 'package:k_weather_app/domain/entities/weather_details_entities/current_day_weather.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/daily_data_entity.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/hourly_data.dart';

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
