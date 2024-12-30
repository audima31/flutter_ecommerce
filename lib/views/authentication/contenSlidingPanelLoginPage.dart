import 'package:ecommerce/services/authentication_firebase.dart';
import 'package:flutter/material.dart';

class ContentSlidingPanelLoginPage extends StatefulWidget {
  const ContentSlidingPanelLoginPage({
    super.key,
    required this.posisiPanel,
    required this.onSignUpPressed,
  });

  final double posisiPanel;

  //Untuk memanggil fuction_onSignUpPressed pada LoginPage(), dan nanti akan nmengembalikan nilai varialble signUp menjadi true
  final VoidCallback onSignUpPressed;

  @override
  State<ContentSlidingPanelLoginPage> createState() =>
      _ContentslidingPanelLoginPageState();
}

class _ContentslidingPanelLoginPageState
    extends State<ContentSlidingPanelLoginPage> {
  //Global key untuk form
  final _formKey = GlobalKey<FormState>();

  //Text editing controller untuk form input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Variable untuk menyimpan data form
  String _setStateEmail = '';
  String _setStatePassword = '';
  bool isLoading = false;

  /// Fungsi untuk menangani submit form, jika form valid maka
  /// akan menyimpan data input ke dalam variabel `_setStateEmail` dan `_setStatePassword`,
  /// lalu menghapus inputan dari form. Jika form tidak valid maka
  /// akan menampilkan dialog pesan kesalahan.
  void handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _setStateEmail = _emailController.text.trim();
        _setStatePassword = _passwordController.text.trim();
        isLoading = true;
      });

      await AuthenticationFirebaseService().signIn(
        email: _setStateEmail,
        password: _setStatePassword,
        context: context,
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      //Akan muncul apabila posisi panel telah digeser setidaknya 20%
      visible: widget.posisiPanel >= 0.5,
      child: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.1),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'okta',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'S',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    TextSpan(
                      text: 'hoes',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                            return 'Email tidak boleh kosong!';
                          } else if (value.length < 6) {
                            return 'Email tidak boleh kurang dari 6 karakter!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: constraints.maxHeight * 0.04),
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
                            return 'Password tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: constraints.maxHeight * 0.01),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color.fromARGB(210, 196, 128, 27),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: isLoading ? null : handleSignIn,
                          style: FilledButton.styleFrom(
                              backgroundColor:
                                  isLoading ? Colors.grey : Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: const Text(
                            'LOGIN',
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
                            const Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: widget.onSignUpPressed,
                              style: TextButton.styleFrom(
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.only(
                                  left: 0,
                                ),
                              ),
                              child: const Text('Sign Up'),
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
        );
      }),
    );
  }
}
