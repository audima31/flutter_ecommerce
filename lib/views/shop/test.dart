import 'package:ecommerce/services/auth_store.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:ecommerce/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestTestAja extends StatelessWidget {
  const TestTestAja({super.key});

  @override
  Widget build(BuildContext context) {
    // Memastikan AuthStoreProvider sudah ada di tree
    return ChangeNotifierProvider(
      create: (_) => AuthStoreProvider(AuthenticationFirebaseService()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Consumer<AuthStoreProvider>(
          builder: (context, authStoreProvider, child) {
            if (authStoreProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Menampilkan data user jika ada
            if (authStoreProvider.user != null) {
              return Center(
                child: Text(
                  'User ID: ${authStoreProvider.user!.id}',
                  style: const TextStyle(fontSize: 20),
                ),
              );
            } else {
              return const Center(child: Text('No user data available.'));
            }
          },
        ),
      ),
    );
  }
}
