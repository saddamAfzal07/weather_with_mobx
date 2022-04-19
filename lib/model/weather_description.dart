import 'package:json_annotation/json_annotation.dart';
part 'weather_description.g.dart';

@JsonSerializable()
class WeatherDes {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherDes({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherDes.fromJson(Map<String, dynamic> json) =>
      _$WeatherDesFromJson(json);
}
