import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String description;
  final Icon icon;

  WeatherModel({
    required this.icon,
    required this.city,
    required this.temp,
    required this.description,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temp: json['main']['temp'],
      description: json['weather']['description'],
      maxTemp: json['main']['temp_max'],
      minTemp: json['main']['temp_min'],
      icon: json['weather']['icon'],
    );
  }
}
