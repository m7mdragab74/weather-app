import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class ForecastWeatherServices {
  final Dio dio;
  ForecastWeatherServices(this.dio);
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apiKey = '2df1cbb18c4ddd966d2d05fe3f415908';

  Future<List<WeatherModel>> getForecastData({required String cityName}) async {
    try {
      final forecastWeatherResponse = await dio.get(
        '$baseUrl/forecast?q=$cityName&appid=$apiKey&units=metric',
      );

      if (forecastWeatherResponse.statusCode == 200) {
        final forecastWeather = forecastWeatherResponse.data;
        final List<dynamic> forecastList = forecastWeather['list'];

        return forecastList.map((item) {
          return WeatherModel.fromJson(item);
        }).toList();
      } else {
        throw Exception('Failed to load current weather data');
      }
    } catch (e) {
      print('Error in getWeatherData: $e');
      throw Exception('Failed to load weather data');
    }
  }
}
