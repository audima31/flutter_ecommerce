import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';

class CartStore extends ChangeNotifier {
  //Global State dari Models
  final List<ProductsModels> _cart = [];

  get product => _cart;
}
