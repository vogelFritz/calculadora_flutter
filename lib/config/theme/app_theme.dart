import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.white,
  Colors.black,
  Colors.purple,
  Colors.teal,
  Colors.orangeAccent,
  Colors.green
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colors.length,
            'selectedColor debe estar entre 0 y ${colors.length - 1}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: colors[selectedColor],
    );
  }
}
