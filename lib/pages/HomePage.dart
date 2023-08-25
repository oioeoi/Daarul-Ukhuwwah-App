import 'package:daarul_ukhuwwah_media/bloc/hide_navbar.dart';
import 'package:daarul_ukhuwwah_media/component/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomBarVisibilityProvider>(
      builder: (context, bottomBarVisibilityProvider, child) {
        scrollController.addListener(
          () {
            final direction = scrollController.position.userScrollDirection;

            if (direction == ScrollDirection.forward) {
              if (!bottomBarVisibilityProvider.isVisible) {
                bottomBarVisibilityProvider.show();
              }
            } else if (direction == ScrollDirection.reverse) {
              if (bottomBarVisibilityProvider.isVisible) {
                bottomBarVisibilityProvider.hide();
              }
            }
          },
        );

        return NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.background,
              centerTitle: true,
              floating: true,
              snap: true, //for animation
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                // background: Container(
                //   color: Color.fromARGB(255, 253, 167, 5),
                // ),
                title: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Daarul Ukhuwwah Putra 1",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
          body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 350,
                  color: Colors.grey[400],
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.daarul-ukhuwwah.org/wp-content/uploads/2022/10/IMG_0023-940x528.jpg'),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ],
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
