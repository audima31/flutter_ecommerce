import 'package:ecommerce/models/list_wishlist.dart';
import 'package:ecommerce/models/wishlist.dart';
import 'package:ecommerce/services/wishlist_service.dart';
import 'package:flutter/material.dart';

class WishlistStore extends ChangeNotifier {
  final WishlistFirebaseService _wishlistFirebaseService;
  WishlistStore(this._wishlistFirebaseService);

  List<WishlistModel> _wishlist = [];
  List<WishlistModel> get wishlist => _wishlist;
  List<ListWishlistModel> _listWishlist = [];
  List<ListWishlistModel> get listWishlist => _listWishlist;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchDataWishlist({required String idUser}) async {
    _isLoading = true;
    notifyListeners();

    print('Masuk Store wishlist : $idUser');

    try {
      _wishlist =
          await _wishlistFirebaseService.fetchDataWishlist(idUser: idUser);
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchListDataWishlist({required String idUser}) async {
    _isLoading = true;
    notifyListeners();
    try {
      _listWishlist =
          await _wishlistFirebaseService.fetchDataWListWishlist(idUser: idUser);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addDataWishlist({required Map<String, dynamic> wishlist}) async {
    _isLoading = true;
    notifyListeners();

    debugPrint(
        'Masuk Store wishlist addDataWishlist : ${wishlist['idWishlist']}');
    final wishlistItem = WishlistModel(
      idWishlist: wishlist['idWishlist'] as String,
      idUser: wishlist['idUser'] as String,
      image: List<String>.from(wishlist['image']),
      color: wishlist['color'] as String,
      gender: wishlist['gender'] as String,
      jumlahBarang: wishlist['jumlahBarang'] as int,
      price: wishlist['price'] as int,
      caption: wishlist['caption'] as String,
      idProduct: wishlist['idProduct'] as int,
      priceAwal: wishlist['priceAwal'] as int,
      type: wishlist['type'] as String,
      brand: wishlist['brand'] as String,
      size: wishlist['size'] as int,
    );

    final listWishlist = ListWishlistModel(
      idListWishlist: wishlist['idWishlist'],
      idUser: wishlist['idUser'],
      idProduct: wishlist['idProduct'],
    );

    try {
      debugPrint(
          'Masuk Store wishlist addDataWishlist : ${wishlist['idWishlist']}');
      await _wishlistFirebaseService.addDataWishlist(
          wishlist: wishlistItem.toMap());

      _wishlist.add(wishlistItem); // Tambahkan item ke list lokal
      _listWishlist.add(listWishlist);
    } catch (e) {
      print('Error $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteDataWishlist({required String idWishlist}) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _wishlistFirebaseService.deleteDataWishlist(idWishlist: idWishlist);
      _wishlist.removeWhere(
        (item) => item.idWishlist == idWishlist,
      );
      _listWishlist.removeWhere(
        (item) => item.idListWishlist == idWishlist,
      ); // Hapus item dari list lokal
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
