// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PortfolioScreen(); // Gunakan PortfolioScreen sebagai halaman Profile
  }
}

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/portoImage.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Tek Kheng',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Student | Universitas Esa Unggul'),
            SizedBox(height: 20),
            Text('Pendidikan : Bachelor\`s  degree')
          ],
        ),
      ),
    );
  }
}
