import 'package:flutter/material.dart';
import './widgets/banner.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(), // Use the CustomAppBar widget
        body: const Center(
          child: Text('Your main content goes here'),
        ),
      ),
    );
  }
}
