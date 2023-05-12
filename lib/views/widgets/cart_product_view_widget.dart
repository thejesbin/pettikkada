import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core/constants.dart';
import '../../core/mediaquery.dart';

class CartProductViewWidget extends StatelessWidget {
  final String title;
  final String image;
  final String amount;
  final double rating;
  final ValueNotifier<int> quantity;
  const CartProductViewWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.amount,
      required this.rating,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: getWidth(context) * 0.95,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(
                image,
                height: 150,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "Itim",
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text(
                    "₹$amount",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Itim",
                        overflow: TextOverflow.ellipsis),
                  ),
                  RatingBar.builder(
                      itemSize: 15,
                      itemBuilder: (context, i) => const Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                      initialRating: rating,
                      allowHalfRating: true,
                      itemCount: 5,
                      onRatingUpdate: (rating) {})
                ],
              )
            ],
          ),
        ),
        const Spacer(),
        ValueListenableBuilder(
            valueListenable: quantity,
            builder: (context, val, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //decrement or delete button
                  InkWell(
                    onTap: () => decrementQuantity(),
                    child: Container(
                      height: 30,
                      width: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: quantity.value == 1
                          ? const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                    ),
                  ),
                  //quantity counter
                  Container(
                      height: 30,
                      width: 60,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        val.toString(),
                        style: const TextStyle(
                          fontFamily: "Itim",
                          fontSize: 16,
                        ),
                      )),
                  //increment button
                  InkWell(
                    onTap: () => incrementQuantity(),
                    child: Container(
                      height: 30,
                      width: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }

  decrementQuantity() =>
      quantity.value == 1 ? print("Product deletion") : quantity.value--;

  incrementQuantity() => quantity.value++;
}
