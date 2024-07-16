// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      cityName: json['name'] as String,
      weatherMain:
          WeatherMainModel.fromJson(json['main'] as Map<String, dynamic>),
      weatherDetails: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'main': instance.weatherMain,
      'weather': instance.weatherDetails,
    };

WeatherMainModel _$WeatherMainModelFromJson(Map<String, dynamic> json) =>
    WeatherMainModel(
      temp: (json['temp'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherMainModelToJson(WeatherMainModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };

WeatherDetailModel _$WeatherDetailModelFromJson(Map<String, dynamic> json) =>
    WeatherDetailModel(
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherDetailModelToJson(WeatherDetailModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'icon': instance.icon,
    };
