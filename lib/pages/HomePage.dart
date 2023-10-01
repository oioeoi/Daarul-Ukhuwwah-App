import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../logic/product_bloc/product_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.background;
    final onBackground = Theme.of(context).colorScheme.onBackground;
    final primary = Theme.of(context).colorScheme.primary;
    final tertiary = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: primary,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Theme(
                data: ThemeData(
                  textTheme: GoogleFonts.pacificoTextTheme().copyWith(
                    displayLarge: TextStyle(
                      color: onBackground,
                    ),
                    displayMedium: TextStyle(
                      color: onBackground,
                    ),
                    bodyLarge: TextStyle(
                      color: onBackground,
                    ),
                    bodyMedium: TextStyle(
                      color: onBackground,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Dubanin",
                    style: GoogleFonts.poppins(
                      color: onBackground,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 18.0,
                    backgroundColor: tertiary,
                    child: Icon(
                      Icons.add,
                      size: 25.0,
                      color: onBackground,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundColor: tertiary,
                  child: Icon(
                    Icons.search,
                    size: 25.0,
                    color: onBackground,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Stack(
                /// Notifikasi
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, right: 8.0),
                    child: CircleAvatar(
                      radius: 18.0,
                      backgroundColor: tertiary,
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 25.0,
                        color: onBackground,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.red,
                      child: Text(
                        "1",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.blue,
        onRefresh: () async {
          BlocProvider.of<ProductBloc>(context).add(
            GetProductEvent(),
          );
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return state is ProductSuccess
                ? Container(
                    child: ListView.separated(
                      itemCount: state.products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = state.products[index];
                        // final int id = data.id;
                        // final String title = data.title.toString();
                        final String desc = data.description.toString();
                        // final int price = data.price;
                        // final double discountPercentage = data.discountPercentage;
                        final double rating = data.rating;
                        // final int stock = data.stock;
                        final String brand = data.brand.toString();
                        final String category = data.category.toString();
                        final String thumbnail = data.thumbnail.toString();
                        final List images = data.images;
                        return Container(
                          color: primary,
                          child: SizedBox(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(19.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              thumbnail,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              brand,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4.0,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  category,
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onBackground,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 3.0, left: 12),
                                                  child: Icon(
                                                    Icons.star,
                                                    size: 12,
                                                  ),
                                                ),
                                                Text(
                                                  rating.toString(),
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onBackground,
                                                    fontSize: 10.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => setState(
                                          () => showModalBottomSheet(
                                            context: context,
                                            builder: (context) => Center(
                                              child: Text(
                                                context.toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.more_horiz,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    desc,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: onBackground,
                                    ),
                                  ),
                                ),
                                CarouselSlider(
                                  carouselController: _carouselController,
                                  options: CarouselOptions(
                                    aspectRatio: 16 / 9,
                                    height: 350,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 1,
                                  ),
                                  items: images.map(
                                    (imageUrl) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
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
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () => setState(
                                                () => showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) => Center(
                                                    child: Text(
                                                      context.toString(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              icon: Icon(
                                                Icons.thumb_up,
                                                size: 20.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(
                                              "10",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.0,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () => setState(
                                                () => showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) => Center(
                                                    child: Text(
                                                      context.toString(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              icon: Icon(
                                                Icons.chat_bubble_outline,
                                                size: 20.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(
                                              "10",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: List.generate(
                                          images.length,
                                          (indexDots) => Container(
                                            height: 8,
                                            width: 8,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () => setState(
                                          () => showModalBottomSheet(
                                            context: context,
                                            builder: (context) => Center(
                                              child: Text(
                                                context.toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.share,
                                          size: 20.0,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15,
                        );
                      },
                    ),
                  )
                : state is ProductLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      )
                    : Center(
                        child: Text('No Data'),
                      );
          },
        ),
      ),
    );
  }
}
