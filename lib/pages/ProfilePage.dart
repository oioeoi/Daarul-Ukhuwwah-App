import 'package:daarul_ukhuwwah_media/component/profile_pict.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(child: ProfilePict()),
          CupertinoListSection(
            backgroundColor: Theme.of(context).colorScheme.background,
            children: [
              CupertinoListTile(
                leading: Icon(CupertinoIcons.settings),
                title: Text('Setting Head'),
                subtitle: Text('Subtitle'),
                additionalInfo: Text('Additional'),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.settings),
                title: Text('Setting Head'),
                subtitle: Text('Subtitle'),
                additionalInfo: Text('Additional'),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.settings),
                title: Text('Setting Head'),
                subtitle: Text('Subtitle'),
                additionalInfo: Text('Additional'),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.settings),
                title: Text('Setting Head'),
                subtitle: Text('Subtitle'),
                additionalInfo: Text('Additional'),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.settings),
                title: Text('Setting Head'),
                subtitle: Text('Subtitle'),
                additionalInfo: Text('Additional'),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.settings),
                title: Text('Setting Head'),
                subtitle: Text('Subtitle'),
                additionalInfo: Text('Additional'),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.settings),
                title: Text('Setting Head'),
                subtitle: Text('Subtitle'),
                additionalInfo: Text('Additional'),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.settings),
                title: Text('Setting Head'),
                subtitle: Text('Subtitle'),
                additionalInfo: Text('Additional'),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.settings),
                title: Text('Setting Head'),
                subtitle: Text('Subtitle'),
                additionalInfo: Text('Additional'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
