import 'package:flutter/material.dart';
import 'package:pettikkada/core/constants.dart';

import '../../core/mediaquery.dart';

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
      body: Center(
          child: Column(
        children: [
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
              })
        ],
      )),
    );
  }
}
