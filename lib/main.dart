import 'dart:ui';

import 'package:daarul_ukhuwwah_media/bloc/hide_navbar.dart';
import 'package:daarul_ukhuwwah_media/component/appbar.dart';
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
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: MyAppBar(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Daarul Ukhuwwah Putra 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 30,
                    )
                  ],
                )
              ],
            ),
          ),
          body: MyNavBar(),
        ),
      ),
    );
  }
}
