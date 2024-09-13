import 'package:flutter/material.dart';

class WeatherDataModel extends ChangeNotifier {
  String city = '';
  cityNotifier() {
    notifyListeners();
  }
}
