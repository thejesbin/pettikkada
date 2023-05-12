import 'package:flutter/material.dart';
import 'package:pettikkada/core/mediaquery.dart';
import '../../core/constants.dart';
import '../widgets/cart_product_view_widget.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: primaryColor.withOpacity(0.3),
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          title: const Text(
            "Cart",
            style: TextStyle(fontFamily: "Itim"),
          ),
        ),
        body: Center(
          child: Column(children: [
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CartProductViewWidget(
                              title: "Iphone 14 Pro\n 64/128 GB",
                              image: phoneImage,
                              amount: "1,14000",
                              rating: 4,
                              quantity: ValueNotifier(1)),
                        ),
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 10),
                    itemCount: 5))
          ]),
        ),
        bottomNavigationBar: Container(
          height: 100,
          width: getWidth(context),
          color: primaryColor.withOpacity(0.6),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Total",
                  style: TextStyle(
                    fontFamily: "Itim",
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "₹3,86000",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Itim",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                width: getWidth(context),
                color: primaryColor,
                alignment: Alignment.center,
                child: const Text(
                  "Proceed T0 Buy",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Itim",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
