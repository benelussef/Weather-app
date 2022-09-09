import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData = Provider.of<WeatherProvider>(context).weather;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather app"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weather == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'There is no weather 😌',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Start searching now 🔎',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
                weatherData!.getThemeColor()[50]!,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    weatherData!.city.toString(),
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Updated ${weatherData.date.toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData.getImage()),
                      Text(
                        weatherData.temp.toInt().toString(),
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                              'tempMin : ${weatherData.tempMin.toInt().toString()}'),
                          Text(
                              'tempMax : ${weatherData.tempMax.toInt().toString()}'),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weatherData.weatherStateName.toString(),
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
