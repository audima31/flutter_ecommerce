import 'package:ecommerce/views/detailProduct/detailProduct.dart';
import 'package:flutter/material.dart';

class CardProductHomePage extends StatelessWidget {
  const CardProductHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(8, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.37,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailProduct()));
                },
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Colors.grey.shade200.withOpacity(0.4),
                          ),
                          child: Image.asset(
                            'assets/img/sepatu/sepatu.png',
                            width: MediaQuery.of(context).size.width * 0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rp. 1.200.000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                      color: Colors.orange),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.008,
                                ),
                                Text(
                                  'Nike Air Force 1 Shadow',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.005,
                                ),
                                Text(
                                  'Men\' shoes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: MediaQuery.of(context).size.width * 0.065,
                        ),
                      ),
                    )
                  ],
                ),

                //col
              ),
            ),
          ),
        );
      })),
    );
  }
}
