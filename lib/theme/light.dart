import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 253, 167, 5),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white.withOpacity(0.5),
        elevation: 0,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        )),
    colorScheme: ColorScheme.light(
      background: Colors.grey[200]!,
      primary: Colors.grey[100]!,
      secondary: Colors.grey[300]!,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    visualDensity: VisualDensity.adaptivePlatformDensity);
