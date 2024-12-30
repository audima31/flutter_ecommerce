import 'package:ecommerce/models/authentication.dart';
import 'package:ecommerce/services/authentication_firebase.dart';
import 'package:flutter/material.dart';

class AuthStoreProvider extends ChangeNotifier {
  final AuthenticationFirebaseService _authenticationFirebaseService;

  AuthStoreProvider(this._authenticationFirebaseService);

  UserModels? _user;
  UserModels? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fecthDataUser() async {
    print('Masuk Provider User');
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _authenticationFirebaseService.getCurrentUser();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
