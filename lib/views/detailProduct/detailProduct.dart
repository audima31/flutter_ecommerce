import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

final List<String> shoeImages = [
  'assets/img/sepatu/sepatu.png',
  'assets/img/sepatu/sepatu.png',
  'assets/img/sepatu/sepatu.png',
];

class _DetailProductState extends State<DetailProduct> {
  final PageController _pageSepatuController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //GAMBAR SEPATU / GAMBAR PRODUCT ------------------------------------------------------
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.38,
              child: PageView.builder(
                controller: _pageSepatuController,
                itemCount: shoeImages.length, // Jumlah gambar
                itemBuilder: (context, index) {
                  return Image.asset(
                    shoeImages[index],
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            //Page Indicator ------------------------------------------------
            Center(
              child: SmoothPageIndicator(
                controller: _pageSepatuController,
                count: shoeImages.length,
                effect: ExpandingDotsEffect(
                  dotColor: const Color.fromARGB(180, 46, 47, 48),
                  activeDotColor: Colors.orange,
                  dotHeight: MediaQuery.of(context).size.height * 0.01,
                  dotWidth: MediaQuery.of(context).size.width * 0.02,
                  expansionFactor: 4,
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.035,
                ),
                child: Column(children: [
                  Row(
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
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055),
                          ),
                          Text(
                            'Air Force 1 Shadow',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.039,
                                height:
                                    MediaQuery.of(context).size.height * 0.003,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),

                      Text(
                        'Rp. 2.200.000',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.055),
                      ),
                      //tt
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Color : Siren Red',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.039,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005),
                      Icon(
                        Icons.square,
                        color: Colors.red,
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.013),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Size',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.039,
                              fontWeight: FontWeight.bold),
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
                                  padding:
                                      EdgeInsets.zero, // Hapus padding bawaan
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                icon: const Icon(
                                  Icons.error_outline_rounded,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      ]),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                  //BUTTON SIZE ------------------------------------------------------------
                  Wrap(
                    spacing: MediaQuery.of(context).size.width * 0.02,
                    // runSpacing: 8.0, // Jarak vertikal antar baris
                    children: List.generate(7, (index) {
                      return TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: Colors.transparent,
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.037),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
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

                  SizedBox(height: MediaQuery.of(context).size.height * 0.018),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      animationDuration: const Duration(milliseconds: 300),
                      overlayColor: Colors.grey.withOpacity(0.5),
                      shadowColor: Colors.orange.withOpacity(0.5),
                      backgroundColor: const Color.fromARGB(255, 46, 47, 48),
                      minimumSize: const Size(double.infinity, 36),
                      elevation: 6,
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                  Center(
                    child: Text(
                      'Free shiping on orders over Rp 500.000',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.0335),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.040),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.065),
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

                  const SizedBox(height: 20),
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
                                value: "latestReview",
                                child: Text('Latest Review'),
                              ),
                              DropdownMenuItem(
                                value: "highestRating",
                                child: Text('Highest Rating'),
                              ),
                              DropdownMenuItem(
                                value: 'lowRating',
                                child: Text('Low Rating'),
                              )
                            ],
                            onChanged: (value) {},
                            underline:
                                Container(), // Hilangkan underline bawaan
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
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Row(
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
                            const SizedBox(height: 8),
                            Text(
                              'Oleh : $index',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                            ),
                            const SizedBox(height: 8),
                            const Divider(
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      child: Text(
                        'Show more',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ]))
          ],
        ),
      ),
    );
  }
}
