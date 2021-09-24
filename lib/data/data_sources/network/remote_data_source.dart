import 'package:dio/dio.dart';
import 'package:k_weather_app/core/errors/exceptions.dart';
import 'package:k_weather_app/core/app_configurations/app_configuration.dart';

class RemoteDataSource {
  Dio _dio = Dio();

  Uri _buildUri(String endpoint, Map<String, dynamic> params) {
    Map<String, dynamic> query = {'appid': AppConfiguration.sharedInstance.apiKey};

    query = query..addAll(params);

    var uri = Uri(
      scheme: AppConfiguration.sharedInstance.appScheme,
      host: AppConfiguration.sharedInstance.appHost,
      path: 'data/2.5/$endpoint',
      queryParameters: query,
    );
    return uri;
  }

  Future<dynamic> get({required String endPoint, required Map<String, dynamic> params}) async {
    Uri uri = _buildUri(endPoint, params);
    try {
      final response = await _dio.getUri(uri);
      switch (response.statusCode) {
        // 200 Success
        case 200:
          {
            return (response.data);
          }
        default:
          throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
