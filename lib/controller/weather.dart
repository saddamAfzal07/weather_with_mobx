import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_with_mobx/model/wmodel.dart';
part 'weather.g.dart';

class WeatherApp = Weather with _$WeatherApp;

abstract class Weather with Store {
  @observable
  String cityName = "Karachi";

  String apikey = "2dba79d2ea3efcd5c47300a3c61edfaa";

  @observable
  bool loading = false;

  @action
  searchCity(String name) {
    cityName = name;
    fetchWeatherData();
  }

  Future<WeatherData?> fetchWeatherData() async {
    loading = true;
    Response response;
    var dio = Dio();
    response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey');

    print(response.data.toString());

    if (response.statusCode == 200) {
      loading = false;
      WeatherData weatherResult = WeatherData.fromJson(response.data);
      return weatherResult;
    } else {
      return null;
    }
  }
}









// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:weather_with_mobx/model/weather_model.dart';

// class WeatherController extends ChangeNotifier {
//   String cityName = "Karachi";
//   static String _apikey = "2dba79d2ea3efcd5c47300a3c61edfaa";
//   bool loading = false;

//   weatherCall() {
//     fetchweatherdata();
//     notifyListeners();
//   }

//   searchCity(String name) {
//     cityName = name;
//     fetchweatherdata();
//     notifyListeners();
//   }

//   Future<WeatherData> fetchweatherdata() async {
//     loading = true;
//     Response response;
//     var dio = Dio();
//     response = await dio.get(
//         'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apikey');

//     print(response.data.toString());
//     // var data = jsonDecode(response.data.toString());
//     print("===>");
//     // print(data);
//     // print(data);
//     if (response.statusCode == 200) {
//       loading = false;
//       WeatherData weatherResult = WeatherData.fromJson(response.data);
//       return weatherResult;
//     } else {
//       return WeatherData();
//     }
//   }
// }
