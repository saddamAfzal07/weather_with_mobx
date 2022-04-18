import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:weather_with_mobx/controller/weather.dart';

class SearchTemp extends StatefulWidget {
  @override
  State<SearchTemp> createState() => _SearchTempState();
}

class _SearchTempState extends State<SearchTemp> {
  TextEditingController nameCity = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameCity.clear();
  }

  @override
  Widget build(BuildContext context) {
    var state = context.read<WeatherApp>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24.0)),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  if (nameCity.text.isNotEmpty) {
                    state.searchCity(nameCity.text);
                  }
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                )),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextField(
                controller: nameCity,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Any City Name",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
