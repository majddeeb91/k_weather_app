import 'package:k_weather_app/core/app_enums.dart';

class AppConfiguration {
  // variables
  AppEnvironment appEnvironment = AppEnvironment.production;
  String appHost = "";
  String appScheme = "";
  String apiKey = "";
  static final AppConfiguration sharedInstance = AppConfiguration._();

  // private constructor
  AppConfiguration._() {
    switch (appEnvironment) {
      case AppEnvironment.production:
        {
          appScheme = "https";
          appHost = "api.openweathermap.org";
          apiKey = "59bf5eab1ca4664c6c0c7dfe8ee730aa";
        }
        break;

      case AppEnvironment.staging:
        {
          appScheme = "";
          appHost = "";
          apiKey = "";
        }
        break;
      default:
    }
  }
}
