import 'package:daarul_ukhuwwah_media/bloc/hide_navbar.dart';
import 'package:daarul_ukhuwwah_media/component/navbar.dart';
import 'package:daarul_ukhuwwah_media/theme/dark.dart';
import 'package:daarul_ukhuwwah_media/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomBarVisibilityProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: MyNavBar(),
      ),
    );
  }
}
