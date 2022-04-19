import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:weather_with_mobx/controller/weather.dart';
// import 'package:weather_with_mobx/model/weather_model.dart';
import 'package:weather_with_mobx/model/wmodel.dart';
import 'package:weather_with_mobx/view/features/homescreen/presentation/widgets/air_humidity.dart';
import 'package:weather_with_mobx/view/features/homescreen/presentation/widgets/search_city_temp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<WeatherApp>();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.blueAccent,
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade800,
                      Colors.blue.shade300,
                    ]),
              ),
              child: Observer(builder: (context) {
                return FutureBuilder<WeatherData?>(
                    future: state.fetchWeatherData(),
                    builder: ((context, snapshot) {
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return const Center(
                      //     child: CircularProgressIndicator(
                      //       color: Colors.white,
                      //     ),
                      //   );
                      // }

                      if (snapshot.hasData) {
                        final double temperatue =
                            snapshot.data!.main!.temp! - 273.15;
                        final icon =
                            snapshot.data!.weather.first.icon.toString();
                        return state.loading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Column(children: [
                                  SearchTemp(),
                                  Container(
                                      width: 350,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 70,
                                            width: 70,
                                            child: Image.network(
                                                "http://openweathermap.org/img/wn/$icon@2x.png"),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                snapshot.data!.weather.first
                                                    .description
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                // snapshot.data!.sys!.country
                                                //     .toString()
                                                //     .toString(),

                                                "${snapshot.data!.name}, ${snapshot.data!.sys!.country}",

                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                        height: 180,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        padding: const EdgeInsets.all(25),
                                        child: Column(children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "assets/heat.png",
                                                  width: 45,
                                                  height: 45,
                                                ),
                                              ]),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  temperatue
                                                      .toString()
                                                      .substring(0, 2),
                                                  style: const TextStyle(
                                                      fontSize: 70.0),
                                                ),
                                                Image.asset(
                                                  "assets/celsius.png",
                                                  width: 60,
                                                  height: 50,
                                                )
                                              ]),
                                        ])),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AirHumidity(
                                        image: "assets/wind.png",
                                        detail:
                                            snapshot.data!.wind!.speed.toInt(),
                                        des: "Km/hr",
                                      ),
                                      AirHumidity(
                                        image: "assets/humidity.png",
                                        detail: snapshot.data!.main!.humidity!
                                            .toInt(),
                                        des: "Percent",
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                          "assets/mlogo.png",
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Mousam ka HalChal",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "By: Saddam Afzal",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                              );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                    }));
              })),
        ));
  }
}
