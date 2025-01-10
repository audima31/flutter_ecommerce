import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductStoreProvider extends ChangeNotifier {
  final ProductFirbaseService _firebaseRealtimaDatabaseService;

  ProductStoreProvider(this._firebaseRealtimaDatabaseService);

  List<ProductsModels> _products = [];
  List<ProductsModels> get products => _products;

  List<ProductsModels> _firstProduct = [];
  List<ProductsModels> get firstProduct => _firstProduct;

  ProductsModels? _selectedProduct;
  ProductsModels? get selectedProduct => _selectedProduct;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchDataProduct() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _firebaseRealtimaDatabaseService.fetchDataProduct();
    } catch (error) {
      debugPrint('Error fetching products: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDetailDataProduct({required int idProduct}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final detailProduct = await _firebaseRealtimaDatabaseService
          .fetchDetailDataProduct(idProduct: idProduct);
      _selectedProduct = detailProduct;
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching product detail: $e');
      _selectedProduct = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchLimaDataProduct() async {
    _isLoading = true;
    notifyListeners();

    try {
      _firstProduct =
          await _firebaseRealtimaDatabaseService.fetchLimaDataProduct();
      print('masuk Store first product : ${firstProduct.length}');
      notifyListeners();
    } catch (error) {
      debugPrint('Error fetching products: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
