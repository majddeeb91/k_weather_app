import 'package:k_weather_app/core/errors/exceptions.dart';
import 'package:k_weather_app/core/errors/failures.dart';
import 'package:k_weather_app/data/data_sources/network/remote_data_source.dart';
import 'package:k_weather_app/data/models/weather_details_data_models/weather_details_data_model+Extension.dart';
import 'package:k_weather_app/domain/entities/weather_details.dart';
import 'package:dartz/dartz.dart';
import 'package:k_weather_app/domain/repositories/weather_details_repo.dart';

class WeatherDetailsRepoImpl implements WeatherDetailsRepo {
  RemoteDataSource remoteDataSource;

  WeatherDetailsRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeahterDetails>> getWeatherDetailsByCoordinates(double long, double lat) async {
    try {
      Map<String, dynamic> params = {
        'lat': lat.toString(),
        'lon': long.toString(),
        'exclude': "minutely",
      };
      final response = await remoteDataSource.get(endPoint: 'onecall', params: params);
      WeatherDetailsDataModel weatherDetailsDataModel = WeatherDetailsDataModel.fromMap(response);
      return Right(weatherDetailsDataModel.toDomain());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
