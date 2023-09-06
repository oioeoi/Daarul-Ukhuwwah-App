import 'package:daarul_ukhuwwah_media/pages/LandingPage.dart';
import 'package:daarul_ukhuwwah_media/theme/light.dart';
import 'package:flutter/material.dart';

import 'theme/dark.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: LandingPage(),
    );
  }
}
