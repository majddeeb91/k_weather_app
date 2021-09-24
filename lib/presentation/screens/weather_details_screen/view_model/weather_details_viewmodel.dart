import 'package:flutter/material.dart';
import 'package:k_weather_app/core/app_enums.dart';
import 'package:k_weather_app/core/errors/exceptions.dart';
import 'package:k_weather_app/core/errors/failures.dart';
import 'package:k_weather_app/domain/entities/weather_details.dart';
import 'package:k_weather_app/domain/usecases/get_weather_details_usecase.dart';
import 'package:k_weather_app/core/dependencies_injection/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class WeatherDetailsViewModel extends ChangeNotifier {
  // Variables
  WeahterDetails? weahterDetails;
  Failure? error;

  GetWeatherDetailsUseCase getWeatherDetailsUseCase = serviceLocator();

  // Initial state
  ProviderState _state = ProviderState.initial;
  ProviderState get currentState => _state;

  WeatherDetailsViewModel() {
    fetchData();
  }

  void _showSpinner() {
    _state = ProviderState.isLoading;
    notifyListeners();
  }

  // Fetching Data by Call The Required UseCase
  void fetchData() async {
    _showSpinner();

    try {
      Position currentPoosition = await _determinePosition();

      Either<Failure, WeahterDetails> result = await getWeatherDetailsUseCase.execute(long: currentPoosition.longitude, lat: currentPoosition.latitude);

      // Handling The Result (ERROR or DATA) then Notifying Listners
      result.fold((failure) {
        error = failure;
        _state = ProviderState.error;
        notifyListeners();
      }, (returnedData) {
        weahterDetails = returnedData;
        _state = ProviderState.loaded;
        notifyListeners();
      });
    } catch (e) {
      error = FetchingLocationFailure(e.toString());
      _state = ProviderState.error;
      notifyListeners();
    }
  }

  /// Determine the current position of the device.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationException('Location permissions are permanently denied, we cannot request permissions.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationException('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      throw LocationException('Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
