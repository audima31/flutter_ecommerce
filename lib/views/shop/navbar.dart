import 'package:flutter/material.dart';

class NavbarShop extends StatelessWidget {
  const NavbarShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(83, 255, 153, 0),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ]),
                width: MediaQuery.of(context).size.width * 0.09,
                child: Image.asset('assets/img/sepatu/sepatu.png'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Audima 👋🏻',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      shadows: [
                        Shadow(
                          blurRadius: 32,
                          color: Colors.orange,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Card(
          shadowColor: Colors.orange,
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03,
                vertical: MediaQuery.of(context).size.width * 0.015,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.04,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  const Text('2'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
