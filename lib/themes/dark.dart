import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black.withAlpha(200),
  ),
  cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
    color: Colors.white,
  ))),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
  ),
);
