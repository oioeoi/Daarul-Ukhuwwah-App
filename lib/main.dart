import 'package:daarul_ukhuwwah_media/theme/light.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:daarul_ukhuwwah_media/component/appbar.dart';
import 'package:daarul_ukhuwwah_media/component/navbar.dart';
import 'package:daarul_ukhuwwah_media/pages/AlbumPage.dart';
import 'package:daarul_ukhuwwah_media/pages/HomePage.dart';
import 'package:daarul_ukhuwwah_media/pages/ProfilePage.dart';
import 'package:ionicons/ionicons.dart';
import 'bloc/product_bloc.dart';
import 'theme/dark.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetProductEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;
  List<Map<String, dynamic>> barItem = [
    {
      'icon': Ionicons.home,
      'label': 'Home',
      'page': HomePage(),
    },
    {
      'icon': Ionicons.albums,
      'label': 'Albums',
      'page': AlbumPage(),
    },
    {
      'icon': Ionicons.person,
      'label': 'Profile',
      'page': ProfilePage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];
    for (var index = 0; index < barItem.length; index++) {
      _navBarItemList.add(
        buildNavigationItem(
          barItem[index]['icon'],
          index,
          barItem[index]['label'],
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Daarul Ukhuwwah",
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
                  Icon(Ionicons.moon),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      body: barItem[selectedIndex]['page'],
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
            barItem[selectedIndex]['page'];
          },
        );
      },
      child: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width / barItem.length,
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
