import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/views/detailProduct/detailProduct.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardProductHomePage extends StatelessWidget {
  const CardProductHomePage(
      {super.key, required this.cart, required this.idUser});

  final List<ProductsModels> cart;
  final String idUser;

  String formatRupiah(int amount) {
    return NumberFormat('#,###', 'id_ID').format(amount).replaceAll(',', '.');
  }

  @override
  Widget build(BuildContext context) {
    print('Masuk Card Product : ${cart.length.toString()}');
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(cart.length, (index) {
        final product = cart[index];
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.37,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailProduct(
                                index: product.id,
                                idUser: idUser,
                              )));
                },
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Colors.grey.shade200.withOpacity(0.4),
                          ),
                          child: Image.network(
                            product.image[0],
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rp. ${formatRupiah(product.price)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                      color: Colors.orange),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.008,
                                ),
                                Text(
                                  '${product.brand} ${product.type}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.005,
                                ),
                                const Text(
                                  'Men\' shoes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: MediaQuery.of(context).size.width * 0.065,
                        ),
                      ),
                    )
                  ],
                ),

                //col
              ),
            ),
          ),
        );
      })),
    );
  }
}
