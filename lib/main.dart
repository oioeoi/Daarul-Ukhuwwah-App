import 'package:daarul_ukhuwwah_media/logic/theme_bloc/theme_bloc.dart';
import 'package:daarul_ukhuwwah_media/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:daarul_ukhuwwah_media/component/navbar.dart';
import 'package:daarul_ukhuwwah_media/pages/AlbumPage.dart';
import 'package:daarul_ukhuwwah_media/pages/HomePage.dart';
import 'package:daarul_ukhuwwah_media/pages/ProfilePage.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'logic/product_bloc/product_bloc.dart';
import 'themes/dark.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc()..add(GetProductEvent()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            themeMode: state,
            darkTheme: darkTheme,
            home: LandingPage(),
          );
        },
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
      body: barItem[selectedIndex]['page'],
      bottomNavigationBar: MyNavBar(
        content: Row(children: _navBarItemList),
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
