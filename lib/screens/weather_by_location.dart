// ignore_for_file: avoid_print, unused_local_variable

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather/functions/functions.dart';

// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool servicestatus = false;
//   bool haspermission = false;
//   late LocationPermission permission;
//   late Position position;
//   String long = "", lat = "";
//   late StreamSubscription<Position> positionStream;

//   @override
//   void initState() {
//     checkGps();
//     super.initState();
//   }

//   checkGps() async {
//     servicestatus = await Geolocator.isLocationServiceEnabled();
//     if (servicestatus) {
//       permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           print('Location permissions are denied');
//         } else if (permission == LocationPermission.deniedForever) {
//           print("'Location permissions are permanently denied");
//         } else {
//           haspermission = true;
//         }
//       } else {
//         haspermission = true;
//       }

//       if (haspermission) {
//         setState(() {
//           //refresh the UI
//         });

//         getLocation();
//       }
//     } else {
//       print("GPS Service is not enabled, turn on GPS location");
//     }

//     setState(() {
//       //refresh the UI
//     });
//   }

//   getLocation() async {
//     position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print(position.longitude); //Output: 80.24599079
//     print(position.latitude); //Output: 29.6593457

//     long = position.longitude.toString();
//     lat = position.latitude.toString();

//     setState(() {
//       //refresh UI
//     });

//     LocationSettings locationSettings = const LocationSettings(
//       accuracy: LocationAccuracy.high, //accuracy of the location data
//       distanceFilter: 100, //minimum distance (measured in meters) a
//       //device must move horizontally before an update event is generated;
//     );

//     StreamSubscription<Position> positionStream =
//         Geolocator.getPositionStream(locationSettings: locationSettings)
//             .listen((Position position) {
//       print(position.longitude); //Output: 80.24599079
//       print(position.latitude); //Output: 29.6593457

//       long = position.longitude.toString();
//       lat = position.latitude.toString();
//       setState(() {
//         //refresh UI on update
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: const Text("Get GPS Location"),
//             backgroundColor: Colors.redAccent),
//         body: Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(50),
//             child: Column(children: [
//               Text(servicestatus ? "GPS is Enabled" : "GPS is disabled."),
//               Text(haspermission ? "GPS is Enabled" : "GPS is disabled."),
//               Text("Longitude: $long", style: const TextStyle(fontSize: 20)),
//               Text(
//                 "Latitude: $lat",
//                 style: const TextStyle(fontSize: 20),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       fetchweather('london');
//                     });
//                   },
//                   child: const Text('Location'))
//             ])));
//   }
// }
