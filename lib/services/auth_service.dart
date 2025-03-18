import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/authentication.dart';
import 'package:ecommerce/views/authentication/login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationFirebaseService {
  /// Fungsi untuk Sign Up -----------------------------------------------------
  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Menampilkan SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign up successful! Please log in.'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );

      // Navigasi ke halaman Login
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred. Please try again.';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak, at least 6 characters.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      _showErrorToast(message);
    }
  }

  /// Fungsi untuk Sign In -----------------------------------------------------
  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Menampilkan SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign in successful!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );

      // Navigasi ke halaman Home
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyApp(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = 'Email or Password is incorrect.';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      _showErrorToast(message);
      print('TESTTTT: ${e.code}');
    }
  }

  /// Fungsi untuk menampilkan error toast
  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  /// Fungsi untuk Logout -----------------------------------------------------
  Future<void> signOut({
    required BuildContext context,
  }) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }

  Future<UserModels?> getCurrentUser() async {
    //Untuk mendapatkan infomasi ID pengguna yang sedang login
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      print('User ID : ----------${firebaseUser.uid}');

      //Jika user sedang login, maka akan mengambil data user dari Firebase Realtime Database
      final databaseReference = FirebaseDatabase.instance.ref();
      final snapshot =
          await databaseReference.child('user/${firebaseUser.uid}').once();

      if (snapshot.snapshot.exists) {
        final data = snapshot.snapshot.value;
        print('Data user: $data');

        if (data is Map) {
          // Mengembalikan data pengguna dari Firebase Realtime Database
          return UserModels.fromMap(Map<String, dynamic>.from(data));
        } else {
          print('Data is not in the correct format.');
        }
      } else {
        print('User not found in database.');
      }
    } else {
      print('User is not logged in.');
    }
    return null;
  }
}
