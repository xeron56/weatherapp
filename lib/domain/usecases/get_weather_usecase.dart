import 'package:weatherapp/domain/entities/weather.dart';
import 'package:weatherapp/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/failures.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Either<Failure, Weather>> call(String cityName) async {
    return await repository.getWeatherForCity(cityName);
  }
}