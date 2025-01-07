import 'package:ecommerce/services/auth_store.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:ecommerce/services/product_store.dart';
import 'package:ecommerce/views/detailProduct/detailProduct.dart';
import 'package:ecommerce/views/home/profile_chart.dart';
import 'package:ecommerce/views/home/shoes_card.dart';
import 'package:ecommerce/views/shop/navbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ShopPage extends StatefulWidget {
  ShopPage({super.key});
  String? idUser;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

String formatRupiah(int amount) {
  return NumberFormat('#,###', 'id_ID').format(amount).replaceAll(',', '.');
}

class _ShopPageState extends State<ShopPage> {
  final PageController _pageIklanController = PageController();

  @override
  void initState() {
    super.initState();
    // Memanggil fungsi fetchDataProduct untuk mengambil data produk saat halaman pertama kali dimuat
    final productStoreProvider =
        Provider.of<ProductStoreProvider>(context, listen: false);
    productStoreProvider.fetchDataProduct();

    // Memastikan idUser diambil setelah data user tersedia
    fetchUserId();
  }

  Future<void> fetchUserId() async {
    final authStoreProvider =
        Provider.of<AuthStoreProvider>(context, listen: false);
    await authStoreProvider
        .fecthDataUser(); // Tunggu hingga data selesai diambil

    setState(() {
      widget.idUser = authStoreProvider.user?.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Masuk View Shop : ${widget.idUser}');
    return Scaffold(
      backgroundColor: const Color.fromARGB(76, 230, 228, 225),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.035,
                right: MediaQuery.of(context).size.width * 0.035,
                top: MediaQuery.of(context).size.height * 0.07,
              ),
              child: Consumer<AuthStoreProvider>(
                builder: (context, authStoreProvider, child) {
                  if (authStoreProvider.user == null) {
                    debugPrint('User is null, cannot fetch cart data.');
                    return const NavbarShop(
                      name: 'Loading ...', // Nilai default jika user null
                    );
                  }
                  final nameUser = authStoreProvider.user!.name.split(' ')[0];
                  return NavbarShop(
                    name: nameUser,
                  );
                },
              ),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: MediaQuery.of(context).size.width * 0.02,
            //   ),
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width * 1,
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     child: PageView.builder(
            //       controller: _pageIklanController,
            //       itemCount: iklanImages.length,
            //       itemBuilder: (context, index) {
            //         return Image.asset(
            //           iklanImages[index],
            //           width: MediaQuery.of(context).size.width * 1,
            //           fit: BoxFit.cover,
            //         );
            //       },
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.01,
            // ),
            // Center(
            //   child: SmoothPageIndicator(
            //     controller: _pageIklanController,
            //     count: iklanImages.length,
            //     effect: ExpandingDotsEffect(
            //       dotColor: const Color.fromARGB(180, 46, 47, 48),
            //       activeDotColor: Colors.orange,
            //       dotHeight: MediaQuery.of(context).size.height * 0.01,
            //       dotWidth: MediaQuery.of(context).size.width * 0.02,
            //       expansionFactor: 3,
            //     ),
            //   ),
            // )

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.98,
              height: MediaQuery.of(context).size.height * 0.09,
              child: Image.asset(
                'assets/img/photo/container_dua.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  children: List.generate(5, (index) {
                    return Text('test');
                  }),
                )),

//Menampilkan data dari Provider -------------------------------------------------------------
            Consumer<ProductStoreProvider>(
                builder: (context, productStoreProvider, child) {
              //Menunggu data product selesai diambil
              if (productStoreProvider.isLoading) {
                return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.2),
                  child: const CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: productStoreProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productStoreProvider.products[index];
                    print('Index : $index');
                    return Stack(
                      children: [
                        Card(
                          elevation: 4,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailProduct(
                                          index: index,
                                          idUser: widget.idUser ?? '',
                                        )),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    '${product.image[0]}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.brand ?? 'Unknown Brand',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                              color: Colors.black
                                                  .withOpacity(0.35)),
                                        ),
                                        Text(
                                          product.type ?? 'Unknown Type',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005),
                                        Text(
                                          'Rp. ${formatRupiah(product.price)}',
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.015),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              size: MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }),

            SizedBox(height: MediaQuery.of(context).size.height * 0.13),
          ],
        ),
      ),
    );
  }
}
