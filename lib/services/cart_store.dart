import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/services/cart_service.dart';
import 'package:flutter/material.dart';

class CartStoreProvider extends ChangeNotifier {
  final CartFirebaseService _cartFirebaseService;

  CartStoreProvider(this._cartFirebaseService);

  List<CartModels> _cart = [];
  List<CartModels> get cart => _cart;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Fungsi untuk mengambil data cart
  Future<void> fetchDataCart({required String idUser}) async {
    print('Masuk Provider Cart $cart');
    _isLoading = true;
    notifyListeners();

    try {
      _cart = await _cartFirebaseService.fetchDataCart(idUser: idUser);
      notifyListeners();
      print('Masuk Provider Cart $cart');
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete data cart
  Future<void> deleteDataCart({required String idCart}) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _cartFirebaseService.deleteDataCart(idCart: idCart);

      // Hapus data dari list lokal
      _cart.removeWhere((item) => item.idCart == idCart);
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addDataCart({required Map<String, dynamic> cart}) async {
    _isLoading = true;
    notifyListeners();

    final cartItem = CartModels(
      idCart: cart['idCart'] ?? '',
      idUser: cart['idUser'] ?? '',
      image: cart['image'] ?? '',
      color: cart['color'] ?? '',
      gender: cart['gender'] ?? '',
      jumlahBarang: cart['jumlahBarang'] ?? 0,
      price: cart['price'] ?? 0,
      caption: cart['caption'] ?? '',
      idProduct: cart['idProduct'] ?? 0,
      priceAwal: cart['priceAwal'] ?? 0,
      type: cart['type'] ?? '',
      brand: cart['brand'] ?? '',
      size: cart['size'] ?? 0,
    );

    try {
      await _cartFirebaseService.addDataCart(cart: cartItem.toMap());
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching product detail: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
