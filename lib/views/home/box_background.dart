import 'package:flutter/material.dart';

class BoxBackgroundHomePage extends StatelessWidget {
  const BoxBackgroundHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 5.0,
      decoration: BoxDecoration(
        color: const Color(0xfffdfdfd).withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
