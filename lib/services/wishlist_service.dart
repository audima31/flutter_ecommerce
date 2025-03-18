import 'package:ecommerce/models/list_wishlist.dart';
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

  //GET DATA LIST WISHLIST
  Future<List<ListWishlistModel>> fetchDataWListWishlist({
    required String idUser,
  }) async {
    try {
      print('Masuk Service ListWishlist : $idUser');
      final snapshot = await _databaseReference
          .child('listWishlist/')
          .orderByChild('idUser')
          .equalTo(idUser)
          .once();

      if (snapshot.snapshot.exists) {
        final data = snapshot.snapshot.value as Map<dynamic, dynamic>;
        print('Masuk Data ListWishlist: $data');

        return data.values.map((item) {
          return ListWishlistModel.fromMap(item);
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

      DatabaseReference reference = FirebaseDatabase.instance
          .ref("listWishlist/${wishlist['idWishlist']}");
      await reference.set({
        "idListWishlist": wishlist['idWishlist'],
        "idUser": wishlist['idUser'],
        "idProduct": wishlist['idProduct'],
      });
    } catch (e) {
      throw Exception('Error adding data : $e');
    }
  }

  //Delete DATA WISHLIST
  Future<void> deleteDataWishlist({required String idWishlist}) async {
    try {
      await _databaseReference.child('wishlist/').child(idWishlist).remove();
      await _databaseReference
          .child('listWishlist/')
          .child(idWishlist)
          .remove();
    } catch (e) {
      print(e);
      throw Exception('Error deleting data wishlist: $e');
    }
  }
}
