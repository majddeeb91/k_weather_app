import 'package:k_weather_app/core/errors/failures.dart';
import 'package:intl/intl.dart';

class Helper {
  static String mapFailureToMessage(Failure? failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Error";
      case LocalStorageFailure:
        return "Cache Error";
      case FetchingLocationFailure:
        return failure.toString();
      default:
        return 'Unexpected error';
    }
  }

  static double convertTempfromKelvinToCelsium(double kelvinValue) {
    return kelvinValue - 273.15;
  }

  static String convertToHourlyFormat(int unixTimeStamp) {
    return DateFormat('E, ha').format(DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000));
  }

  static String convertToDayFormat(int unixTimeStamp) {
    return DateFormat('EEEE').format(DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000));
  }

  static getWeatherIconUrlFromIconCode({required String code, bool largeSize = false}) {
    return largeSize ? "https://openweathermap.org/img/wn/$code@2x.png" : "https://openweathermap.org/img/wn/$code.png";
  }
}
