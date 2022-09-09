import 'package:flutter/material.dart';

class WeatherModel {
  String city;
  String date;
  double temp;
  double tempMax;
  double tempMin;
  String weatherStateName;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.temp,
      required this.tempMax,
      required this.tempMin,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        city: data['location']['name'],
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        tempMax: jsonData['maxtemp_c'],
        tempMin: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'date : $date';
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName.contains('snow') ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName.contains('cloudy')) {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName.contains('rain') ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstrom') {
      return 'assets/images/thunderstrom.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName.contains('snow') ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName.contains('cloudy')) {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName.contains('rain') ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstrom') {
      return Colors.grey;
    } else {
      return Colors.orange;
    }
  }
}
