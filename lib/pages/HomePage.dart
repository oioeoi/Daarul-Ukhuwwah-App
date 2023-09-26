import 'package:daarul_ukhuwwah_media/component/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, int index) {
                final data = state.products[index];
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
          );
        }
        return Center(
          child: Text('No data'),
        );
      },
    );
  }
}
