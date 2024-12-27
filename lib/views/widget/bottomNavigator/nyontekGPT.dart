
// class ButtomNavigatorClass extends StatefulWidget {
//   const ButtomNavigatorClass({super.key});

//   @override
//   State<ButtomNavigatorClass> createState() => _ButtomNavigatorClassState();
// }

// class _ButtomNavigatorClassState extends State<ButtomNavigatorClass> {
//   int _selectedIndex = 0; // Menyimpan indeks halaman aktif

//   // Daftar halaman untuk setiap tab
//   static List<Widget> _pages = <Widget>[
//     Center(child: Text('Home Page')),
//     Center(child: Text('Stats Page')),
//     Center(child: Text('Saved Page')),
//     Center(child: Text('Profile Page')),
//   ];

//   // Ketika tab ditekan, perbarui indeks
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Bottom Navigation Example'),
//           backgroundColor: Colors.black,
//         ),
//         body: _pages[_selectedIndex], // Tampilkan halaman sesuai tab
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.black,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.grey,
//           currentIndex: _selectedIndex, // Indeks aktif
//           onTap: _onItemTapped, // Fungsi saat tab ditekan
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.analytics),
//               label: 'Stats',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.bookmark),
//               label: 'Saved',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//           type: BottomNavigationBarType.fixed, // Tetap posisi label
//         ),
//       ),
//     );
//   }
// }
