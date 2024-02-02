
import 'dart:ui';

import 'package:flutter/material.dart';

class ProjectColors {
  static Color mainColor = Color(0xff6cbaff);
  static Color accentColor = Color(0xff007bff);
  static Color whiteColor = Colors.white;
  static Color blueColor = Colors.blue;
  static Color whiteColor10 = Colors.white10;
  static Color blackColor = Colors.black;
  static Color greyColors200 = Colors.grey.shade200;
  static Color amberColor =  Colors.amber;
  static Color greyColor =  Colors.grey;
  static Color greenColor =  Colors.green;
  static Color tealColor =  Colors.teal;
  static const Color grayColors = Color.fromRGBO(212, 212, 212, 1);
  static const Color moreGrayColors = Color.fromARGB(255, 235, 235, 235);
  static const Color garyterColors = Color(0xff757575);
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });

  return MaterialColor(color.value, swatch);
}