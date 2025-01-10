import 'package:ecommerce/services/auth_store.dart';
import 'package:ecommerce/services/cart_store.dart';
import 'package:ecommerce/services/product_store.dart';
import 'package:ecommerce/views/home/box_background.dart';
import 'package:ecommerce/views/home/caption.dart';
import 'package:ecommerce/views/home/card_product.dart';
import 'package:ecommerce/views/home/profile_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<void> _fetchDataFuture;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = _initializeData();
  }

  Future<void> _initializeData() async {
    await _getDataCart();
    await _getLimaDataProduct();
  }

  Future<void> _getDataCart() async {
    try {
      print('Masuk Function _getDataCart');

      final authStoreProvider =
          Provider.of<AuthStoreProvider>(context, listen: false);
      await authStoreProvider.fecthDataUser();

      final user = authStoreProvider.user;
      if (user != null) {
        final idUser = user.id;
        final cartStoreProvider =
            Provider.of<CartStoreProvider>(context, listen: false);
        await cartStoreProvider.fetchDataCart(idUser: idUser);
      } else {
        debugPrint("User is null, cannot fetch data cart");
      }
    } catch (e) {
      debugPrint("Error in getDataCart: $e");
    }
  }

  Future<void> _getLimaDataProduct() async {
    try {
      print('Masuk Function getLimaProduct');
      final productStoreProvider =
          Provider.of<ProductStoreProvider>(context, listen: false);
      await productStoreProvider.fetchLimaDataProduct();
      print(
          'Masuk Function getLimaProduct ${productStoreProvider.firstProduct}');
    } catch (e) {
      debugPrint('Error in get Product: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _fetchDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        }
        return _buildHomeContent();
      },
    );
  }

  Widget _buildHomeContent() {
    // Memastikan AuthStoreProvider sudah ada di tree
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/photo/background_home.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Profile Chart
          Positioned(
            top: MediaQuery.of(context).size.height * 0.07,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.035,
              ),
              child: Column(
                children: [
                  Consumer<CartStoreProvider>(
                      builder: (context, cartStoreProvider, child) {
                    var cart = cartStoreProvider.cart;
                    if (cartStoreProvider.isLoading == true) {
                      return ProfileChartPage(
                          name: '${'Loading ...'}',
                          jumlahKeranjang: cart.length.toString());
                    } else {
                      return ProfileChartPage(
                          name: '${'ss'}',
                          jumlahKeranjang: cart.length.toString());
                    }
                  }),
                ],
              ),
            ),
          ),
          // Caption
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              child: const CaptionHomePage(),
            ),
          ),
          // Box Background
          Positioned(
            top: MediaQuery.of(context).size.height * 0.63,
            left: 0,
            right: 0,
            child: const BoxBackgroundHomePage(),
          ),
          // Card Product
          Positioned(
            top: MediaQuery.of(context).size.height * 0.48,
            width: MediaQuery.of(context).size.width * 1.0,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1),
              child: Consumer<ProductStoreProvider>(
                  builder: (context, productStoreProvider, child) {
                final product = productStoreProvider.firstProduct;
                print('Masuk View 2 : ${product}');
                return Consumer<AuthStoreProvider>(
                    builder: (context, authStoreProvider, child) {
                  final idUser = authStoreProvider.user?.id;
                  return CardProductHomePage(
                    cart: product,
                    idUser: idUser.toString(),
                  );
                });
              }),
            ),
          ),
        ],
      ),
    );
  }
}
