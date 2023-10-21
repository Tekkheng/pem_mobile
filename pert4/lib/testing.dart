import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Universitas Esa Unggul',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Tangerang, Indonesia',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.blue[800],
          ),
          const Text('4.5'),
        ],
      ),
    );

    return const MaterialApp(
      title: "Pertemuan 4",
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  // _MainScreenState createState() => _MainScreenState();

  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: MyBody(),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text('Pertemuan ke 4')),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor; // Define the color variable
    return Column(
      children: [
        ClipRRect(
          child: Image.asset(
            'assets/images/esaunggul.jpg',
            alignment: Alignment.center,
            height: 200,
            width: 800,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: const Text('Universitas Esa Unggul'),
        ),
        
        const Text('Tangerang, Indonesia',style: TextStyle(color: Colors.blueAccent),textAlign: TextAlign.left),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButtonColumn(color, Icons.call, 'CALL'),
            _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
            _buildButtonColumn(color, Icons.share, 'SHARE'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Back'),
          ),
        ),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
