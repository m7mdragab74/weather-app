import 'package:weather_app/helper/api.dart';
import 'package:weather_app/model/weather_model.dart';

class CurrentWeatherService {
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apiKey = '2df1cbb18c4ddd966d2d05fe3f415908';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    final response = await Api().getCurrentWeather(
      url: '$baseUrl/weather?q=$cityName&appid=$apiKey&units=metric',
    );

    return WeatherModel.fromJson(response);
  }
}
