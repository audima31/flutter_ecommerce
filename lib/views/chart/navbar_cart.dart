import 'package:flutter/material.dart';

class NavbarCart extends StatelessWidget {
  const NavbarCart({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(83, 255, 153, 0),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.09,
                  child: Image.asset(
                    'assets/img/sepatu/sepatu.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Ship to : ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                          children: [
                            TextSpan(
                              text: name ?? 'Loading...',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    'Jakarta Selatan, DKI Jakarta',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: MediaQuery.of(context).size.width * 0.05,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
