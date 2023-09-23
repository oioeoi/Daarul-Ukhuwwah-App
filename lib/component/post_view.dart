import 'package:daarul_ukhuwwah_media/component/carousel_model.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PostView extends StatelessWidget {
  PostView({Key? key, required this.images, this.title = '', this.desc = ''})
      : super(key: key);

  final List images;
  final String? title, desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselImage(listImage: images),
          Padding(
            padding: const EdgeInsets.only(
                left: 14.0, right: 14, top: 8, bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Ionicons.heart_outline,
                          size: 26,
                        ),
                        SizedBox(width: 14),
                        Icon(Ionicons.chatbubble_outline),
                        SizedBox(width: 14),
                        Icon(Ionicons.send_outline),
                      ],
                    ),
                    Icon(Ionicons.bookmark_outline),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  title ?? 'kok kosong',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: desc,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
