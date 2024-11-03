import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather%20cubit/weather_state.dart';
import 'package:weather_app/services/current_weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  final CurrentWeatherServices weatherService;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      final weatherModel =
          await weatherService.getWeatherData(cityName: cityName);
      emit(WeatherSuccess(
        weatherModel,
      ));
    } catch (e) {
      emit(WeatherFailure('Failed to fetch current weather: $e'));
    }
  }
}
