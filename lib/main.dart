import 'package:daarul_ukhuwwah_media/bar/tabbar.dart';
import 'package:daarul_ukhuwwah_media/pages/AlbumPage.dart';
import 'package:daarul_ukhuwwah_media/pages/HomePage.dart';
import 'package:daarul_ukhuwwah_media/pages/ProfilePage.dart';
import 'package:daarul_ukhuwwah_media/theme/dark.dart';
import 'package:daarul_ukhuwwah_media/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  List _barPage = [HomePage(), AlbumPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          appBar: MyAppBar(),
          body: _barPage[selectedIndex],
          bottomNavigationBar: NavigationBar(
            indicatorColor: Theme.of(context).navigationBarTheme.indicatorColor,
            backgroundColor:
                Theme.of(context).navigationBarTheme.backgroundColor,
            selectedIndex: selectedIndex,
            onDestinationSelected: (newValue) => setState(() {
              selectedIndex = newValue;
            }),
            destinations: [
              NavigationDestination(
                icon: Icon(Ionicons.home_outline),
                selectedIcon: Icon(Ionicons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Ionicons.albums_outline),
                selectedIcon: Icon(Ionicons.albums),
                label: 'Albums',
              ),
              NavigationDestination(
                icon: Icon(Ionicons.settings_outline),
                selectedIcon: Icon(Ionicons.settings),
                label: 'Setting',
              ),
            ],
          ),
        ));
  }
}
