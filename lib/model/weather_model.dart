import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String description;
  final String iconCode;
  final String date;

  WeatherModel({
    required this.date,
    required this.iconCode,
    required this.city,
    required this.temp,
    required this.description,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      date: json['dt_txt'] ?? "",
      city: json['name'] ?? "",
      temp: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'] ?? "",
      maxTemp: json['main']['temp_max'].toDouble(),
      minTemp: json['main']['temp_min'].toDouble(),
      iconCode: json['weather'][0]['icon'],
    );
  }

  MaterialColor getThemeColor() {
    if (description == 'Sunny' ||
        description == 'clear sky' ||
        description == 'partly cloudy') {
      return Colors.orange;
    } else if (description == 'Blizzard' ||
        description == 'Patchy snow possible' ||
        description == 'Patchy sleet possible' ||
        description == 'Patchy freezing drizzle possible' ||
        description == 'Blowing snow') {
      return Colors.blue;
    } else if (description == 'Freezing fog' ||
        description == 'Fog' ||
        description == 'Heavy Cloud' ||
        description == 'Broken clouds' ||
        description == 'Fog') {
      return Colors.blueGrey;
    } else if (description == 'Patchy rain possible' ||
        description == 'Heavy Rain' ||
        description == 'Showers	') {
      return Colors.blue;
    } else if (description == 'Thundery outbreaks possible' ||
        description == 'Moderate or heavy snow with thunder' ||
        description == 'Patchy light snow with thunder' ||
        description == 'Moderate or heavy rain with thunder' ||
        description == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
