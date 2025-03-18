import 'package:ecommerce/views/authentication/contenSlidingPanelLoginPage.dart';
import 'package:ecommerce/views/authentication/contenSlidingPanelSignUpPage.dart';
import 'package:ecommerce/views/authentication/contentLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variabel untuk menyimpan posisi panel, dipake agar konten di sliding up panel tidak muncul sebelom di swipe up
  double _posisiPanel = 0.0;
  double _opacity = 0.0;

  bool signUp = false;

  Color _backgroundColorPanel = const Color.fromARGB(159, 255, 154, 3);
  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        color: _backgroundColorPanel,
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 30,
          )
        ],
        borderRadius: radius,
        collapsed: _headerKetikaSlidingUpTutup(),
        minHeight: 60,
        maxHeight: 500,
        panel: signUp
            ? ContentSlidingPanelSignUpPage(
                posisiPanel: _posisiPanel,
                onSignInPressed: _onSignInPressed,
              )
            : ContentSlidingPanelLoginPage(
                posisiPanel: _posisiPanel,
                onSignUpPressed: _onSignUpPressed,
              ),
        body: KontenLogin(opacity: _opacity),
        onPanelSlide: (position) {
          setState(() {
            _posisiPanel = position;
            // Update posisi panel
            if (_posisiPanel > 0.4) {
              _backgroundColorPanel = Colors.white;
              _opacity = 0.6;
              _posisiPanel = 0.5;
            } else {
              _backgroundColorPanel = const Color.fromARGB(159, 255, 154, 3);
              _opacity = 0.0;
              _posisiPanel = 0.0;
            }
          });
        },
      ),
    );
  }

//-------------------------------------------------------
  Widget _headerKetikaSlidingUpTutup() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: const Text(
              'Swipe up to login',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(214, 255, 255, 255),
              ),
            ),
          ),
          Container(
            width: 65,
            height: 4,
            decoration: BoxDecoration(
              color: const Color.fromARGB(214, 255, 255, 255),
              borderRadius: BorderRadius.circular(200),
            ),
          )
        ],
      ),
    );
  }

  void _onSignUpPressed() {
    setState(() {
      signUp = true;
    });
  }

  void _onSignInPressed() {
    setState(() {
      signUp = false;
    });
  }
}
