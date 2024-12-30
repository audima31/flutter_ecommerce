import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ProductStoreProvider extends ChangeNotifier {
  //Buat ngambil layanan Firebase dari ProductFirebaseRealtimaDatabaseService
  final ProductFirebaseRealtimaDatabaseService _firebaseRealtimaDatabaseService;

  ProductStoreProvider(this._firebaseRealtimaDatabaseService);

  List<ProductsModels> _products = [];
  List<ProductsModels> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchDataProduct() async {
    print('Masuk Provider Product');
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _firebaseRealtimaDatabaseService.fetchDataProduct();
    } catch (error) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
