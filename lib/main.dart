import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/aboutUsScreen.dart';
import './widgets/contactScreen.dart';
import './widgets/menuScreen.dart';
import './widgets/roomsScreen.dart';
import './widgets/banner.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onRoomsPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RoomsScreen()),
          );
        },
        onMenuPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MenuScreen()),
          );
        },
        onAboutUsPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutUsScreen()),
          );
        },
        onContactPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ContactScreen()),
          );
        },
      ),
      body: Column(
        children: [
          // Image with fixed height of 200 pixels
          Image.asset(
            'assets/images/678.jpg',
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 75),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First Image (same as the one above)
              Expanded(
                child: Image.asset(
                  'assets/images/123.jpg',
                  height: 250, // Set the height as needed
                  width: 250, // Set the width as needed
                ),
              ),
              // Text
              // Text with bold, cursive, and massive font style
              Expanded(
                child: Center(
                  child: Text(
                    'Rhapsody in Rose',
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        fontSize: 50, // Set the font size as needed
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              // Second Image (same as the one above)
              Expanded(
                child: Image.asset(
                  'assets/images/123.jpg',
                  height: 250, // Set the height as needed
                  width: 250, // Set the width as needed
                ),
              ),
            ],
          ),
          // Other content below the image
          const Center(
            child: Text('Your default screen content goes here'),
          ),
        ],
      ),
    );
  }
}
