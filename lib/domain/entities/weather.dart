import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;
  final String description;
  final String iconCode;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.iconCode,
  });

  @override
  List<Object?> get props => [
        cityName,
        temperature,
        description,
        iconCode,
      ];
}