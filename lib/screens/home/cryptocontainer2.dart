import 'package:flutter/material.dart';

class Cryptocontainer2 extends StatelessWidget {
  String name;
  String symbol;
  String image;
  double price;
  double change;
  double changePercentage;
  int rank;

  Cryptocontainer2(
      {required this.change,
      required this.changePercentage,
      required this.image,
      required this.name,
      required this.price,
      required this.rank,
      required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: 450,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white70,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(image),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            name,
                            // overflow: TextOverflow.clip,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Text(
                          price.toString(),
                          style:
                              const TextStyle(color: Colors.red, fontSize: 24),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(symbol.toUpperCase()),
                        const SizedBox(
                          width: 170,
                        ),
                        Text(
                          changePercentage.toDouble() < 0
                              // ignore: prefer_interpolation_to_compose_strings
                              ? '' +
                                  changePercentage.toDouble().toString() +
                                  '%'
                              // ignore: prefer_interpolation_to_compose_strings
                              : '+' +
                                  changePercentage.toDouble().toString() +
                                  '%',
                        )
                      ],
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
