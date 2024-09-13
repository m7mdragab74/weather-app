import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apikey = '2df1cbb18c4ddd966d2d05fe3f415908';

  WeatherService({required this.dio});

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/weather?q=$cityName&appid=$apikey&units=metric');
      if (response.statusCode == 200) {
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
        return weatherModel;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
