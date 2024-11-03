import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  String getDayNameFromDate(String dateString) {
    final DateFormat formatter = DateFormat('EEEE');
    final DateTime date = DateTime.parse(dateString);
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(getDayNameFromDate(weatherModel.date)),
        const SizedBox(height: 16),
        Image.network(
          'http://openweathermap.org/img/wn/${weatherModel.iconCode}@2x.png',
        ),
        const SizedBox(height: 16),
        Text('${weatherModel.temp}°C'),
      ],
    );
  }
}
