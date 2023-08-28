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
  String json = '';
  List<Map<String, dynamic>> products = [];

  void getData() async {
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
        print(products);
        print(products.length);
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
        : SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> product = products[index];
                List images = product['images'];
                // print(images.length);
                // print(images);
                String imageUrl = images.isNotEmpty ? images[0].toString() : '';
                return Container(
                  height: 600,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: _isLoading ? Colors.grey : Colors.grey[100],
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          product['title'].toString(),
                        ),
                      ),
                      Center(
                        child: Text(
                          product['description'].toString(),
                        ),
                      ),
                      Center(
                        child: Text(
                          images.toString(),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
