// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:weather/screens/weather_by_city.dart';
// class Background extends StatefulWidget {
//   const Background({Key? key}) : super(key: key);

//   @override
//   State<Background> createState() => _BackgroundState();
// }

// class _BackgroundState extends State<Background> {
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Stack(
//         children: [
//           SizedBox(
//             height: h,
//             width: w,
//             child: Lottie.asset(
//                 'assets/lottie/windy.json',
//                 fit: BoxFit.cover),
//           ),
//           const Cityweather(),
          
//         ],
//       ),
//     );
//   }
// }