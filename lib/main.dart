import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather%20cubit/weather_cubit.dart';
import 'package:weather_app/services/current_weather_services.dart';
import 'package:weather_app/views/home_page.dart';

import 'services/forecast_weather_services.dart';

void main() {
  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        CurrentWeatherServices(Dio()),
        ForecastWeatherServices(Dio()),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
