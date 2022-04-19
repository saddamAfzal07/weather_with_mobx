import 'package:json_annotation/json_annotation.dart';
part 'weather_sys.g.dart';

@JsonSerializable()
class WeatherSys {
  String country;

  WeatherSys(
    this.country,
  );

  factory WeatherSys.fromJson(Map<String, dynamic> json) =>
      _$WeatherSysFromJson(json);
}
