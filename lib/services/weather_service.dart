import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apikey = '';

  WeatherService({required this.dio});

  Future<Map<String, dynamic>?> getWeatherData(
      {required String cityName}) async {
    try {
      final currentWeatherResponse = await dio.get(
        '$baseUrl/weather?q=$cityName&appid=$apikey&units=metric',
      );

      final forecastWeatherResponse = await dio.get(
        '$baseUrl/forecast?q=$cityName&appid=$apikey&units=metric',
      );

      if (currentWeatherResponse.statusCode == 200 &&
          forecastWeatherResponse.statusCode == 200) {
        final currentWeather = currentWeatherResponse.data;
        final forecastWeather = forecastWeatherResponse.data['list'];

        return {
          'currentWeather': currentWeather,
          'forecastWeather': forecastWeather,
        };
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error in getWeatherData: $e');
      return null;
    }
  }
}
