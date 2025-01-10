import 'package:ecommerce/services/auth_store.dart';
import 'package:ecommerce/services/wishlist_store.dart';
import 'package:ecommerce/views/wishlist/card_product_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WishlistPage extends StatefulWidget {
  WishlistPage({super.key});
  String? idUser;

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    super.initState();

    // Tunda eksekusi hingga frame pertama selesai dirender
    WidgetsBinding.instance.addPostFrameCallback((_) {
      runFunction();
    });
  }

  void runFunction() async {
    await getUserId();
    getDataWishlist();
  }

  void getDataWishlist() {
    if (widget.idUser == null) return;

    final wishlistStoreProvider =
        Provider.of<WishlistStore>(context, listen: false);
    wishlistStoreProvider.fetchDataWishlist(idUser: widget.idUser!);
  }

  Future<void> getUserId() async {
    final authStoreProvider =
        Provider.of<AuthStoreProvider>(context, listen: false);
    await authStoreProvider.fecthDataUser();

    if (mounted) {
      setState(() {
        widget.idUser = authStoreProvider.user?.id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Masuk View Wishlist : ${widget.idUser}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 3,
        centerTitle: true,
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Column(
            children: [
              CardProductWishlist(
                brand: 'Test',
                type: 'Test2',
                size: 20,
                price: 20000,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
