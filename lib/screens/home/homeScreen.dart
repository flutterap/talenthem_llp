// ignore_for_file: unnecessary_new

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:talenthem_llp/screens/home/cryptocontainer.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'coin.dart';
import 'cryptocontainer2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Coin>> readJson() async {
    coinList = [];
    final String response = await rootBundle.loadString('temp.json');
    final data = await json.decode(response);
    List<dynamic> values = [];
    values = data;
    if (values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          Map<String, dynamic> map = values[i];
          coinList.add(Coin.fromJson(map));
        }
      }
      setState(() {
        coinList;
      });
    }
    return coinList;
  }
  // Future<List<Coin>> fetchCoin() async {
  //   coinList = [];
  //   final response = await http.get(Uri.parse(
  //       'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h'));
  //   if (response.statusCode == 200) {
  // List<dynamic> values = [];
  // values = json.decode(response.body);
  // if (values.length > 0) {
  //   for (int i = 0; i < values.length; i++) {
  //     if (values[i] != null) {
  //       Map<String, dynamic> map = values[i];
  //       coinList.add(Coin.fromJson(map));
  //     }
  //   }
  //   setState(() {
  //     coinList;
  //   });
  // }
  // return coinList;
  //   } else {
  //     return coinList;
  //     // throw Exception("Failed to load, try again");
  //   }
  // }

  @override
  void initState() {
    // readJson();
    // Timer.periodic(const Duration(seconds: 10), ((timer) => fetchCoin()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Row(children: const [
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              'Hi Alex Smith',
              style: TextStyle(color: Color(0xffa2dbd6), fontSize: 24),
            ),
          ]),
          Row(
            children: const [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                'Good Morning',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 800,
            height: 200,
            // color: Color(0xffbcaafe),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffbcaafe)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Total Wallet Balance',
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text('USD', style: TextStyle(color: Colors.white70)),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white70,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 115),
                    child: Text(
                      "\$" '705874.40',
                      style: TextStyle(color: Colors.white70, fontSize: 35),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 220),
                    child: Text(
                      'Weekly Profit',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text(
                        "\$" '1580.78',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Icon(
                        Icons.arrow_drop_up,
                        color: Colors.white70,
                      ),
                      Text('+15%', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              const Text(
                'Tapri',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                width: 230,
              ),
              TextButton(
                child: const Text(
                  'View all+',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {},
              )
            ],
          ),
          FutureBuilder(
            future: readJson(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  width: double.infinity,
                  height: 180,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Cryptocontainer(
                              change: snapshot.data[index].change.toDouble(),
                              changePercentage: snapshot
                                  .data[index].changePercentage
                                  .toDouble(),
                              index: index,
                              image: snapshot.data[index].image,
                              name: snapshot.data[index].name,
                              price: snapshot.data[index].price.toDouble(),
                              rank: snapshot.data[index].rank.toInt(),
                              symbol: snapshot.data[index].symbol);
                        }),
                  ),
                );
              }
            },
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              const Text(
                'Market',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                width: 220,
              ),
              TextButton(
                child: const Text(
                  'View all+',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(height: 5),
          FutureBuilder(
            future: readJson(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  width: double.infinity,
                  child: Column(
                    children: new List.generate(
                        10,
                        (index) => new Cryptocontainer2(
                            change: snapshot.data[index].change.toDouble(),
                            changePercentage: snapshot
                                .data[index].changePercentage
                                .toDouble(),
                            image: snapshot.data[index].image,
                            name: snapshot.data[index].name,
                            price: snapshot.data[index].price.toDouble(),
                            rank: snapshot.data[index].rank.toInt(),
                            symbol: snapshot.data[index].symbol)),
                  ),
                );
              }
            },
          ),
        ]),
      ),
    );
  }
}
