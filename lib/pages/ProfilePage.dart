import 'dart:ui';

import 'package:daarul_ukhuwwah_media/component/profile_pict.dart';
import 'package:daarul_ukhuwwah_media/models/cuperListTile.dart';
import 'package:daarul_ukhuwwah_media/screens/delete_screen.dart';
import 'package:daarul_ukhuwwah_media/screens/post_screen.dart';
import 'package:daarul_ukhuwwah_media/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, dynamic>> menu = [
    {
      'icon': CupertinoIcons.add,
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
      'title': 'Camera',
      'info': 'camera',
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: ProfilePict()),
          CupertinoListSection(
            topMargin: 0,
            backgroundColor: Theme.of(context).colorScheme.background,
            children: listTiles,
          )
        ],
      ),
    );
  }
}
