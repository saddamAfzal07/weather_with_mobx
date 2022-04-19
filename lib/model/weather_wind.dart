import 'package:json_annotation/json_annotation.dart';
part 'weather_wind.g.dart';

@JsonSerializable()
class WeatherWind {
  double speed;

  WeatherWind(
    this.speed,
  );
  factory WeatherWind.fromJson(Map<String, dynamic> json) =>
      _$WeatherWindFromJson(json);
}
