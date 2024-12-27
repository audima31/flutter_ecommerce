import 'package:flutter/material.dart';

class CaptionHomePage extends StatelessWidget {
  const CaptionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015,
                fontWeight: FontWeight.normal,
              ),
              children: const [
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
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0001),
        Text(
          'The Ultimate Collection',
          style: TextStyle(
              height: 1.2,
              letterSpacing: MediaQuery.of(context).size.width * 0.007,
              fontSize: MediaQuery.of(context).size.height * 0.065,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ],
    );
  }
}
