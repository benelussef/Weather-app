import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  @override
  String? cityName;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onChanged: (data) {
            cityName = data;
          },
          onSubmitted: (data) async {
            cityName = data;
            WeatherService service = WeatherService();
            WeatherModel? weatherModel =
                await service.getWeather(cityName: cityName!);
            Provider.of<WeatherProvider>(context, listen: false).weather =
                weatherModel;
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              border: OutlineInputBorder(),
              hintText: 'Enter City Name',
              label: Text('Search'),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weatherModel =
                      await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false).weather =
                      weatherModel;
                  Navigator.pop(context);
                },
                child: Icon(Icons.search),
              )),
        ),
      )),
    );
  }
}
