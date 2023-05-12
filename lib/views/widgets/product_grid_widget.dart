import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../core/mediaquery.dart';
import 'package:pettikkada/core/constants.dart';

class ProductGridWidget extends StatelessWidget {
  final String image;
  final String title;
  final String discount;
  final String mrp;
  final String amount;
  final double rating;
  const ProductGridWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.discount,
      required this.mrp,
      required this.amount,
      required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      width: getWidth(context) * 0.45,
      alignment: Alignment.center,
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Image.network(
          image,
          fit: BoxFit.fitHeight,
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black38,
                fontSize: 12,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              "$discount% off",
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Itim",
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              mrp,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Itim",
                  decoration: TextDecoration.lineThrough,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "₹$amount",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Itim",
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
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
      ]),
    );
  }
}
