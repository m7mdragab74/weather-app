import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather%20cubit/weather_state.dart';
import 'package:weather_app/services/current_weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherLoading());
  CurrentWeatherService weatherService;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      await weatherService.getCurrentWeather(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
