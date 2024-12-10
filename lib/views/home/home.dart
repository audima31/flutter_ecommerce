import 'package:ecommerce/views/home/shoes_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
              children: [
                TextSpan(
                  text: 'okta',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                TextSpan(
                  text: 'S',
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
                TextSpan(
                  text: 'hoes',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                )
              ],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              )),
        ),
        actions: [
          // Icon Search
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Logika untuk pencarian
              print("Search button pressed");
            },
          ),
          // Icon Notifications
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Logika untuk notifikasi
              print("Notifications button pressed");
            },
          ),
          // Popup Menu
          PopupMenuButton<String>(
            onSelected: (value) {
              print("Selected menu: $value");
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem(
                value: 'Settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem(
                value: 'Logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(
              top: screenWidth * 0.05,
              left: screenWidth * 0.06,
              right: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: 'okta',
                  style: TextStyle(color: Colors.black, fontSize: 54),
                ),
                TextSpan(
                  text: 'S',
                  style: TextStyle(color: Colors.orange, fontSize: 54),
                ),
                TextSpan(
                  text: 'hoes',
                  style: TextStyle(color: Colors.black, fontSize: 54),
                ),
                TextSpan(
                    text: '.',
                    style: TextStyle(color: Colors.orange, fontSize: 54))
              ])),
              SizedBox(height: screenWidth * 0.02),
              const Text(
                'Step inside, for comfort and magic await you!',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 18, right: 18),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Shop Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.1),
        Container(
          margin: EdgeInsets.only(
              top: screenWidth * 0.05,
              left: screenWidth * 0.06,
              right: screenWidth * 0.06),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore Model',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Hapus padding bawaan
                    minimumSize: Size.zero, // Pastikan ukuran minimum diatur
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // Kompres area tombol
                  ),
                  child: Text(
                    'Shop now',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                        decoration: TextDecoration.underline),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Expanded(child: ResponsiveProductGrid()),
      ]),
    );
  }
}
