import 'package:get_it/get_it.dart';
import 'package:k_weather_app/data/data_sources/network/remote_data_source.dart';
import 'package:k_weather_app/data/repositories_impl/weather_details_repo_impl.dart';
import 'package:k_weather_app/domain/repositories/weather_details_repo.dart';
import 'package:k_weather_app/domain/usecases/get_weather_details_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Use cases
  serviceLocator.registerLazySingleton(() => GetWeatherDetailsUseCase(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<WeatherDetailsRepo>(
    () => WeatherDetailsRepoImpl(remoteDataSource: serviceLocator()),
  );

  // Data source
  serviceLocator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
}
