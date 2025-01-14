import 'dart:convert';

import 'package:ecommerce/services/dartz_service.dart';
import 'package:ecommerce/services/dio_service.dart';
import 'package:flutter/material.dart';

class Dartzpage extends StatefulWidget {
  const Dartzpage({super.key});

  @override
  State<Dartzpage> createState() => _DartzpageState();
}

class _DartzpageState extends State<Dartzpage> {
  final DartzService dartzService = DartzService();
  bool _isLoading = false;
  String? _errorMessage;
  List<dynamic>? _newsData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final data = await dartzService.getNews();

    data.fold((L) {
      setState(() {
        _errorMessage = L.message;
        _isLoading = false;
      });
      print("Error: ${L.message}");
    }, (R) {
      setState(() {
        if (R.data != null && R.data!.posts != null) {
          _newsData = R.data!.posts;
          _isLoading = false;
        } else {
          _errorMessage = "Invalid data format";
          _isLoading = false;
        }
      });
      print("Parsed Posts: $_newsData");
      print("Data success: ${R.success}");
      print("Data message: ${R.message}");
      print("Data posts: ${R.data?.posts}");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Parsed Posts: $_newsData");
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio with Dartz!'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Text(
                    _errorMessage ?? 'Unknown Error',
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : _newsData == null || _newsData!.isEmpty
                  ? const Center(child: Text('No Data Available'))
                  : ListView.builder(
                      itemCount: _newsData!.length,
                      itemBuilder: (context, index) {
                        final post = _newsData![index];
                        return ListTile(
                          leading: post.thumbnail != null
                              ? Image.network(
                                  post.thumbnail!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )
                              : null,
                          title: Text(post.title ?? 'No Title'),
                          subtitle: Text(post.description ?? 'No Description'),
                        );
                      },
                    ), // Success State
    );
  }
}
