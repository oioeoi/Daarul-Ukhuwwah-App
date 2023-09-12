import 'package:daarul_ukhuwwah_media/component/profile_pict.dart';
import 'package:daarul_ukhuwwah_media/model/cuperListTile.dart';
import 'package:daarul_ukhuwwah_media/screen/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, dynamic>> menu = [
    {
      'icon': CupertinoIcons.add,
      'title': 'Account',
      'info': 'oioeoi',
    },
    {
      'icon': CupertinoIcons.settings,
      'title': 'Settings',
      'info': 'settings',
    },
    {
      'icon': CupertinoIcons.camera,
      'title': 'Camera',
      'info': 'camera',
    },
    {
      'icon': CupertinoIcons.delete,
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
                  builder: (context) => AccountSettings(),
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
    return SafeArea(
      child: Column(
        children: [
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
