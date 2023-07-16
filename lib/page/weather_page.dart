import 'package:flutter/material.dart';
import 'package:flutter_project_1/response/current_weather.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Future<String?> getWeather() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?appid=ccbfe0e0d094b928e7c88e8db055dfe5&q=kathmandu&units=metric'));
    if (response.statusCode == 200) {
      WeatherResponse weatherResponse = weatherResponseFromJson(response.body);
      return weatherResponse.main.temp.toString();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String?>(
          future: getWeather(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Current Temp',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${snapshot.data}°C',
                        style: const TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 60),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blueGrey),
                        child: IconButton(
                          icon: const Icon(
                            Icons.refresh_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ]),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
