import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 130),
            Center(
              child: Text(
                'About Me',
                style: TextStyle(
                  fontSize: 18, // Ganti ukuran teks sesuai kebutuhan
                  fontWeight: FontWeight.bold, // Ganti gaya sesuai kebutuhan
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor tellus non odio dictum, ac cursus nisl rhoncus. Sed congue tellus sed arcu lacinia, eget tristique elit congue. Nulla facilisi. Vivamus vel lectus nec dui bibendum tincidunt. Donec sit amet odio vel eros vestibulum ultrices. Praesent vel dolor at turpis aliquam pharetra. Morbi ut dapibus elit. Fusce vel fermentum turpis. Nam nec nulla suscipit, vehicula erat sit amet, sollicitudin ante. ',
                softWrap: true,
              ),
            )
          ]
        )
      )
    );
  }
}

