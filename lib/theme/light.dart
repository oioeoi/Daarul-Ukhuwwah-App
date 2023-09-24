import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey[200]),
  colorScheme: ColorScheme.light(
    background: Colors.grey[200]!,
    primary: Colors.grey[100]!,
    secondary: Colors.grey[300]!,
  ),
);
