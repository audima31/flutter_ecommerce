import 'package:ecommerce/models/wishlist.dart';
import 'package:firebase_database/firebase_database.dart';

class WishlistFirebaseService {
  final _databaseReference = FirebaseDatabase.instance.ref();

  //GET DATA WISHLIST
  Future<List<WishlistModel>> fetchDataWishlist({
    required String idUser,
  }) async {
    try {
      print('Masuk Service Wishlist : $idUser');
      final snapshot = await _databaseReference
          .child('wishlist/')
          .orderByChild('idUser')
          .equalTo(idUser)
          .once();

      if (snapshot.snapshot.exists) {
        final data = snapshot.snapshot.value as Map<dynamic, dynamic>;
        print('Masuk Data Wishlist: $data');

        return data.values.map((item) {
          return WishlistModel.fromMap(item);
        }).toList();
      } else {
        throw Exception('Unexpected data format');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  //POST DATA WISHLIST
  Future<void> addDataWishlist({required Map<String, dynamic> wishlist}) async {
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("wishlist/${wishlist['idWishlist']}");
      await ref.set(wishlist);
    } catch (e) {
      throw Exception('Error adding data : $e');
    }
  }

  //Delete DATA WISHLIST
  Future<void> deleteDataWishlist({required String idWishlist}) async {
    try {
      await _databaseReference.child('wishlist/').child(idWishlist).remove();
    } catch (e) {
      print(e);
      throw Exception('Error deleting data wishlist: $e');
    }
  }
}
