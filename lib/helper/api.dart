import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<dynamic> getCurrentWeather({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'There is a problem with the request, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
