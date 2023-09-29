import 'package:daarul_ukhuwwah_media/logic/theme_bloc/theme_bloc.dart';
import 'package:daarul_ukhuwwah_media/themes/light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daarul_ukhuwwah_media/pages/HomePage.dart';
import 'package:daarul_ukhuwwah_media/pages/AlbumsPage.dart';
import 'package:daarul_ukhuwwah_media/pages/SettingsPage.dart';
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

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          AlbumsPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onTap: (value) {
          setState(
            () {
              selectedIndex = value;
              _tabController.index = selectedIndex;
            },
          );
        },
        currentIndex: selectedIndex,
        items: [
          buildBottomNavbar(Ionicons.home, 'Home'),
          buildBottomNavbar(Ionicons.albums, 'Album'),
          buildBottomNavbar(Ionicons.settings, 'Setting'),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavbar(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(icon),
      label: label,
    );
  }
}
