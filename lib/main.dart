import 'package:ecommerce/services/auth_store.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:ecommerce/services/cart_service.dart';
import 'package:ecommerce/services/cart_store.dart';
import 'package:ecommerce/services/firebase_service.dart';
import 'package:ecommerce/services/product_store.dart';
import 'package:ecommerce/views/home/home.dart';
import 'package:ecommerce/views/profile/profile.dart';
import 'package:ecommerce/views/shop/shop.dart';
import 'package:ecommerce/views/wishlist/wishlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  //Untuk Inisialisasi Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              ProductStoreProvider(ProductFirebaseRealtimaDatabaseService()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              AuthStoreProvider(AuthenticationFirebaseService()),
        ),
        ChangeNotifierProvider(
          create: (context) => CartStoreProvider(CartFirebaseService()),
        ),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectPage = 0;

  final List<Widget> _pages = [
    const Home(),
    ShopPage(),
    const WishlistPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _pages[_selectPage],
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 46, 47, 48),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Navigasi ke halaman Home
                    _buildNavItemEdit(Icons.home, 'Home', 0),
                    _buildNavItemEdit(Icons.search, 'Shop', 1),
                    _buildNavItemEdit(Icons.favorite, 'Wishlist', 2),
                    _buildNavItemEdit(Icons.person, 'Chart', 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget dibawah untuk memberikan effect setiap Nav Item, seperti ketika tab ditekan
  Widget _buildNavItemEdit(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.01,
              horizontal: MediaQuery.of(context).size.height * 0.01,
            ),
            decoration: BoxDecoration(
              color: _selectPage == index ? Colors.orange : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              icon,
              color: _selectPage == index ? Colors.black : Colors.grey,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
