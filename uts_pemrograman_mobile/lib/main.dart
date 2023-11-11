import 'package:flutter/material.dart';
import 'package:uts_pemrograman_mobile/handler_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Monitoring',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HandlerScreen(),
    );
  }
}