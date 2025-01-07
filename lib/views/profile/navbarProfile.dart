import 'package:flutter/material.dart';

class NavbarProfile extends StatelessWidget {
  const NavbarProfile({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    print('Nama Navbar Profile: $name');
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
                    'Hi, $name 👋🏻',
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
      ],
    );
  }
}
