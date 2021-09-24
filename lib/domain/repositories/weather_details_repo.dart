import 'package:dartz/dartz.dart';
import 'package:k_weather_app/core/errors/failures.dart';
import 'package:k_weather_app/domain/entities/weather_details.dart';

abstract class WeatherDetailsRepo {
  Future<Either<Failure, WeahterDetails>> getWeatherDetailsByCoordinates(double long, double lat);
}
