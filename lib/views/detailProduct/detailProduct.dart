import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/services/cart_store.dart';
import 'package:ecommerce/services/product_store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class DetailProduct extends StatefulWidget {
  DetailProduct({super.key, required this.index, required this.idUser});

  final int index;
  final String idUser;
  int? _selectedSize; // Ukuran yang dipilih

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  void initState() {
    super.initState();
    final idProduct = widget.index;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductStoreProvider>(context, listen: false)
          .fetchDetailDataProduct(idProduct: idProduct);
    });
  }

  final PageController _pageSepatuController = PageController();

  String formatRupiah(int amount) {
    return NumberFormat('#,###', 'id_ID').format(amount).replaceAll(',', '.');
  }

  void handleAddToCart() {
    final idProduct = widget.index;
    final selectSized = widget._selectedSize;
    final detailProductStore =
        Provider.of<ProductStoreProvider>(context, listen: false);
    detailProductStore.fetchDetailDataProduct(idProduct: idProduct);
    final product = detailProductStore.selectedProduct;

    if (selectSized == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size before adding to cart!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
      return; // Keluar dari fungsi jika ukuran tidak dipilih
    }

    final data = CartModels(
      idCart:
          "${DateTime.now().microsecondsSinceEpoch}-${widget.idUser}", // Kosong karena Firebase akan membuat ID otomatis
      idUser: widget.idUser,
      image: product!.image,
      color: product.color,
      gender: product.gender,
      jumlahBarang: 1,
      price: product.price,
      caption: product.caption,
      idProduct: idProduct,
      priceAwal: product.price,
      type: product.type,
      brand: product.brand,
      size: selectSized,
    ).toMap();

    Provider.of<CartStoreProvider>(context, listen: false)
        .addDataCart(cart: data);
  }

  void selectSizeProduct(int size) {
    if (size == 0) {
      setState(() {
        widget._selectedSize = 38;
      });
    } else if (size == 1) {
      setState(() {
        widget._selectedSize = 39;
      });
    } else if (size == 2) {
      setState(() {
        widget._selectedSize = 40;
      });
    } else if (size == 3) {
      setState(() {
        widget._selectedSize = 41;
      });
    } else if (size == 4) {
      setState(() {
        widget._selectedSize = 42;
      });
    } else if (size == 5) {
      setState(() {
        widget._selectedSize = 43;
      });
    } else if (size == 6) {
      setState(() {
        widget._selectedSize = 44;
      });
    } else {
      setState(() {
        widget._selectedSize = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Masuk View Detail Product Id User : ${widget.idUser}');
    print('masuk Tombol yang diteken : ${widget._selectedSize}');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
            Consumer<ProductStoreProvider>(builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final product = provider.selectedProduct;

          if (product == null) {
            return const Center(child: Text('Product not found'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //GAMBAR SEPATU / GAMBAR PRODUCT ------------------------------------------------------
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.38,
                child: PageView.builder(
                  controller: _pageSepatuController,
                  itemCount: product.image.length, // Jumlah gambar
                  itemBuilder: (context, index) {
                    return Image.network(
                      product.image[index],
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              //Page Indicator ------------------------------------------------
              Center(
                child: SmoothPageIndicator(
                  controller: _pageSepatuController,
                  count: product.image.length,
                  effect: ExpandingDotsEffect(
                    dotColor: const Color.fromARGB(180, 46, 47, 48),
                    activeDotColor: Colors.orange,
                    dotHeight: MediaQuery.of(context).size.height * 0.01,
                    dotWidth: MediaQuery.of(context).size.width * 0.02,
                    expansionFactor: 4,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.035,
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${product.brand}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.055),
                            ),
                            Text(
                              '${product.type}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.039,
                                  height: MediaQuery.of(context).size.height *
                                      0.003,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        Text(
                          'Rp. ${formatRupiah(product.price)}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055),
                        ),
                        //tt
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Color : ${product.color}',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.039,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.005),
                        Icon(
                          Icons.square,
                          color: Colors.red,
                        )
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Size',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.039,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed:
                                    () {}, // Tombol tetap bisa ditekan tetapi tidak melakukan apa-apa
                                child: const Text('Size Guide'),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  style: IconButton.styleFrom(
                                    padding:
                                        EdgeInsets.zero, // Hapus padding bawaan
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  icon: const Icon(
                                    Icons.error_outline_rounded,
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                        ]),

                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.010),
                    //BUTTON SIZE ------------------------------------------------------------
                    Wrap(
                      spacing: MediaQuery.of(context).size.width * 0.02,
                      // runSpacing: 8.0, // Jarak vertikal antar baris
                      children: List.generate(7, (index) {
                        int? size;
                        if (widget._selectedSize == 38) {
                          size = 0;
                        } else if (widget._selectedSize == 39) {
                          size = 1;
                        } else if (widget._selectedSize == 40) {
                          size = 2;
                        } else if (widget._selectedSize == 41) {
                          size = 3;
                        } else if (widget._selectedSize == 42) {
                          size = 4;
                        } else if (widget._selectedSize == 43) {
                          size = 5;
                        } else if (widget._selectedSize == 44) {
                          size = 6;
                        }
                        print('masuk TEST SIZE DI WIDGET : $size');
                        return TextButton(
                          onPressed: () => selectSizeProduct(index),
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            backgroundColor: size == index
                                ? Colors.orange
                                : Colors.transparent,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.width * 0.037),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            '${38 + index}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        );
                      }),
                    ),

                    //Button Add To Bag

                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018),
                    ElevatedButton(
                      onPressed: () => handleAddToCart(),
                      style: ElevatedButton.styleFrom(
                        animationDuration: const Duration(milliseconds: 300),
                        overlayColor: Colors.grey.withOpacity(0.5),
                        shadowColor: Colors.orange.withOpacity(0.5),
                        backgroundColor: const Color.fromARGB(255, 46, 47, 48),
                        minimumSize: const Size(double.infinity, 36),
                        elevation: 6,
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.012),
                    Center(
                      child: Text(
                        'Free shiping on orders over Rp 500.000',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.0335),
                      ),
                    ),

                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.040),
                    const Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    const Text(
                      'Genuine Leather is a natural material from animals and therefore differs from hide to hide. Whereas Synthetic Leather are treated and reacts differently during coloring and tanning process, to replicate these textures of a Genuine Leather.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.2,
                      ),
                    ),

                    //Rating and Reviews Column -------------------------------------------------------------------------------------------------
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.065),
                    const Center(
                      child: Column(
                        children: [
                          Text('Ratings and Reviews',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text('4.7',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w400)),
                          SizedBox(height: 10),
                          // RatingBar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, size: 25, color: Colors.orange),
                              Icon(Icons.star, size: 25, color: Colors.orange),
                              Icon(Icons.star, size: 25, color: Colors.orange),
                              Icon(Icons.star, size: 25, color: Colors.orange),
                              Stack(
                                children: [
                                  Icon(Icons.star,
                                      size: 25, color: Colors.grey),
                                  ClipRect(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: 0.6,
                                      child: Icon(Icons.star,
                                          size: 25, color: Colors.orange),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Center(
                            child: Text('Based on 91 Reviews'),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('91 reviews'),

                        //Dropdown
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0,
                              ),
                            ),
                            child: DropdownButton(
                              value: 'latestReview',
                              items: const [
                                DropdownMenuItem(
                                  value: "latestReview",
                                  child: Text('Latest Review'),
                                ),
                                DropdownMenuItem(
                                  value: "highestRating",
                                  child: Text('Highest Rating'),
                                ),
                                DropdownMenuItem(
                                  value: 'lowRating',
                                  child: Text('Low Rating'),
                                )
                              ],
                              onChanged: (value) {},
                              underline:
                                  Container(), // Hilangkan underline bawaan
                            )),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 3,
                    ),

                    //Reviews -----------------------------------------------------------------
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        5,
                        (index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: const Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.orange),
                                        Icon(Icons.star, color: Colors.orange),
                                        Icon(Icons.star, color: Colors.orange),
                                        Icon(Icons.star, color: Colors.orange),
                                        Stack(
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.grey),
                                            ClipRect(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                widthFactor: 0.6,
                                                child: Icon(Icons.star,
                                                    color: Colors.orange),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text('4 months ago'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Oleh : $index',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                              ),
                              const SizedBox(height: 8),
                              const Divider(
                                thickness: 3,
                              )
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: Text(
                          'Show more',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ]))
            ],
          );
        }),
      ),
    );
  }
}
