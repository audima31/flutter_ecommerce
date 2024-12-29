import 'package:ecommerce/services/authentication_firebase.dart';
import 'package:ecommerce/views/authentication/login.dart';
import 'package:ecommerce/views/profile/card_menus_setting.dart';
import 'package:ecommerce/views/profile/list_settings.dart';
import 'package:ecommerce/views/profile/navbarProfile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Column(
              children: [
                const NavbarProfile(),
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
                    await AuthServiceFunctions().signOut(context: context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    overlayColor: Colors.grey.withOpacity(0.5),
                    shadowColor: Colors.orange.withOpacity(0.5),
                    backgroundColor: const Color.fromARGB(255, 46, 47, 48),
                    minimumSize: const Size(double.infinity, 36),
                    elevation: 6,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.013),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
