import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class CurrentWeatherServices {
  final Dio dio;
  CurrentWeatherServices({required this.dio});
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apiKey = '2df1cbb18c4ddd966d2d05fe3f415908';

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      final currentWeatherResponse = await dio.get(
        '$baseUrl/weather?q=$cityName&appid=$apiKey&units=metric',
      );

      if (currentWeatherResponse.statusCode == 200) {
        final currentWeather = currentWeatherResponse.data;
        return WeatherModel.fromJson(currentWeather);
      } else {
        throw Exception('Failed to load current weather data');
      }
    } catch (e) {
      print('Error in getWeatherData: $e');
      throw Exception('Failed to load weather data');
    }
  }
}
