import 'package:weather_app/helper/api.dart';
import 'package:weather_app/model/weather_model.dart';

class ForecastWeatherService {
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apiKey = '2df1cbb18c4ddd966d2d05fe3f415908';
  Future<WeatherModel> getForecastWeather({required String cityName}) async {
    final response = await Api().getCurrentWeather(
      url: '$baseUrl/forecast?q=$cityName&appid=$apiKey&units=metric',
    );

    return WeatherModel.fromJson(response);
  }
}
