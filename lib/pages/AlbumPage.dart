import 'package:daarul_ukhuwwah_media/component/post_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  bool _isLoading = true;
  List<Map<String, dynamic>> productList = [];

  Future fetchData() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        productList =
            List<Map<String, dynamic>>.from(response.data['products']);
        _isLoading = false;
      } else {
        setState(() => _isLoading = false);
        print('Gagal mengambil data: ${response.statusCode}');
      }
    } catch (e) {
      setState(() => _isLoading = false);
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    fetchData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => fetchData(),
      color: Colors.blue,
      displacement: 200,
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return PostView(
                    images: productList[index]['images'],
                    title: productList[index]['title'],
                    desc: productList[index]['description'],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
