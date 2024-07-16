import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/injection_container.dart';
import 'package:weatherapp/presentation/controllers/weather_controller.dart';
import 'package:weatherapp/presentation/widgets/weather_display_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return GetBuilder<WeatherController>(
    init: sl<WeatherController>(),
    builder: (_controller) => Scaffold(
      appBar: AppBar(
        title: const Text('Simple Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (cityName) {
                _controller.cityName.value = cityName;
              },
              decoration: const InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.getWeather();
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (_controller.isLoading.value) {
                return const CircularProgressIndicator();
              } else if (_controller.weather.value != null) {
                return WeatherDisplayWidget(
                    weather: _controller.weather.value!);
              } else if (_controller.error.isNotEmpty) {
                return Text(
                  _controller.error.value,
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    ),
  );
}
}