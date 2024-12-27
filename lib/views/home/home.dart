import 'package:ecommerce/views/authentication/login.dart';
import 'package:ecommerce/views/home/box_background.dart';
import 'package:ecommerce/views/home/caption.dart';
import 'package:ecommerce/views/home/card_product.dart';
import 'package:ecommerce/views/home/profile_chart.dart';
import 'package:ecommerce/views/home/shoes_card.dart';
import 'package:ecommerce/views/home/shoes_card2.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/photo/background_home.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 1.0,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.035,
                  ),
                  child: Column(
                    children: [
                      ProfileChartPage(),
                    ],
                  ))),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width * 1.0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              child: CaptionHomePage(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.63,
            width: MediaQuery.of(context).size.width * 1.0,
            child: BoxBackgroundHomePage(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.48,
            width: MediaQuery.of(context).size.width * 1.0,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1),
              child: CardProductHomePage(),
            ),
          ),
        ],
      ),
    );
  }
}
