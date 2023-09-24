import 'package:daarul_ukhuwwah_media/model/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/fetch_services.dart';

class AlbumPage extends StatefulWidget {
  AlbumPage({super.key});
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  List<Product> users = [];
  bool _isLoading = true;

  loadData() async {
    final result = await ProductServices().fetchData();

    if (mounted == true) {
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
        : Builder(
            builder: (context) {
              return ListView.builder(
                itemCount: users.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final data = users[index];
                  final String title = data.title.toString();
                  final String images = data.images[0];
                  final String sub = data.price.toString();
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          images,
                        ),
                      ),
                      title: Text(title),
                      subtitle: Text(sub),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: 24.0,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
  }
}
