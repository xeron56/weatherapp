import 'package:weatherapp/core/error/exceptions.dart';
import 'package:weatherapp/core/platform/network_info.dart';
import 'package:weatherapp/data/datasources/weather_remote_datasource.dart';
import 'package:weatherapp/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Weather>> getWeatherForCity(
      String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeather =
            await remoteDataSource.getWeatherForCity(cityName: cityName);
        return Right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure()); 
    }
  }
}