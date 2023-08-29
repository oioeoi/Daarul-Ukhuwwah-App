// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final List listImage;
  CarouselImage({
    Key? key,
    required this.listImage,
  }) : super(key: key);

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        listImage;
        return Column(
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                  height: 300,
                  enableInfiniteScroll: false,
                  viewportFraction: 1),
              items: listImage.map(
                (imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                            image: NetworkImage(
                              imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            ),
          ],
        );
      },
    );
  }
}
