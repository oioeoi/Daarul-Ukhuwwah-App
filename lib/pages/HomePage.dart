import 'package:daarul_ukhuwwah_media/component/post_view.dart';
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
  List<Product> users = [];
  bool _isLoading = true;

  loadData() async {
    final result = await ProductServices().fetchData();
    if (result == null) return;

    if (mounted == true && result != null) {
      setState(
        () {
          users.addAll(result);
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
