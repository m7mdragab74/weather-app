import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather%20cubit/weather_state.dart';
import 'package:weather_app/services/current_weather_services.dart';
import 'package:weather_app/services/forecast_weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService, this.forecastWeatherService)
      : super(WeatherInitial());

  final CurrentWeatherServices weatherService;
  final ForecastWeatherServices forecastWeatherService;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      final weatherModel =
          await weatherService.getWeatherData(cityName: cityName);
      final forecastList =
          await forecastWeatherService.getForecastData(cityName: cityName);

      emit(WeatherSuccess(weatherModel, forecastList));
    } catch (e) {
      emit(WeatherFailure('Failed to fetch current weather: $e'));
    }
  }
}
