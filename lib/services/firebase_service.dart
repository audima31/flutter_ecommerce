import 'package:ecommerce/models/products.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductFirebaseRealtimaDatabaseService {
  // Instance database reference
  final _databaseReference = FirebaseDatabase.instance.ref();

  // Fetch data product from Firebase
  Future<List<ProductsModels>> fetchDataProduct() async {
    print('Masuk Service Product');

    try {
      // Ambil data dari Firebase
      final snapshot = await _databaseReference.child('product/').once();

      // Cek apakah data ada
      if (snapshot.snapshot.exists) {
        print('Data exists');

        final data = snapshot.snapshot.value;

        // Cek tipe data
        print('Masuk Data Structure: $data'); // Cek struktur data

        if (data is List) {
          // Jika data berupa List, kita bisa langsung map ke Models
          print('list service');
          return data
              .map((item) =>
                  ProductsModels.fromMap(Map<String, dynamic>.from(item)))
              .toList();
        } else if (data is Map) {
          print('map service');
          // Jika data berupa Map, kita bisa mengakses key-value seperti biasa
          return data.entries
              .map((entry) => ProductsModels.fromMap(
                  Map<String, dynamic>.from(entry.value)))
              .toList();
        } else {
          throw Exception('Unexpected data format');
        }
      } else {
        print('Data tidak ditemukan');
        throw Exception('Data not found');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch data: $e');
    }
  }
}
