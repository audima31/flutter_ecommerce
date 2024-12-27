import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//NANTI MAU DIPAKE BUAT, KALO AKSES CHART, MAKA GABAKAL NAMPILIN BOTTOM NAVBAR----------------------------------------------
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PageTracker(),
      child: MyApp(),
    ),
  );
}

class PageTracker extends ChangeNotifier {
  String _currentPage = 'Home';

  String get currentPage => _currentPage;

  void updatePage(String page) {
    _currentPage = page;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/details': (context) => DetailsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<PageTracker>().updatePage('Home'); // Update halaman aktif

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/details');
          },
          child: const Text('Go to Details'),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<PageTracker>().updatePage('Details'); // Update halaman aktif

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
