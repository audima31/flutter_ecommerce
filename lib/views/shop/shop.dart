import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/list_wishlist.dart';
import 'package:ecommerce/models/wishlist.dart';
import 'package:ecommerce/services/auth_store.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:ecommerce/services/product_store.dart';
import 'package:ecommerce/services/wishlist_store.dart';
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
  bool isFavorite = false;

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
    // Initialize ProductStoreProvider
    final productStoreProvider =
        Provider.of<ProductStoreProvider>(context, listen: false);
    productStoreProvider.fetchDataProduct();

    // Fetch User ID after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      runFunction();
    });
  }

  void runFunction() async {
    await fetchUserId();
    await fetchDataWishlist();
    await fetchDataListWishlist();
  }

  Future<void> fetchUserId() async {
    print('Masuk fetchUserId Func');
    final authStoreProvider =
        Provider.of<AuthStoreProvider>(context, listen: false);
    await authStoreProvider.fecthDataUser();

    // Safely update state after ensuring the widget has been built
    if (mounted) {
      setState(() {
        widget.idUser = authStoreProvider.user?.id;
      });
    }
  }

  Future<void> fetchDataWishlist() async {
    print('Masuk fetchDataWishlist Func');
    final wishlistStoreProvider =
        Provider.of<WishlistStore>(context, listen: false);
    await wishlistStoreProvider.fetchDataWishlist(idUser: widget.idUser!);
  }

  Future<void> fetchDataListWishlist() async {
    print('Masuk ListWishlist Func');
    final listWishlistStoreProvider =
        Provider.of<WishlistStore>(context, listen: false);
    await listWishlistStoreProvider.fetchListDataWishlist(
        idUser: widget.idUser!);
  }

  void addToWishlist(
      WishlistModel data, String productBrancd, String productType) {
    if (widget.idUser == null) {
      debugPrint('User not logged in, cannot add to wishlist.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please log in to add items to your wishlist.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    final wishlistStoreProvider =
        Provider.of<WishlistStore>(context, listen: false);
    wishlistStoreProvider.addDataWishlist(wishlist: data.toMap());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$productBrancd $productType has been added to your wishlist!',
          style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void deleteDataWishlist(
      String idWishlist, String productBrancd, String productType) async {
    final wishlistStoreProvider =
        Provider.of<WishlistStore>(context, listen: false);
    wishlistStoreProvider.deleteDataWishlist(idWishlist: idWishlist);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$productBrancd $productType has been removed from your wishlist!',
          style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistStore>(context, listen: false);

    final listWishlistProvider =
        Provider.of<WishlistStore>(context, listen: false);

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
                      userId: '',
                    );
                  }
                  final nameUser = authStoreProvider.user!.name.split(' ')[0];
                  return NavbarShop(
                    name: nameUser,
                    userId: authStoreProvider.user!.id,
                  );
                },
              ),
            ),

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
                    return const Text('test');
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
                                    product.image[0],
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
                              onPressed: () {
                                final data = WishlistModel(
                                  idWishlist:
                                      "${DateTime.now().microsecondsSinceEpoch}-${widget.idUser}",
                                  idUser: widget.idUser!,
                                  idProduct: product.id,
                                  image: product.image,
                                  color: product.color,
                                  gender: product.gender,
                                  jumlahBarang: 1,
                                  price: product.price,
                                  caption: product.caption,
                                  priceAwal: product.price,
                                  type: product.type,
                                  brand: product.brand,
                                  size: 0,
                                );

                                print(
                                    'Testtt ----------- ${wishlistProvider.wishlist.where((wishlist) => wishlist.idUser == widget.idUser).isNotEmpty}');
                                // Tambahkan ke wishlist
                                if (wishlistProvider.wishlist.isEmpty) {
                                  addToWishlist(
                                    data,
                                    product.brand,
                                    product.type,
                                  );
                                } else if
                                    //Ngecek ada data wishlist atau engga
                                    (wishlistProvider.wishlist.isNotEmpty) {
                                  //ngecek data yang ada di wishlist, sudah sesuai dengan idUser belom
                                  print(
                                      'Masuk 1 ngecek data yang ada di wishlist ${wishlistProvider.wishlist.isNotEmpty}');
                                  if (wishlistProvider.wishlist
                                      .where((wishlist) =>
                                          wishlist.idUser == widget.idUser)
                                      .isNotEmpty) {
                                    //ngecek data yang ada di wishlist, sudah sesuai dengan idProduct belom
                                    print(
                                        'Masuk 2 ngecek data yang ada di wishlist ${wishlistProvider.wishlist.where((wishlist) => wishlist.idUser == widget.idUser).isNotEmpty}');

                                    if (wishlistProvider.wishlist
                                        .where((wishlist) =>
                                            wishlist.idProduct == product.id)
                                        .isEmpty) {
                                      print(
                                          'Masuk 3 ${wishlistProvider.wishlist.where((wishlist) => wishlist.idProduct == product.id).isEmpty}');

                                      print(
                                          'Masuk 4 ${wishlistProvider.wishlist.length} - ${wishlistProvider.listWishlist.length}');

                                      //Ngecek data wishlist dan list wishlist, sudah sesuai dengan idProduct belom
                                      bool hasMatchingIds = wishlistProvider
                                          .wishlist
                                          .any((wishlist) => wishlistProvider
                                              .listWishlist
                                              .any((listWishlist) =>
                                                  wishlist.idWishlist ==
                                                  listWishlist.idListWishlist));

                                      if (hasMatchingIds) {
                                        print('Masuk 5 $hasMatchingIds');
                                        addToWishlist(
                                          data,
                                          product.brand,
                                          product.type,
                                        );
                                      } else {
                                        deleteDataWishlist(
                                          wishlistProvider.listWishlist[index]
                                              .idListWishlist,
                                          product.brand,
                                          product.type,
                                        );
                                      }
                                    } else {
                                      deleteDataWishlist(
                                        wishlistProvider
                                            .listWishlist[index].idListWishlist,
                                        product.brand,
                                        product.type,
                                      );
                                    }
                                  } else {
                                    deleteDataWishlist(
                                      wishlistProvider
                                          .listWishlist[index].idListWishlist,
                                      product.brand,
                                      product.type,
                                    );
                                  }
                                }
                              },
                              icon: wishlistProvider.wishlist.isEmpty
                                  ? const Icon(
                                      Icons.favorite_border,
                                    )
                                  //Batasan if else cek  wishlist
                                  : wishlistProvider.wishlist.isNotEmpty
                                      ? wishlistProvider.wishlist
                                              .where((wishlist) =>
                                                  wishlist.idProduct ==
                                                  product.id)
                                              .isNotEmpty
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                          : const Icon(
                                              Icons.favorite_border,
                                            )
                                      : const Icon(
                                          Icons.favorite,
                                        )),
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
