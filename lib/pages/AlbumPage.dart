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
  List<Map<String, dynamic>> products = [];
  List images = [];

  Future getData() async {
    if (!mounted) return;
    setState(
      () {
        products.clear();
        _isLoading = true;
      },
    );
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
    return LayoutBuilder(
      builder: (context, constraint) {
        var spacing = 2.0;
        var rowCount = 3;

        return SafeArea(
          child: Wrap(
            runSpacing: spacing,
            spacing: spacing,
            children: List.generate(
              products.length,
              (index) {
                var item = products[index];
                var size = (constraint.biggest.width - (rowCount * spacing)) /
                    rowCount;
                return InkWell(
                  onTap: () => item["onTap"](),
                  child: Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          products[index]['images'].toString(),
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          0.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
