import 'dart:convert';
import 'package:k_weather_app/data/models/weather_details_data_models/current_model.dart';
import 'package:k_weather_app/data/models/weather_details_data_models/daily_model.dart';
import 'package:k_weather_app/data/models/weather_details_data_models/hourly_model.dart';
import 'package:k_weather_app/domain/entities/weather_details.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/current_day_weather.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/daily_data_entity.dart';
import 'package:k_weather_app/domain/entities/weather_details_entities/hourly_data.dart';
import 'package:k_weather_app/presentation/utils/helper.dart';

class WeatherDetailsDataModel {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Hourly> hourly;
  List<Daily> daily;

  WeatherDetailsDataModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory WeatherDetailsDataModel.fromJson(String str) => WeatherDetailsDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherDetailsDataModel.fromMap(Map<String, dynamic> json) => WeatherDetailsDataModel(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromMap(json["current"]),
        hourly: List<Hourly>.from(json["hourly"].map((x) => Hourly.fromMap(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toMap(),
        "hourly": List<dynamic>.from(hourly.map((x) => x.toMap())),
        "daily": List<dynamic>.from(daily.map((x) => x.toMap())),
      };
}

/// Extensions
// This extension for converting api response model to object model in the Domain layer
extension WeatherDetailsDataModelConverter on WeatherDetailsDataModel {
  WeahterDetails toDomain() {
    List<HourlyData> hourlyDataList = [];
    List<DailyData> dailyDataList = [];

    var currnetDayWeather = CurrnetDayWeather(
      temp: Helper.convertTempfromKelvinToCelsium(this.current.temp).round().toString(),
      humadity: this.current.humidity.toString(),
      windSpeed: this.current.windSpeed.toString(),
      feelLike: Helper.convertTempfromKelvinToCelsium(this.current.feelsLike).round().toString(),
      icon: this.current.weather.first.icon,
      description: this.current.weather.first.description,
    );

    for (Hourly item in this.hourly) {
      HourlyData hourlyData = HourlyData(
        time: Helper.convertToHourlyFormat(item.dt),
        icon: item.weather.first.icon,
        temp: Helper.convertTempfromKelvinToCelsium(item.temp).round().toString(),
      );
      hourlyDataList.add(hourlyData);
    }

    for (Daily item in this.daily) {
      DailyData dailyData = DailyData(
        id: item.dt,
        date: Helper.convertToDayFormat(item.dt),
        icon: item.weather.first.icon,
        minTemp: Helper.convertTempfromKelvinToCelsium(item.temp.min).round().toString(),
        maxTemp: Helper.convertTempfromKelvinToCelsium(item.temp.max).round().toString(),
        description: item.weather.first.description,
        humadity: item.humidity.toString(),
        windSpeed: item.windSpeed.toString(),
      );
      dailyDataList.add(dailyData);
    }

    return WeahterDetails(
      cityName: this.timezone,
      currnetDayWeather: currnetDayWeather,
      hourlyData: hourlyDataList,
      dailyData: dailyDataList,
    );
  }
}
