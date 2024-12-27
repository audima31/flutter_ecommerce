import 'package:flutter/material.dart';

class CardAddressUser extends StatelessWidget {
  const CardAddressUser({super.key});

  @override
  Widget build(BuildContext context) {
    return //Inkwell Button
        Card(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {},
        splashColor: const Color.fromARGB(255, 230, 228, 228),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Icon(
                  Icons.location_on_outlined,
                  size: 30,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Audima Oktasena',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Jl. Kamboja No. 2A 2, RT.1/RW.1, Gandaria Utara, Kec. Kebayoran Baru',
                      textAlign: TextAlign.justify,
                      style: TextStyle(height: 1.5),
                    ),
                    SizedBox(height: 5),
                    Text('Kota Jakarta Selatan'),
                    SizedBox(height: 5),
                    Text('Provinsi DKI Jakarta'),
                    SizedBox(height: 5),
                    Text('12140'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        size: 25,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
