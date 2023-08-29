import 'package:daarul_ukhuwwah_media/model/carousel_model.dart';
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
            // products berbentuk list of map
            products =
                List<Map<String, dynamic>>.from(response.data['products']);
            _isLoading = false;
          },
        );
        print(products[0]['images']);
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
                List images = products[index]['images'];
                // List<dynamic> title = products[index]['title'];
                // List description = products[index]['description'];
                return Container(
                  height: 400,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CarouselImage(listImage: images),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.vertical,
                      //   child: ListView.builder(
                      //     physics: NeverScrollableScrollPhysics(),
                      //     scrollDirection: Axis.vertical,
                      //     itemCount: images.length,
                      //     shrinkWrap: true,
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         height: 100,
                      //         width: 100,
                      //         decoration: BoxDecoration(
                      //           color:
                      //               _isLoading ? Colors.grey : Colors.grey[100],
                      //           image: DecorationImage(
                      //             image: NetworkImage(
                      //               images[index].toString(),
                      //             ),
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //         child: Text(
                      //           images[index].toString(),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
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
                    ],
                  ),
                );
              },
            ),
          );
  }
}
