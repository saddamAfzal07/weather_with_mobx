// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDes _$WeatherDesFromJson(Map<String, dynamic> json) => WeatherDes(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherDesToJson(WeatherDes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
