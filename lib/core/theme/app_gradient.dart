import 'package:flutter/material.dart';

class AppGradients {
  AppGradients._();

  static const LinearGradient background = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 155, 200, 249),
      Color(0xFFF9FCFF),
      Color(0xFFEAF4FF),
      Color.fromARGB(255, 155, 200, 249),
    ],
  );
}