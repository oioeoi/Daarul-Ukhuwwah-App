import 'dart:ui';
import 'package:daarul_ukhuwwah_media/component/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 350,
          color: Colors.grey[400],
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.daarul-ukhuwwah.org/wp-content/uploads/2022/10/IMG_0023-940x528.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
