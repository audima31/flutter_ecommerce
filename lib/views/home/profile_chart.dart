import 'package:ecommerce/views/chart/chart.dart';
import 'package:flutter/material.dart';

class ProfileChartPage extends StatelessWidget {
  const ProfileChartPage(
      {super.key, required this.name, required this.jumlahKeranjang});

  final String name;
  final String jumlahKeranjang;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ]),
                width: MediaQuery.of(context).size.width * 0.15,
                child: Image.asset('assets/img/sepatu/sepatu.png'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 32,
                          color: Colors.orange,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Jakarta Selatan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      shadows: [
                        Shadow(
                          blurRadius: 32,
                          color: Colors.orange,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Card(
          shadowColor: Colors.orange,
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChartPage()));
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.width * 0.01,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text('$jumlahKeranjang'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
