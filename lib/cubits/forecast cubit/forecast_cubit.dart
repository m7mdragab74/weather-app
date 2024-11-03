import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/forecast%20cubit/forecast_state.dart';
import 'package:weather_app/services/forecast_weather_services.dart';

class ForecastCubit extends Cubit<ForecastState> {
  ForecastCubit(this.forecastWeatherServices) : super(ForecastInitial());

  final ForecastWeatherServices forecastWeatherServices;

  void getForecast({required String cityName}) async {
    emit(ForecastLoading());
    try {
      final forecastList =
          await forecastWeatherServices.getForecastData(cityName: cityName);
      emit(ForecastSuccess(forecastList));
    } catch (e) {
      emit(ForecastFailure('Failed to fetch forecast weather: $e'));
    }
  }
}
