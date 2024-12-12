import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/sepatu/sepatu.png',
                fit: BoxFit.cover,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nike',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        'Air Force 1 Shadow',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            height: 3,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  Text(
                    'Rp. 2.200.000',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  //tt
                ],
              ),
              const Row(
                children: [
                  Text(
                    'Color : Siren Red',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.square,
                    color: Colors.red,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Select Size',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed:
                          () {}, // Tombol tetap bisa ditekan tetapi tidak melakukan apa-apa
                      child: const Text('Size Guide'),
                    ),
                    IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero, // Hapus padding bawaan
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: const Icon(
                          Icons.error_outline_rounded,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ]),

              const SizedBox(height: 10),
              //BUTTON SIZE ------------------------------------------------------------
              Wrap(
                spacing: 8.0, // Jarak horizontal antar elemen
                // runSpacing: 8.0, // Jarak vertikal antar baris
                children: List.generate(7, (index) {
                  return TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: Colors.transparent,
                      minimumSize: const Size(25, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      '${38 + index}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  );
                }),
              ),

              //Button Add To Bag

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(double.infinity, 36),
                  elevation: 4, // Menambah elevasi atau bayangan
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Free shiping on orders over Rp 500.000',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),

              const SizedBox(height: 30),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const Text(
                'Genuine Leather is a natural material from animals and therefore differs from hide to hide. Whereas Synthetic Leather are treated and reacts differently during coloring and tanning process, to replicate these textures of a Genuine Leather.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.2,
                ),
              ),

              //Rating and Reviews Column -------------------------------------------------------------------------------------------------
              const SizedBox(height: 50),
              const Center(
                child: Column(
                  children: [
                    Text('Ratings and Reviews',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('4.7',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400)),
                    SizedBox(height: 10),
                    // RatingBar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, size: 25, color: Colors.orange),
                        Icon(Icons.star, size: 25, color: Colors.orange),
                        Icon(Icons.star, size: 25, color: Colors.orange),
                        Icon(Icons.star, size: 25, color: Colors.orange),
                        Stack(
                          children: [
                            Icon(Icons.star, size: 25, color: Colors.grey),
                            ClipRect(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                widthFactor: 0.6,
                                child: Icon(Icons.star,
                                    size: 25, color: Colors.orange),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text('Based on 91 Reviews'),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('91 reviews'),

                  //Dropdown
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      child: DropdownButton(
                        value: 'latestReview',
                        items: const [
                          DropdownMenuItem(
                            child: Text('Latest Review'),
                            value: "latestReview",
                          ),
                          DropdownMenuItem(
                            child: Text('Highest Rating'),
                            value: "highestRating",
                          ),
                          DropdownMenuItem(
                            child: Text('Low Rating'),
                            value: 'lowRating',
                          )
                        ],
                        onChanged: (value) {},
                        underline: Container(), // Hilangkan underline bawaan
                      )),
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 3,
              ),

              //Reviews -----------------------------------------------------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  5,
                  (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Stack(
                                    children: [
                                      Icon(Icons.star, color: Colors.grey),
                                      ClipRect(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: 0.6,
                                          child: Icon(Icons.star,
                                              color: Colors.orange),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Text('4 months ago'),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Oleh : ${index}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        ),
                        SizedBox(height: 8),
                        Divider(
                          thickness: 3,
                        )
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Show more',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
