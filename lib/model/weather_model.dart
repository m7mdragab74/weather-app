class WeatherModel {
  final String city;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String description;
  final String iconCode;

  WeatherModel({
    required this.iconCode,
    required this.city,
    required this.temp,
    required this.description,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temp: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      maxTemp: json['main']['temp_max'].toDouble(),
      minTemp: json['main']['temp_min'].toDouble(),
      iconCode: json['weather'][0]['icon'],
    );
  }
}
