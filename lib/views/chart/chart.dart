import 'package:ecommerce/services/auth_store.dart';
import 'package:ecommerce/services/cart_store.dart';
import 'package:ecommerce/views/chart/amount_cart.dart';
import 'package:ecommerce/views/chart/card_product_chart.dart';
import 'package:ecommerce/views/chart/navbar_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<int> selectedDataProduct = [];
  String? name;

  @override
  void initState() {
    super.initState();
    cekDataCart();
  }

  void cekDataCart() {
    final authStoreProvider =
        Provider.of<AuthStoreProvider>(context, listen: false);
    authStoreProvider.fecthDataUser();

    if (authStoreProvider.user == null) {
      debugPrint('User is null, cannot fetch cart data.');
      return; // Keluar dari fungsi jika user masih null
    }

    setState(() {
      name = authStoreProvider.user!.name;
    });

    final idUser = authStoreProvider.user!.id;

    debugPrint('Masuk View ${authStoreProvider.user!.id}');

    final cartStoreProvider =
        Provider.of<CartStoreProvider>(context, listen: false);
    cartStoreProvider.fetchDataCart(idUser: idUser.toString());

    debugPrint('Masuk View ${cartStoreProvider.cart.length.toString()}');
  }

  void toggleSelection(int index) {
    setState(() {
      if (selectedDataProduct.contains(index)) {
        selectedDataProduct.remove(index);
      } else {
        selectedDataProduct.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 3,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1.0,
            color: const Color.fromARGB(221, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.605,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Consumer<AuthStoreProvider>(
                              builder: (context, authStoreProvider, child) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: authStoreProvider.isLoading == false
                                  ? NavbarCart(
                                      name: name!,
                                    )
                                  : const NavbarCart(
                                      name: 'Loading ...',
                                    ),
                            );
                          }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Consumer<CartStoreProvider>(
                              builder: (context, cartStoreProvider, child) {
                            if (cartStoreProvider.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (cartStoreProvider.cart.isEmpty) {
                              return const Text('Kosong');
                            }
                            print(
                                'Masuk Cart ${cartStoreProvider.cart.length}');
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartStoreProvider.cart.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  background: Container(
                                    padding: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    color:
                                        const Color.fromARGB(255, 251, 93, 82),
                                    alignment: Alignment.centerRight,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  key: ValueKey(
                                      cartStoreProvider.cart[index].idCart),
                                  direction: DismissDirection
                                      .endToStart, // Hanya memungkinkan swipe ke kiri
                                  confirmDismiss: (direction) async {
                                    // Tampilkan Dialog Konfirmasi sebelum menghapus
                                    bool? confirmDelete = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            "Konfirmasi Hapus",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: Text(
                                            'Apakah Anda yakin ingin menghapus produk ${cartStoreProvider.cart[index].brand} ${cartStoreProvider.cart[index].type}?',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(
                                                    false); // Batalkan penghapusan
                                              },
                                              child: const Text('Tidak'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(
                                                    true); // Lanjutkan penghapusan
                                              },
                                              child: const Text('Ya'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    return confirmDelete ?? false;
                                  },
                                  onDismissed: (direction) {
                                    // Hapus produk dari keranjang
                                    Provider.of<CartStoreProvider>(context,
                                            listen: false)
                                        .deleteDataCart(
                                            idCart: cartStoreProvider
                                                .cart[index].idCart);

                                    // Tampilkan SnackBar yang memberi tahu bahwa produk akan dihapus
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${cartStoreProvider.cart[index].brand} ${cartStoreProvider.cart[index].type} berhasil dihapus!',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        backgroundColor: Colors.green,
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  child: CardProductChart(
                                    functionButtonKlik: () =>
                                        toggleSelection(index),
                                    productData: cartStoreProvider.cart[index],
                                  ),
                                );
                              },
                            );
                          }),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AmountCart(),
          ),
        ],
      ),
    );
  }
}
