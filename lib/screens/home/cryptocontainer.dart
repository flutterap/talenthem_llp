import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cryptocontainer extends StatelessWidget {
  String name;
  String symbol;
  String image;
  double price;
  double change;
  double changePercentage;
  int rank;
  int index;

  // ignore: use_key_in_widget_constructors
  Cryptocontainer(
      {required this.change,
      required this.changePercentage,
      required this.image,
      required this.name,
      required this.price,
      required this.rank,
      required this.index,
      required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 20, top: 4, bottom: 4, left: index == 0 ? 4 : 0),
      child: Container(
        width: 250,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white70,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.white70,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.network(image),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 80,
                      child: Text(
                        name,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: changePercentage.toDouble() < 0
                            ? Colors.red
                            : Colors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                            changePercentage.toDouble() < 0
                                // ignore: prefer_interpolation_to_compose_strings
                                ? '' + changePercentage.toStringAsFixed(2) + '%'
                                // ignore: prefer_interpolation_to_compose_strings
                                : '+' +
                                    changePercentage.toStringAsFixed(2) +
                                    '%',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "\$$price",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    symbol.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
