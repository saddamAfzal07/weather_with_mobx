import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_with_mobx/controller/weather.dart';
import 'package:weather_with_mobx/view/features/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<WeatherApp>(
      create: (context) => WeatherApp(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(primaryColor: Colors.blue),
        home: const SplashScreen(),
      ),
    );
  }
}
