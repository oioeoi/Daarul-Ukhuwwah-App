import 'package:daarul_ukhuwwah_media/model/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';

class AlbumPage extends StatefulWidget {
  AlbumPage({super.key});
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
        if (state is ProductSuccess) {
          return Builder(
            builder: (context) {
              return ListView.builder(
                itemCount: state.products.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final data = state.products[index];
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
        return Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
