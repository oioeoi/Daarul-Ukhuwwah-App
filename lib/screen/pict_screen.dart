import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, required this.item});

  final FileImage item;

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Photo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Hero(
          tag: item,
          child: Container(
            width: widthScreen,
            height: widthScreen,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: item,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
