import 'package:flutter/material.dart';

class CardProductList extends StatelessWidget {
  const CardProductList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Nama Product',
                style: TextStyle(
                    fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              //Divider untuk garis horizontal
              Divider(
                color: Colors.grey,
                thickness: 2,
                indent: 20, //Jarak dari kiri
                endIndent: 20, //Jarak dari kanan
              ),

              Image.asset(
                'assets/img/sepatu/sepatu.png',
                fit: BoxFit.cover,
              ),

              Divider(
                color: Colors.grey,
                thickness: 3,
                indent: 20, //Jarak dari kiri
                endIndent: 20, //Jarak dari kanan
              ),
              SizedBox(height: 20),
              Text(
                'Type sepatu',
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 20),
              Text('Rp. 1.000.000',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
