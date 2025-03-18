import 'package:ecommerce/models/products.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductFirbaseService {
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

  Future<ProductsModels> fetchDetailDataProduct(
      {required int idProduct}) async {
    print('Masuk Service Detail Product : $idProduct');

    try {
      final snapshot =
          await _databaseReference.child('product/$idProduct/').get();

      print('masuk Service 2 Detail Product ${snapshot.value}');

      if (snapshot.exists) {
        final data = snapshot.value;

        if (data is List) {
          print('masuk List Service Detail Product ${data.length.toString()}');
          return ProductsModels.fromMap(Map<String, dynamic>.from(data[0]));
        } else if (data is Map) {
          return ProductsModels.fromMap(Map<String, dynamic>.from(data));
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        print('snapshot does not exist');
        throw Exception('No data found');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching data: $e');
    }
  }

  Future<List<ProductsModels>> fetchLimaDataProduct() async {
    print('Masuk Service Product');

    try {
      // Ambil data dari Firebase
      final database = FirebaseDatabase.instance.ref("product");

      final snapshot = await database.limitToFirst(5).get();

      // Cek apakah data ada
      if (snapshot.exists) {
        print('Data exists');

        final data = snapshot.value;

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
