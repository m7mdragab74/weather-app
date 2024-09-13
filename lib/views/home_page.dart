import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/search_page.dart';
import 'package:weather_app/widget/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<WeatherModel?> weatherFuture;
  String cityName = 'Cairo';

  @override
  void initState() {
    super.initState();
    _getWeather(cityName);
  }

  void _getWeather(String city) {
    setState(() {
      weatherFuture = Provider.of<WeatherService>(context, listen: false)
          .getCurrentWeather(cityName: city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
              if (result != null) {
                cityName = result;
                _getWeather(cityName);
              }
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<WeatherModel?>(
        future: weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            return WeatherInfoBody(weatherModel: snapshot.data!);
          } else {
            return const Center(
              child: Text(
                'No weather data available.',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
