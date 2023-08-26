import 'dart:ui';

import 'package:daarul_ukhuwwah_media/component/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: false,
        itemCount: 10,
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
                      image: AssetImage('images/ppdu_logo.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          );
        });

    // SafeArea(
    //   child: CustomScrollView(
    //     slivers: [
    //       SliverAppBar(
    //         scrolledUnderElevation: 10,
    //         automaticallyImplyLeading: false,
    //         backgroundColor: Theme.of(context).colorScheme.background,
    //         centerTitle: true,
    //         floating: true,
    //         snap: true, //for animation
    //         title: GestureDetector(
    //           onTap: () {},
    //           child: Row(
    //             mainAxisSize: MainAxisSize.min,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 "Daarul Ukhuwwah Putra 1",
    //                 style: TextStyle(fontWeight: FontWeight.bold),
    //               ),
    //               Icon(
    //                 Icons.arrow_drop_down_rounded,
    //                 size: 30,
    //               )
    //             ],
    //           ),
    //         ),
    //         // Color.fromARGB(255, 253, 167, 5),
    //       ),
    //       SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           childCount: 10,
    //           (BuildContext context, int index) {
    //             return Container(
    //               height: 350,
    //               color: Colors.grey[400],
    //               child: Column(
    //                 children: [
    //                   Container(
    //                     height: 300,
    //                     decoration: const BoxDecoration(
    //                       image: DecorationImage(
    //                         image: AssetImage('images/ppdu_logo.png'),
    //                         fit: BoxFit.fitHeight,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
