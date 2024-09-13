import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widget/forcast_widget.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weatherModel,
    required this.forecastWeatherList,
  });

  final WeatherModel weatherModel;
  final List<WeatherModel> forecastWeatherList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.city,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'http://openweathermap.org/img/wn/${weatherModel.iconCode}@2x.png',
              ),
              Text(
                '${weatherModel.temp}°C',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Max: ${weatherModel.maxTemp}°C',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Min: ${weatherModel.minTemp}°C',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            weatherModel.description,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 45),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(forecastWeatherList.length, (index) {
                return ForWidget(weatherModel: forecastWeatherList[index]);
              }),
            ),
          )
        ],
      ),
    );
  }
}
