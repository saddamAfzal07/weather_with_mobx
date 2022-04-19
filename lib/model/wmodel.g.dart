// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      json['name'] as String?,
      json['sys'] == null
          ? null
          : WeatherSys.fromJson(json['sys'] as Map<String, dynamic>),
      json['main'] == null
          ? null
          : WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
      json['wind'] == null
          ? null
          : WeatherWind.fromJson(json['wind'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherDes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
      'wind': instance.wind,
      'sys': instance.sys,
      'name': instance.name,
    };
