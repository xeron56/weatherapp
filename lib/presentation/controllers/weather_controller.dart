import 'package:get/get.dart';
import 'package:weatherapp/domain/entities/weather.dart';
import 'package:weatherapp/domain/usecases/get_weather_usecase.dart';

class WeatherController extends GetxController {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherController({required this.getWeatherUseCase});

  var cityName = ''.obs;
  var weather = Rx<Weather?>(null);
  var isLoading = false.obs;
  var error = ''.obs;

  Future<void> getWeather() async {
    if (cityName.isNotEmpty) {
      isLoading.value = true;
      error.value = '';

      final result = await getWeatherUseCase(cityName.value);

      result.fold(
        (failure) {
          error.value = failure.toString();
          isLoading.value = false;
        },
        (weatherData) {
          weather.value = weatherData;
          isLoading.value = false;
        },
      );
    }
  }
}