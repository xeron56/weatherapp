import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weatherapp/core/network/network_info_impl.dart';
import 'package:weatherapp/core/platform/network_info.dart';
import 'package:weatherapp/data/datasources/weather_remote_datasource.dart';
import 'package:weatherapp/data/repositories/weather_repository_impl.dart';
import 'package:weatherapp/domain/repositories/weather_repository.dart';
import 'package:weatherapp/domain/usecases/get_weather_usecase.dart';
import 'package:weatherapp/presentation/controllers/weather_controller.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Weather
  // Bloc
  sl.registerFactory(() => WeatherController(getWeatherUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetWeatherUseCase(sl()));

  // Repository
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSource(sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ))
    ..interceptors.add(RetryInterceptor(
      dio: Dio(),
      logPrint: print,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 3),
        Duration(seconds: 5),
      ],
    )));
}