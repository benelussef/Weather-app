import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context).weather == null
              ? Colors.orange
              : Provider.of<WeatherProvider>(context).weather!.getThemeColor()),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
