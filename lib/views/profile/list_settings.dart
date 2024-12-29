import 'package:flutter/material.dart';

class ListSettings extends StatelessWidget {
  const ListSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ListTile(
          leading: const Icon(Icons.payment_outlined),
          title: const Text('Payment confirmation'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.support_agent_outlined),
          title: const Text('Customer service'),
          onTap: () {},
        ),
        ListTile(
          leading: Image.asset(
            'assets/img/icon/insurance.png',
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          title: const Text('Privacy policy'),
          onTap: () {},
        ),
        ListTile(
          leading: Image.asset(
            'assets/img/icon/info.png',
            width: MediaQuery.of(context).size.width * 0.055,
          ),
          title: const Text('About me'),
          onTap: () {},
        ),
      ],
    );
  }
}
