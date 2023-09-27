import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuperListTile extends StatelessWidget {
  CuperListTile({
    required this.icon,
    required this.title,
    required this.children,
  });
  final IconData icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: Icon(icon),
      title: Text(title),
      additionalInfo: Row(children: children),
    );
  }
}
