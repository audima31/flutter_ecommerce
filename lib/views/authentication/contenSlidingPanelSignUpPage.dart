import 'package:flutter/material.dart';

class ContentSlidingPanelSignUpPage extends StatefulWidget {
  const ContentSlidingPanelSignUpPage({
    super.key,
    required this.posisiPanel,
    required this.onSignInPressed,
  });

  final double posisiPanel;
  final VoidCallback onSignInPressed;

  @override
  State<ContentSlidingPanelSignUpPage> createState() =>
      _ContentslidingPanelSignUpPageState();
}

class _ContentslidingPanelSignUpPageState
    extends State<ContentSlidingPanelSignUpPage> {
  //Global key untuk form
  final _formKey = GlobalKey<FormState>();

  //Text editing controller untuk form input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Variable untuk menyimpan data form
  String _setStateName = '';
  String _setStateEmail = '';
  String _setStatePassword = '';

  /// Fungsi untuk menangani submit form, jika form valid maka
  /// akan menyimpan data input ke dalam variabel `_setStateEmail` dan `_setStatePassword`,
  /// lalu menghapus inputan dari form. Jika form tidak valid maka
  /// akan menampilkan dialog pesan kesalahan.
  void handleSubmit() {
    //Jika semua data berhasil lolos validasi, maka jalankan kode di sini
    if (_formKey.currentState!.validate()) {
      setState(() {
        _setStateEmail = _emailController.text.trim();
        _setStatePassword = _passwordController.text.trim();
        _setStateName = _nameController.text.trim();
      });
      print('EMAILLL :  $_setStateEmail');
      print('PASSWORD :  $_setStatePassword');

      _emailController.clear();
      _passwordController.clear();
    }
    // else {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: const Text('Periksa input Anda'),
    //         content: const Text('Email atau password tidak valid!'),
    //         backgroundColor: Colors.orange,
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: const Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      //Akan muncul apabila posisi panel telah digeser setidaknya 20%
      visible: widget.posisiPanel >= 0.5,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'SIGN UP',
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        label: Text('Full Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Name cannot be empty!';
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email cannot be empty!';
                        } else if (value.length < 6) {
                          return 'Email must be at least 6 characters!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Password cannot be empty!';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: handleSubmit,
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Have an account?'),
                          TextButton(
                            onPressed: widget.onSignInPressed,
                            style: TextButton.styleFrom(
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.only(
                                left: 0,
                              ),
                            ),
                            child: const Text('Sign In'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
