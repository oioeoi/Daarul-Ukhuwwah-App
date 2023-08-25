import 'dart:developer';

import 'package:daarul_ukhuwwah_media/model/img_movie.dart';
import 'package:daarul_ukhuwwah_media/services/get_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Movie? result = await Services.getId(1);
          print(result);
        },
      ),
    );
  }
}
