import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'aboutUsScreen.dart';
import 'menuScreen.dart';
import 'roomsScreen.dart';
import 'banner.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

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
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/567.jpg',
                    width: 200.0,
                    height: 250.0,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Checkout',
                      style: GoogleFonts.pacifico(
                        textStyle: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/567.jpg',
                    width: 200.0,
                    height: 250.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
