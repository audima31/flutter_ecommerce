import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/services/product_service.dart';
import 'package:ecommerce/services/product_store.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartFirebaseService {
  final _databaseReference = FirebaseDatabase.instance.ref();

//Get Data Cart ----------------------------------------------------------------
  Future<List<CartModels>> fetchDataCart({required String idUser}) async {
    print('Masuk Service Cart : $idUser');
    try {
      final snapshot = await _databaseReference
          .child('cart/')
          .orderByChild('idUser')
          .equalTo(idUser)
          .once();

      if (snapshot.snapshot.exists) {
        print('masuk snapshot exists --------');
        final data = snapshot.snapshot.value;

        print('masuk Cek Struktur Data Cart : $data');

        if (data is List) {
          print('masuk List Service $data');
          return data.map((item) {
            print('masuk Memproses item List: $item');
            return CartModels.fromMap(item);
          }).toList();
        } else if (data is Map) {
          print('masuk Map Service $data');
          return data.entries.map((item) {
            print('masuk Memproses item Map: ${item.value}');
            return CartModels.fromMap(item.value);
          }).toList();
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

//Delete Data Cart -------------------------------------------------------------
  Future<void> deleteDataCart({required String idCart}) async {
    try {
      await _databaseReference.child('cart/').child(idCart).remove();
    } catch (e) {
      print('Error deleting data: $e');
      throw Exception('Error deleting data: $e');
    }
  }

// Add Data Cart ---------------------------------------------------------------
  Future<void> addDataCart({required Map<String, dynamic> cart}) async {
    print('Masuk Service Cart : ${cart.entries.toString()}');
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("cart/${cart['idCart']}");
      await ref.set(cart);

      print('Data berhasil ditambahkan ke Firebase!');
    } catch (e) {
      print('Error adding data: $e');
      throw Exception('Error adding data: $e');
    }
  }
}
