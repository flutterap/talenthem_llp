// import 'dart:async';

// import 'buttonwidget.dart';
// import 'coincard.dart';
// import 'package:flutter/material.dart';
// import 'total_balance.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'coin.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: <Widget>[
//             const SliverToBoxAdapter(
//               child: TotalBalance(),
//             ),
//             SliverToBoxAdapter(
//                 child: SizedBox(
//               height: 75,
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ButtonWidget(active: true, onTap: () {}, text: 'Deposit'),
//                   ButtonWidget(active: false, onTap: () {}, text: 'Withdraw'),
//                   ButtonWidget(active: false, onTap: () {}, text: 'Wallet'),
//                 ],
//               ),
//             )),
//             SliverToBoxAdapter(
//               child: SizedBox(
                // width: double.infinity,
                // height: MediaQuery.of(context).size.height / 1.3,
//                 child: ListView.builder(
//                     itemCount: coinList.length,
//                     itemBuilder: (context, index) {
//                       return SingleChildScrollView(
//                         child: CoinCard(
                            // change: coinList[index].change.toDouble(),
                            // changePercentage:
                            //     coinList[index].changePercentage.toDouble(),
                            // image: coinList[index].image,
                            // name: coinList[index].name,
                            // price: coinList[index].price.toDouble(),
                            // rank: coinList[index].rank.toInt(),
                            // symbol: coinList[index].symbol),
//                       );
//                     }),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
