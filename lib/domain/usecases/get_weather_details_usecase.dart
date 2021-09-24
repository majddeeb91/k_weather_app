import 'package:k_weather_app/core/errors/failures.dart';
import 'package:k_weather_app/domain/entities/weather_details.dart';
import 'package:k_weather_app/domain/repositories/weather_details_repo.dart';
import 'package:dartz/dartz.dart';

class GetWeatherDetailsUseCase {
  final WeatherDetailsRepo weatherDetailsRepo;

  GetWeatherDetailsUseCase(this.weatherDetailsRepo);

  Future<Either<Failure, WeahterDetails>> execute({required double long, required double lat}) async {
    return await weatherDetailsRepo.getWeatherDetailsByCoordinates(long, lat);
  }
}
