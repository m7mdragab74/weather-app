abstract class ForecastState {}

final class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastSuccess extends ForecastState {}

class ForecastFailure extends ForecastState {
  final String message;
  ForecastFailure(this.message);
}
