// import 'package:ecommerce/views/authentication/contentLoginPage.dart';
// import 'package:flutter/material.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// class LoginPage2 extends StatefulWidget {
//   const LoginPage2({super.key});

//   @override
//   State<LoginPage2> createState() => _LoginPage2State();
// }

// class _LoginPage2State extends State<LoginPage2> {
//   double _panelPosition = 0.0; // Posisi panel (0.0 = collapsed, 1.0 = expanded)

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("SlidingUpPanelExample"),
//       ),
//       body: SlidingUpPanel(
//         collapsed: _headerKetikaSlidingUpTutup(),
//         minHeight: 80,
//         maxHeight: 400,
//         panel: _isiKontenDiSlidingUpPanel(),
//         body: const KontenLogin(),
//         onPanelSlide: (position) {
//           setState(() {
//             _panelPosition = position; // Update posisi panel
//           });
//         },
//       ),
//     );
//   }

//   Widget _headerKetikaSlidingUpTutup() {
//     return Center(
//       child: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 5),
//             child: const Text(
//               'SIGN IN',
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Container(
//             width: 65,
//             height: 4,
//             decoration: BoxDecoration(
//               color: Colors.grey,
//               borderRadius: BorderRadius.circular(200),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _isiKontenDiSlidingUpPanel() {
//     // Konten hanya muncul jika panel telah digeser setidaknya 20%
//     return Visibility(
//       visible:
//           _panelPosition > 0.2, // Kontrol visibilitas berdasarkan posisi panel
//       child: Center(
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             RichText(
//               text: const TextSpan(
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: 'okta',
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'S',
//                     style: TextStyle(
//                       color: Colors.orange,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'hoes',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   TextSpan(
//                     text: '.',
//                     style: TextStyle(color: Colors.orange),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(25),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: const InputDecoration(
//                         label: Text('Email'),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         )),
//                   ),
//                   const SizedBox(height: 25),
//                   TextFormField(
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       label: Text('Password'),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   SizedBox(
//                     width: double.infinity,
//                     child: FilledButton(
//                       onPressed: () {},
//                       style: FilledButton.styleFrom(
//                           backgroundColor: Colors.orange,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           )),
//                       child: const Text(
//                         'LOGIN',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text('Don\'t have an account?'),
//                         TextButton(
//                           onPressed: () {},
//                           style: TextButton.styleFrom(
//                             shadowColor: Colors.transparent,
//                             padding: const EdgeInsets.only(
//                               left: 0,
//                             ),
//                           ),
//                           child: const Text('Sign Up'),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
