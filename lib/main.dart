import 'package:flutter/material.dart';
import './widgets/banner.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rhapsody in Rose',
      home: Banners(),
    );
  }
}
