import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20), // Jarak atas antara banner dan atas layar
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/banner.jpg',
                    width: 380,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                // Container sebagai latar belakang hitam dengan tingkat opacity
                Container(
                  width: 380,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Positioned(
                  top: 90, // Memberikan jarak atas selimut hitam
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Welcome to Home Page',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Jarak atas antara teks "Selected Project" dan banner
            const Padding(
              padding: EdgeInsets.only(left: 16.0), // Memberikan jarak kiri
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Selected Project',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10), // Jarak atas antara teks deskripsi dan teks "Selected Project"
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10), // Jarak atas antara teks "Web Design" dan teks "Lorem ipsum"
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white, // Warna background container
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Warna shadow dengan opacity
                    blurRadius: 5,
                    spreadRadius: 2, // Menyebarkan shadow sedikit di luar
                    offset: const Offset(0, 4), // Geser shadow sedikit ke bawah
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Web Design',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'See More',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white, // Warna background container
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Warna shadow dengan opacity
                    blurRadius: 5,
                    spreadRadius: 2, // Menyebarkan shadow sedikit di luar
                    offset: const Offset(0, 4), // Geser shadow sedikit ke bawah
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'App Design',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'See More',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            const SizedBox(height: 20), // Jarak atas untuk konten tambahan
          ],
        ),
      ),
    );
  }
}
