import 'dart:convert';

import 'package:ecommerce/services/dio_service.dart';
import 'package:flutter/material.dart';

class Diopage extends StatefulWidget {
  const Diopage({super.key});

  @override
  State<Diopage> createState() => _DiopageState();
}

class _DiopageState extends State<Diopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: DioService().getHttp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No data available'));
            }

            final data = snapshot.data; // Cast sesuai dengan tipe data
            return ListView.builder(
              itemCount: data?.data!.posts?.length ?? 0,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(data!.data!.posts?[index].title ?? 'No title'),
                    subtitle:
                        Text(data.data!.posts?[index].description ?? 'No desc'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
