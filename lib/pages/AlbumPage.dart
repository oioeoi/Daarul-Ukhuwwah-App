import 'package:daarul_ukhuwwah_media/model/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/fetch_dataTest.dart';
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
    final result = await ProductServicesTest().fetchData();
    users.addAll(result);

    if (mounted == true) {
      setState(
        () {
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
        : Builder(builder: (context) {
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

                // Container(
                //   height: 100.0,
                //   clipBehavior: Clip.antiAlias,
                //   margin: EdgeInsets.only(
                //     bottom: 12.0,
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(
                //         8.0,
                //       ),
                //     ),
                //     image: DecorationImage(
                //       image: NetworkImage(
                //         images,
                //       ),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                //   child: Stack(
                //     children: [
                //       Container(
                //         decoration: BoxDecoration(
                //           color: Colors.black.withOpacity(0.6),
                //         ),
                //       ),
                //       Center(
                //         child: Text(
                //           '$title',
                //           style: TextStyle(
                //               fontSize: 20.0,
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              },
            );
          });
    // LayoutBuilder(
    //   builder: (context, constraint) {
    //     var spacing = 2.0;
    //     var rowCount = 3;
    //     return Center(child: Text(result.toString()));
    // SafeArea(
    //   child: Wrap(
    //     runSpacing: spacing,
    //     spacing: spacing,
    //     children: List.generate(
    //       result.length,
    //       (index) {
    //         // var item = products[index];
    //         var size = (constraint.biggest.width - (rowCount * spacing)) /
    //             rowCount;
    //         return InkWell(
    //           onTap: () {},
    //           // onTap: () => item["onTap"](),
    //           child: Container(
    //             height: size,
    //             width: size,
    //             decoration: BoxDecoration(
    //               color: Colors.blue[100],
    //               // image: DecorationImage(
    //               //   image: NetworkImage(
    //               //     products[index]['images'].toString(),
    //               //   ),
    //               //   fit: BoxFit.fill,
    //               // ),
    //               borderRadius: const BorderRadius.all(
    //                 Radius.circular(
    //                   0.0,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}



 // int id = result['id'];
      // String title = result['title'];
      // String description = result['description'];
      // int price = result['price'];
      // double discountPercentage = result['discountPercentage'];
      // dynamic rating = result['rating'];
      // int stock = result['stock'];
      // String brand = result['brand'];
      // String category = result['category'];
      // String thumbnail = result['thumbnail'];
      // List<String> images = List<String>.from(result['images']);