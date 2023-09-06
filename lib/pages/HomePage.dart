import 'package:daarul_ukhuwwah_media/component/post_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  List<Map<String, dynamic>> products = [];
  List images = [];
  String title = '';
  String desc = '';

  Future getData() async {
    setState(() {
      products.clear();
      _isLoading = true;
    });
    var url = 'https://dummyjson.com/products';
    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        setState(
          () {
            products =
                List<Map<String, dynamic>>.from(response.data['products']);
            _isLoading = false;
          },
        );
      }
    } catch (e) {
      print('ini errornya : ' + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
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
            onRefresh: () => getData(),
            color: Colors.blue,
            displacement: 200,
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  images = products[index]['images'];
                  title = products[index]['title'];
                  desc = products[index]['description'];
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
