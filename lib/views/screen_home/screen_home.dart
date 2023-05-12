import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pettikkada/core/constants.dart';

import '../../core/mediaquery.dart';
import '../widgets/product_grid_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedIndex = ValueNotifier(0);
    var categories = [
      "All Categories",
      "Mobiles",
      "Electronics",
      "TVs",
      "Toys",
      "Home"
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          appName,
          style: TextStyle(fontFamily: "Itim"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            //categories
            ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context, val, child) {
                  return Container(
                    width: getWidth(context),
                    height: 50,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () => selectedIndex.value = i,
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    categories[i],
                                    style: TextStyle(
                                      fontFamily: "Itim",
                                      fontSize:
                                          selectedIndex.value == i ? 15 : 12,
                                      color: selectedIndex.value == i
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                  selectedIndex.value == i
                                      ? Container(
                                          width: 50,
                                          height: 2,
                                          color: Colors.white,
                                        )
                                      : const SizedBox(
                                          height: 2,
                                        )
                                ]),
                          ),
                        );
                      },
                      itemCount: categories.length,
                    ),
                  );
                }),

            //banner carousel
            SizedBox(
              width: double.infinity,
              height: 180,
              child: CarouselSlider.builder(
                itemCount: 3,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  return InkWell(
                    onTap: () async {},
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(bannerImage.toString()),
                              fit: BoxFit.cover)),
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1.0,
                  autoPlayInterval: const Duration(seconds: 5),
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //hot deals section
            SizedBox(
              height: 500,
              width: getWidth(context),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Hot Deals🔥",
                        style: TextStyle(
                          fontFamily: "Itim",
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "View more",
                            style: TextStyle(
                              fontFamily: "Itim",
                              fontSize: 15,
                              color: primaryColor,
                            ),
                          ))
                    ],
                  ),
                  Expanded(
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      getWidth(context) * 0.45 / 200),
                          itemBuilder: (context, i) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ProductGridWidget(
                                  image: watchImage,
                                  title: "Noise Evolve 3 Blutooth Smart Watch",
                                  discount: "57",
                                  mrp: "9999",
                                  amount: "2499",
                                  rating: 4.5),
                            );
                          }))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
