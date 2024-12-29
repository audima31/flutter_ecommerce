import 'package:flutter/material.dart';

class CardProductChart extends StatefulWidget {
  CardProductChart({
    super.key,
  });

  @override
  State<CardProductChart> createState() => _CardProductChartState();
}

class _CardProductChartState extends State<CardProductChart> {
  TextEditingController _selectTotal = TextEditingController();

  int _setSelectedTotal = 1;

  void handleKurangBarang() {
    if (_setSelectedTotal > 1) {
      setState(() {
        _setSelectedTotal -= 1;
      });
    }
  }

  void handleTambahBarang() {
    if (_setSelectedTotal < 10) {
      setState(() {
        _setSelectedTotal += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {},
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 3,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/img/sepatu/sepatu.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.015,
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nike',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 128, 128, 128),
                              ),
                            ),
                            Text(
                              ' Air Force 1 Shadow',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 128, 128, 128),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Ukuran: 40',
                          style: TextStyle(
                            color: Color.fromARGB(255, 128, 128, 128),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp. 1.000.000',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.023,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.24,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.007),
                                width:
                                    MediaQuery.of(context).size.height * 0.037,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    iconSize:
                                        MediaQuery.of(context).size.height *
                                            0.010,
                                  ),
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.orange,
                                  ),
                                  onPressed: handleKurangBarang,
                                ),
                              ),
                              Text(
                                _setSelectedTotal.toString(),
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.007,
                                ),
                                width: MediaQuery.of(context).size.width * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    iconSize:
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                  ),
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: handleTambahBarang,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
