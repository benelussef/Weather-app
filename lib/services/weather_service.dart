import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    try {
      Uri url = Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=9291a65ea6284db896d195843222002&q=$cityName&days=5&aqi=no&alerts=no');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    } catch (e) {
      return null;
    }
  }
}
