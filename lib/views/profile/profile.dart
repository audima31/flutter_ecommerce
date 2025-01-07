import 'package:ecommerce/models/authentication.dart';
import 'package:ecommerce/services/auth_service.dart';
import 'package:ecommerce/services/auth_store.dart';
import 'package:ecommerce/views/authentication/login.dart';
import 'package:ecommerce/views/profile/card_menus_setting.dart';
import 'package:ecommerce/views/profile/list_settings.dart';
import 'package:ecommerce/views/profile/navbarProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<void> _futureFetchData;

  @override
  void initState() {
    super.initState();
    _futureFetchData = _fetchData();
  }

  Future<void> _fetchData() async {
    final authStoreProvider =
        Provider.of<AuthStoreProvider>(context, listen: false);
    await authStoreProvider.fecthDataUser();
    print('Masuk View Profile ${authStoreProvider.user?.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 4,
          shadowColor: Colors.grey,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: FutureBuilder<void>(
            future: _futureFetchData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Tampilkan loading indicator saat menunggu data
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Tampilkan pesan error jika terjadi kesalahan
                return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'));
              }

              // Jika data berhasil dimuat, tampilkan halaman
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: Column(
                    children: [
                      Consumer<AuthStoreProvider>(
                          builder: (context, authStoreProvider, child) {
                        return NavbarProfile(
                          name: authStoreProvider.user?.name ?? 'Guest',
                        );
                      }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const CardMenusSetting(),
                      const ListSettings(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await AuthenticationFirebaseService()
                              .signOut(context: context);
                        },
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.013),
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
