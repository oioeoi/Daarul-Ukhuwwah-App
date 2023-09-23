import 'dart:async';
import 'package:daarul_ukhuwwah_media/component/post_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../model/post_model.dart';
import '../services/fetch_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  List<Product> users = [];

  loadData() async {
    final result = await ProductServices().fetchData();
    List<dynamic> dataList = result;
    for (var i = 0; i < result.length; i++) {
      users.add(
        Product(
          id: dataList[i]['id'],
          title: dataList[i]['title'],
          description: dataList[i]['description'],
          price: dataList[i]['price'],
          discountPercentage: dataList[i]['discountPercentage'],
          stock: dataList[i]['stock'],
          brand: dataList[i]['brand'],
          category: dataList[i]['category'],
          thumbnail: dataList[i]['thumbnail'],
          images: dataList[i]['images'],
        ),
      );
    }
    if (mounted == true) {
      setState(
        () {
          _isLoading = false;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
        : RefreshIndicator(
            onRefresh: () => loadData(),
            color: Colors.blue,
            displacement: 200,
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = users[index];
                  final List images = data.images;
                  final String title = data.title.toString();
                  final String desc = data.description.toString();
                  return PostView(
                    images: images,
                    title: title,
                    desc: desc,
                  );
                },
              ),
            ),
          );
  }
}
