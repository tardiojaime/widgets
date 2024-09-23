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
  final bool isDarkmode;

  AppTheme({this.selectedColor = 0, this.isDarkmode = false})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equals than ${colorList.length - 1}');
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      // configuracion para AppBar = para que este no se ubique en el centro
      appBarTheme: const AppBarTheme(centerTitle: false));
  // No se recomienda cambiar el tipo final para realizar cambios en el desde el themeNotifierProvider
  // en el caso de realizar cambios en el darkMode desde el themeNotifier
  // en su Lugar Se recomienda realiza una copia de la clase | mantener un estado inmutable
  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkmode: isDarkmode ?? this.isDarkmode);
}
