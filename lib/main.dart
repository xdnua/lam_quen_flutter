import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/page1/bai_tap_page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Làm Quen Flutter',
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
