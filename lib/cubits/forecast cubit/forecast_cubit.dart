import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/forecast%20cubit/forecast_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/forecast_weather_services.dart';

class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit(this.forecastWeatherServices) : super(ForecastInitial());
  ForecastWeatherServices forecastWeatherServices;
  WeatherModel? weatherModel;
  void getForecast({required String cityName}) async {
    emit(ForecastLoading());
    try {
      weatherModel =
          await forecastWeatherServices.getWeatherData(cityName: cityName);
      emit(ForecastSuccess());
    } on Exception catch (e) {
      emit(ForecastFailure('Failed to fetch forecast weather: $e'));
    }
  }
}
