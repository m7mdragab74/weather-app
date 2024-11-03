import '../../model/weather_model.dart';

abstract class WeatherState {}

final class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherData;
  final List<WeatherModel>? forecastList;

  WeatherSuccess(this.weatherData, [this.forecastList]);
}

class WeatherFailure extends WeatherState {
  final String message;
  WeatherFailure(this.message);
}
