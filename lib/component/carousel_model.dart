import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  CarouselImage({Key? key, required this.listImage}) : super(key: key);

  final List listImage;
  final int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
              height: 350, enableInfiniteScroll: false, viewportFraction: 1),
          items: listImage.map(
            (imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
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
        );
      },
    );
  }
}
