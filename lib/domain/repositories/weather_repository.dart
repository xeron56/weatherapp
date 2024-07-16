import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherForCity(String cityName);
}