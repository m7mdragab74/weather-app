import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apikey = '';
  WeatherService({required this.dio});

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/weather?q=$cityName&appid=$apikey');
      if (response.statusCode == 200) {
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
        return weatherModel;
      } else {
        return null;
      }
    } on Exception catch (e) {
      return null;
    }
  }
}
