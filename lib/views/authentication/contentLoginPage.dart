import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class KontenLogin extends StatelessWidget {
  const KontenLogin({super.key, required this.opacity});

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 64, 64, 64),
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // Efek blur pada latar belakang
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
          child: Container(
            color: Colors.black.withOpacity(0.4), // Warna semi-transparan
          ),
        ),

        // Konten utama
        Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.15),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'okta',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'S',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        TextSpan(
                          text: 'hoes',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                      height: constraints.maxHeight * 0.06), // Spasi responsif
                  Image.asset(
                    'assets/img/photo/LoginPage.png',
                    width: constraints.maxWidth *
                        0.8, // Responsif terhadap lebar layar
                    fit: BoxFit.contain, // Menjaga aspek rasio
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  const Text(
                    'Comfort in Every Steps!',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.orange,
                            offset: Offset(1, 4),
                            blurRadius: 35,
                          ),
                        ]),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: const Text(
                      'Shop anytime, anywhere! Your perfect shoes are just a tap away. Comfort guaranteed!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        //Ngatur warna opacity pada page
        Positioned(
          top: 0, // Posisi di atas
          left: 0, // Posisi kiri
          right: 0, // Posisi kanan
          child: Opacity(
            opacity: opacity,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  1.0, // Tinggi kotak merah
              color: const Color.fromARGB(255, 0, 0, 0), // Warna kotak merah
            ),
          ),
        ),
      ],
    );
  }
}
