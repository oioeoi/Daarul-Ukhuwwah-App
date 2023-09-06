import 'dart:ui';
import 'package:daarul_ukhuwwah_media/component/appbar.dart';
import 'package:daarul_ukhuwwah_media/component/navbar.dart';
import 'package:daarul_ukhuwwah_media/pages/AlbumPage.dart';
import 'package:daarul_ukhuwwah_media/pages/HomePage.dart';
import 'package:daarul_ukhuwwah_media/pages/ProfilePage.dart';
import 'package:daarul_ukhuwwah_media/theme/dark.dart';
import 'package:daarul_ukhuwwah_media/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;
  List _barPage = [HomePage(), AlbumPage(), ProfilePage()];
  List<IconData> iconList = [
    Ionicons.home_outline,
    Ionicons.albums_outline,
    Ionicons.settings_outline
  ];
  List iconListSelected = [Ionicons.home, Ionicons.albums, Ionicons.settings];
  List labelListSelected = ['Home', 'Albums', 'Settings'];

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];
    for (var index = 0; index < iconList.length; index++) {
      _navBarItemList.add(
        buildNavigationItem(
          iconListSelected[index],
          index,
          labelListSelected[index],
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: MyAppBar(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Daarul Ukhuwwah Putra 1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 30,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      body: _barPage[selectedIndex],
      bottomNavigationBar: MyNavBar(
        content: Row(
          children: _navBarItemList,
        ),
      ),
    );
  }

  Widget buildNavigationItem(IconData icon, int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            selectedIndex = index;
            _barPage[index];
          },
        );
      },
      child: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width / iconList.length,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                icon,
                color: index == selectedIndex ? Colors.blue : Colors.grey,
              ),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: index == selectedIndex ? Colors.blue : Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
