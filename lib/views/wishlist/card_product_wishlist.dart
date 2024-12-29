import 'package:flutter/material.dart';

class CardProductWishlist extends StatefulWidget {
  const CardProductWishlist({
    super.key,
  });

  @override
  State<CardProductWishlist> createState() => _CardProductWishlistState();
}

class _CardProductWishlistState extends State<CardProductWishlist> {
  final TextEditingController _sizeController = TextEditingController();

  String _setSizeController = '';

  final List<String> sizes = ['38', '39', '40', '41', '42', '43'];

  @override
  Widget build(BuildContext context) {
    return Material(
      //Material biar ada effect ripple (Atau effect ketika ditekan)
      color: Colors.transparent, // Pastikan background transparan
      child: InkWell(
        onTap: () {
          // Aksi ketika CardProductWishlist ditekan
          print('CardProductWishlist ditekan!');
        },
        // Tambahkan border radius jika perlu
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02),
                      color: Colors.black.withOpacity(0.1),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img/sepatu/sepatu.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    'Air Jordan 1 Low OG',
                                    style: TextStyle(
                                        fontSize: 14,
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
                                  size:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Rp. 1.000.000',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                              ),
                              margin: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.035,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.2))),
                              child: Row(
                                children: [
                                  Text(
                                    'Size Select',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.035,
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                overlayColor: Colors.grey.withOpacity(0.5),
                                shadowColor: Colors.orange.withOpacity(0.5),
                                backgroundColor:
                                    const Color.fromARGB(255, 46, 47, 48),
                                minimumSize: const Size(double.infinity, 36),
                                elevation: 6,
                              ),
                              child: const Text(
                                'Order',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Divider(
                color: Colors.black.withOpacity(0.1),
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
