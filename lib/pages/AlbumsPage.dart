import 'dart:ui';
import 'package:daarul_ukhuwwah_media/component/post_view.dart';
import 'package:daarul_ukhuwwah_media/logic/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../logic/product_bloc/product_bloc.dart';

class AlbumsPage extends StatelessWidget {
  const AlbumsPage({Key? key}) : super(key: key);

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
          return Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: AppBar(
              elevation: 0,
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SocialBuzzz",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 30,
                      )
                    ],
                  ),
                ],
              ),
              actions: [
                BlocBuilder<ThemeBloc, ThemeMode>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context.read<ThemeBloc>().add(ToggleThemeIconEvent());
                        context.read<ThemeBloc>().add(
                              ThemeChange(
                                state == ThemeMode.dark ? false : true,
                              ),
                            );
                      },
                      icon: Icon(
                        context.select((ThemeBloc bloc) =>
                            bloc.state == ThemeMode.dark
                                ? Ionicons.sunny
                                : Ionicons.moon),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
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
