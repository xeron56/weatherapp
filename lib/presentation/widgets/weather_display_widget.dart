import 'package:flutter/material.dart';
import 'package:weatherapp/domain/entities/weather.dart';

class WeatherDisplayWidget extends StatelessWidget {
  final Weather weather;

  const WeatherDisplayWidget({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.cityName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          '${weather.temperature.toStringAsFixed(1)} °C',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 10),
        Text(
          weather.description,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Image.network(
          'https://openweathermap.org/img/w/${weather.iconCode}.png',
        ),
      ],
    );
  }
}