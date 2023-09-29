import 'dart:ui';

import 'package:daarul_ukhuwwah_media/component/profile_pict.dart';
import 'package:daarul_ukhuwwah_media/models/cuperListTile.dart';
import 'package:daarul_ukhuwwah_media/screens/delete_screen.dart';
import 'package:daarul_ukhuwwah_media/screens/post_screen.dart';
import 'package:daarul_ukhuwwah_media/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<Map<String, dynamic>> menu = [
    {
      'icon': CupertinoIcons.person,
      'page': LoginScreen(),
      'title': 'Account',
      'info': 'oioeoi',
    },
    {
      'icon': CupertinoIcons.settings,
      'page': AccountSettings(),
      'title': 'Settings',
      'info': 'settings',
    },
    {
      'icon': CupertinoIcons.camera,
      'page': PostScreen(),
      'title': 'Post',
      'info': 'post',
    },
    {
      'icon': CupertinoIcons.delete,
      'page': DeleteScreen(),
      'title': 'Delete',
      'info': 'delete',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> listTiles = [];

    for (var i = 0; i < menu.length; i++) {
      listTiles.add(
        InkWell(
          onTap: () {
            setState(() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => menu[i]['page'],
                ),
              );
            });
          },
          child: CuperListTile(
            icon: menu[i]['icon'],
            title: menu[i]['title'],
            children: [
              Text(menu[i]['info']),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              ),
            ],
          ),
        ),
      );
    }
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Settings'),
            brightness: Brightness.light,
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(child: ProfilePict()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: CupertinoListSection(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    topMargin: 0,
                    children: listTiles,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Flutter code sample for [CupertinoSliverNavigationBar].

void main() => runApp(const SliverNavBarApp());

class SliverNavBarApp extends StatelessWidget {
  const SliverNavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: SliverNavBarExample(),
    );
  }
}

class SliverNavBarExample extends StatelessWidget {
  const SliverNavBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            leading: Icon(CupertinoIcons.person_2),
            // This title is visible in both collapsed and expanded states.
            // When the "middle" parameter is omitted, the widget provided
            // in the "largeTitle" parameter is used instead in the collapsed state.
            largeTitle: Text('Contacts'),
            trailing: Icon(CupertinoIcons.add_circled),
          ),
          // This widget fills the remaining space in the viewport.
          // Drag the scrollable area to collapse the CupertinoSliverNavigationBar.
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Drag me up', textAlign: TextAlign.center),
                CupertinoButton.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return const NextPage();
                        },
                      ),
                    );
                  },
                  child: const Text('Go to Next Page'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = CupertinoTheme.brightnessOf(context);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: CupertinoColors.systemYellow,
            border: Border(
              bottom: BorderSide(
                color: brightness == Brightness.light
                    ? CupertinoColors.black
                    : CupertinoColors.white,
              ),
            ),
            // The middle widget is visible in both collapsed and expanded states.
            middle: const Text('Contacts Group'),
            // When the "middle" parameter is implemented, the largest title is only visible
            // when the CupertinoSliverNavigationBar is fully expanded.
            largeTitle: const Text('Family'),
          ),
          const SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Drag me up', textAlign: TextAlign.center),
                // When the "leading" parameter is omitted on a route that has a previous page,
                // the back button is automatically added to the leading position.
                Text('Tap on the leading button to navigate back',
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
