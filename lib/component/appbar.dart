import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Daarul Ukhuwwah Putra 1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_drop_down_rounded,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
