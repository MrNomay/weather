// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:ui';
import 'package:shimmer/shimmer.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/functions/functions.dart';
import 'package:weather/functions/widgets.dart';
import 'package:weather/models/weathermodel.dart';

class Cityweather extends StatefulWidget {
  const Cityweather({
    Key? key,
  }) : super(key: key);
  @override
  State<Cityweather> createState() => _CityweatherState();
}

class _CityweatherState extends State<Cityweather> {
  @override
  void initState() {
    super.initState();
    city == 'karachi' ? currentweather = fetchweather(city) : null;
  }

  var now = DateTime.now();
  String city = 'karachi';
  late Future<Weather> currentweather;
  TextEditingController control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder<Weather>(
          future: currentweather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                baseColor: Colors.black45,
                highlightColor: Colors.white,
                child: shim(context),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Stack(
                //Background-----------------------------------------------
                children: [
                  SizedBox(
                    height: h,
                    width: w,
                    child: Lottie.asset(
                        snapshot.data!.weather[0].main == 'Clear'
                            ? 'assets/lottie/clear.json'
                            : snapshot.data!.weather[0].main == 'Clouds'
                                ? 'assets/lottie/cloudy.json'
                                : snapshot.data!.weather[0].main == 'Rain'
                                    ? 'assets/lottie/rainy.json'
                                    : snapshot.data!.weather[0].main == 'Snow'
                                        ? 'assets/lottie/snow.json'
                                        : 'assets/lottie/windy.json',
                        fit: BoxFit.cover),
                  ),
                  //Background-----------------------------------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(h / 32),
                      child: Column(
                        children: [
                          SafeArea(
                            child: SizedBox(
                              height: h / 1.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            31, 65, 63, 63),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      cursorColor: Colors.blue,
                                      controller: control,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  city = control.text;
                                                  currentweather =
                                                      fetchweather(city);
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.search,
                                                color: Colors.blue,
                                              )),
                                          label: const Text(
                                            'City',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h / 32,
                                  ),
                                  Text(
                                    snapshot.data!.name.toString() ==
                                            'Yamoussoukro'
                                        ? 'City Not Found'
                                        : snapshot.data!.name.toString(),
                                    style: const TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    snapshot.data!.name.toString() ==
                                            'Yamoussoukro'
                                        ? 'Try Again'
                                        : '${now.day.toString()}/${now.month.toString()}/${now.year.toString()}',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: h / 32,
                                  ),
                                  //Temp-----------------
                                  Text(
                                    '${(snapshot.data!.main.temp - 273.15).toStringAsFixed(0)}\u2103',
                                    style: const TextStyle(
                                        fontSize: 72,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: h / 64,
                                  ),
                                  DottedLine(
                                    direction: Axis.horizontal,
                                    lineLength: w / 2,
                                    lineThickness: h / 376,
                                    dashLength: w / 44,
                                    dashColor: Colors.white,
                                  ),
                                  SizedBox(
                                    height: h / 64,
                                  ),
                                  Text(
                                    (snapshot.data!.weather[0].main),
                                    style: const TextStyle(
                                        fontSize: 42,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: h / 128,
                                  ),
                                  Text(
                                    '${(snapshot.data!.main.tempMin - 273.15).toStringAsFixed(0)}\u2103/${(snapshot.data!.main.tempMax - 273.15).toStringAsFixed(0)}\u2103',
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: w / 16, bottom: h / 64),
                                    child: const Text(
                                      'Weather Details:',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: w,
                                    height: h / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white.withOpacity(0.1),
                                        border: Border.all(
                                            width: 2, color: Colors.white30)),
                                    child: GridView.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 1,
                                      crossAxisSpacing: 1,
                                      childAspectRatio: 6 / 3,
                                      children: [
                                        view(
                                            'Description',
                                            snapshot
                                                .data!.weather[0].description),
                                        view('Feels like',
                                            '${(snapshot.data!.main.feelsLike - 273.15).toStringAsFixed(0)} \u2103'),
                                        view('Humidity',
                                            "${(snapshot.data!.main.humidity).toStringAsFixed(0)}%"),
                                        view('Pressure',
                                            '${(snapshot.data!.main.pressure).toStringAsFixed(0)} hPa'),
                                        view('Wind speed',
                                            '${(snapshot.data!.wind.speed)}km'),
                                        view(
                                            'Clouds',
                                            snapshot.data!.clouds.all
                                                .toStringAsFixed(0))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
