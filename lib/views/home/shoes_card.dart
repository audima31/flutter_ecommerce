import 'package:flutter/material.dart';

class ResponsiveProductGrid extends StatelessWidget {
  const ResponsiveProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    double screenWidth = MediaQuery.of(context).size.width;

    // Menentukan jumlah kolom berdasarkan lebar layar
    int crossAxisCount;
    if (screenWidth <= 360) {
      // Contoh untuk layar kecil seperti Samsung S8
      crossAxisCount = 2;
    } else if (screenWidth <= 600) {
      // Layar medium
      crossAxisCount = 3;
    } else {
      // Layar besar seperti iPhone 16
      crossAxisCount = 4;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Product Grid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Jumlah kolom
            crossAxisSpacing: 16, // Jarak horizontal antar card
            mainAxisSpacing: 16, // Jarak vertikal antar card
            childAspectRatio: 0.7, // Rasio lebar : tinggi card
          ),
          itemCount: 20, // Jumlah item yang ingin ditampilkan
          itemBuilder: (context, index) {
            return ProductCard(index: index); // Widget Card
          },
        ),
      ),
    );
  }
}

// Widget Card Produk
class ProductCard extends StatelessWidget {
  final int index;

  const ProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                'https://via.placeholder.com/150',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product #$index',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${(index + 1) * 10}.00',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 36),
                      ),
                      child: const Text('Add to Cart'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
