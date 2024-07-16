import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weatherapp/core/utils/constants.dart';
import 'package:weatherapp/data/models/weather_model.dart';

part 'weather_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class WeatherRemoteDataSource {
  factory WeatherRemoteDataSource(Dio dio, {String baseUrl}) =
      _WeatherRemoteDataSource;

  @GET('/weather')
  Future<WeatherModel> getWeatherForCity({
    @Query('q') required String cityName,
    @Query('appid') String apiKey = apiKey,
    @Query('units') String units = 'metric', 
  });
}