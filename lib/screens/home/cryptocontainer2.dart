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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(image),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 280,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                color: Color(0xff62d3da),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$$price",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 280,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            symbol.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
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
                            style: TextStyle(
                                color: changePercentage < 0
                                    ? Colors.red
                                    : Colors.green,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
