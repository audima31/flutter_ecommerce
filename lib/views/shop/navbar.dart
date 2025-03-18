import 'package:ecommerce/services/cart_store.dart';
import 'package:ecommerce/views/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavbarShop extends StatefulWidget {
  const NavbarShop({
    super.key,
    required this.name,
    required this.userId,
  });

  final String name;
  final String userId;

  @override
  State<NavbarShop> createState() => _NavbarShopState();
}

class _NavbarShopState extends State<NavbarShop> {
  @override
  void initState() {
    super.initState();
    getDataCart();
  }

  void getDataCart() {
    final cartStoreProvider =
        Provider.of<CartStoreProvider>(context, listen: false);
    cartStoreProvider.fetchDataCart(idUser: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    print('Masuk View Navbar Shop ${widget.userId}');

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
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(83, 255, 153, 0),
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
                  // name != null
                  //   ? Text(
                  //       'Hi, $name 👋🏻',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black,
                  //         fontSize: MediaQuery.of(context).size.width * 0.05,
                  //         shadows: [
                  //           Shadow(
                  //             blurRadius: 32,
                  //             color: Colors.orange,
                  //             offset: Offset(0, 2),
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  //   : CircularProgressIndicator(),
                  Text(
                    'Hi, ${widget.name} 👋🏻',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      shadows: const [
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChartPage()));
            },
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
                  Consumer<CartStoreProvider>(
                      builder: (context, provider, child) {
                    return Text('${provider.cart.length}');
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
