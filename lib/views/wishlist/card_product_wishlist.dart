import 'package:flutter/material.dart';

class CardProductWishlist extends StatefulWidget {
  const CardProductWishlist({super.key});

  @override
  State<CardProductWishlist> createState() => _CardProductWishlistState();
}

class _CardProductWishlistState extends State<CardProductWishlist> {
  final TextEditingController _sizeController = TextEditingController();

  String _setSizeController = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // shadowColor: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/img/sepatu/sepatu.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nike',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              Text(
                                'Air Jordan 1 Low OG',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: Colors.black.withOpacity(0.6),
                              ))
                        ],
                      ),
                      Text(
                        'Rp. 1.000.000',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.w400,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
