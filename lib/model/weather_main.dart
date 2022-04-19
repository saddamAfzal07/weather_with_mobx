import 'package:json_annotation/json_annotation.dart';
part 'weather_main.g.dart';

@JsonSerializable()
class WeatherMain {
  double? temp;
  int? humidity;

  WeatherMain(this.temp, this.humidity);
  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);
}
