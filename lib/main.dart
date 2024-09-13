import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<WeatherService>(create: (_) => WeatherService(dio: Dio())),
      ],
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
