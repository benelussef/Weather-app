import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weather;
  set weather(WeatherModel? weatherModel) {
    _weather = weatherModel;
    notifyListeners();
  }

  WeatherModel? get weather => _weather;
}
