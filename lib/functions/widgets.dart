import 'package:flutter/material.dart';

Widget view(String title, String value) {
  return Column(
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
      Text(
        value,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    ],
  );
}

Widget shim(BuildContext context) {
  return Center(
      child: Column(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 16,
        width: MediaQuery.of(context).size.width / 2,
      ),
      Container(
        height: MediaQuery.of(context).size.height / 16,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black45),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 32,
        width: MediaQuery.of(context).size.width / 2,
      ),
      Container(
        height: MediaQuery.of(context).size.height / 12,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black45),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 22,
        width: MediaQuery.of(context).size.width / 2,
      ),
      Container(
        height: MediaQuery.of(context).size.height / 8,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.black45),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 32,
        width: MediaQuery.of(context).size.width / 2,
      ),
      Container(
        height: MediaQuery.of(context).size.height / 12,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.black45),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 16,
        width: MediaQuery.of(context).size.width / 2,
      ),
      Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.1),
            border: Border.all(width: 2, color: Colors.white30)),
      ),
    ],
  ));
}
