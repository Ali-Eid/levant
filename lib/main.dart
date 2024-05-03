import 'package:flutter/material.dart';
import 'package:levant/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Levant Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
