import '../../model/weather_model.dart';

abstract class ForecastState {}

final class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastSuccess extends ForecastState {
  final List<WeatherModel> forecastList;

  ForecastSuccess(this.forecastList);
}

class ForecastFailure extends ForecastState {
  final String message;
  ForecastFailure(this.message);
}
