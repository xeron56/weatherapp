import 'package:json_annotation/json_annotation.dart';
import 'package:weatherapp/domain/entities/weather.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Weather {
  @JsonKey(name: 'main')
  final WeatherMainModel weatherMain;
  @JsonKey(name: 'weather')
  final List<WeatherDetailModel> weatherDetails;

  WeatherModel({
    required super.cityName,
    required this.weatherMain,
    required this.weatherDetails,
  }) : super(
          temperature: weatherMain.temp,
          description: weatherDetails.first.description,
          iconCode: weatherDetails.first.icon);

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class WeatherMainModel {
  final double temp;

  WeatherMainModel({required this.temp});

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainModelToJson(this);
}

@JsonSerializable()
class WeatherDetailModel {
  final String description;
  final String icon;

  WeatherDetailModel({required this.description, required this.icon});

  factory WeatherDetailModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailModelToJson(this);
}