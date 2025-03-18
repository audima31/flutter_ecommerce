import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/views/detailProduct/detailProduct.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final ProductsModels product;
  final String idUser;
  final VoidCallback onAddToWishlist;

  const ProductCard({
    required this.product,
    required this.idUser,
    required this.onAddToWishlist,
    super.key,
  });

  String formatRupiah(int amount) {
    return NumberFormat('#,###', 'id_ID').format(amount).replaceAll(',', '.');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProduct(
                index: product.id,
                idUser: idUser,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                product.image.isNotEmpty ? product.image[0] : '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, size: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.brand ?? 'Unknown Brand',
                      style: const TextStyle(color: Colors.grey)),
                  Text(product.type ?? 'Unknown Type',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Rp. ${formatRupiah(product.price)}',
                      style: const TextStyle(color: Colors.orange)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: onAddToWishlist,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
