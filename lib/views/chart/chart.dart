import 'package:ecommerce/views/chart/amount_cart.dart';
import 'package:ecommerce/views/chart/card_address_user.dart';
import 'package:ecommerce/views/chart/card_product_chart.dart';
import 'package:ecommerce/views/chart/navbar_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<int> selectedDataProduct = [];

  List<Map<String, dynamic>> products = [
    {"id": 1, "name": "Product A", "price": 100},
    {"id": 2, "name": "Product B", "price": 200},
    {"id": 3, "name": "Product C", "price": 300},
    {"id": 4, "name": "Product D", "price": 400},
  ];

  void toggleSelection(int index) {
    setState(() {
      if (selectedDataProduct.contains(index)) {
        selectedDataProduct.remove(index);
      } else {
        selectedDataProduct.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 3,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1.0,
            color: const Color.fromARGB(221, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.605,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: NavbarCart(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          CardProductChart(),
                          CardProductChart(),
                          CardProductChart(),
                          CardProductChart(),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AmountCart(),
          ),
        ],
      ),
    );
  }
}
