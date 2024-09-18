import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.black12,
  Colors.red,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
  Colors.green,
  Colors.greenAccent
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equals than ${colorList.length - 1}');
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      // configuracion para AppBar = para que este no se ubique en el centro
      appBarTheme: const AppBarTheme(centerTitle: false));
}
