// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:weather/functions/functions.dart';
// import 'package:weather/models/weathermodel.dart';
// import 'package:weather/screens/weather_by_city.dart';

// class Homestart extends StatefulWidget {
//   const Homestart({Key? key}) : super(key: key);

//   @override
//   State<Homestart> createState() => _HomestartState();
// }

// class _HomestartState extends State<Homestart> {
//    TextEditingController city = TextEditingController();
//    late Future<Weather> currentweather;
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     return Column(
//       children: [
//         const Spacer(flex: 5,),
//         Padding(
//           padding:  EdgeInsets.all(h/32),
//           child: ClipRRect(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(
//                 sigmaX: 2,sigmaY: 2
//               ),
//               child: Container(
//                 height: MediaQuery.of(context).size.height/3,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white30,
//                   border: Border.all(width: 2,color: Colors.white38),
//                   borderRadius: BorderRadius.circular(30)
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                   const Text('Enter City',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height/32,
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width/1.2,
//                               decoration: BoxDecoration(
//                                   color: Colors.white10,
//                                   borderRadius: BorderRadius.circular(30)),
//                               child: TextFormField(
//                                 cursorColor: Colors.blue,
//                                 controller: city,
//                                 textCapitalization: TextCapitalization.sentences,
//                                 decoration: InputDecoration(
//                                     suffixIcon: IconButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             currentweather = fetchweather(city.text);
//                                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>
//                                              Cityweather()));
//                                           });
//                                         },
//                                         icon: const Icon(
//                                           Icons.arrow_forward_ios,
//                                           color: Colors.blue,
//                                         )),
//                                     label: const Text(
//                                       'City',
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                     border: const OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(Radius.circular(30)))),
//                               ),
//                             ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const Spacer(flex: 1,),
//       ],
//     );
//   }
// }