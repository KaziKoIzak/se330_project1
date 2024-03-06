import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checkout_screen.dart';
import 'menu_screen.dart';
import 'rooms_screen.dart';
import 'about_us_screen.dart';
import 'banner.dart';

class RedWineScreen extends StatelessWidget {
  const RedWineScreen({Key? key}) : super(key: key);

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
        onCheckoutPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckoutScreen()),
          );
        },
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/567.jpg', // Replace with your left image asset
                    width: 200.0, // Adjust width as needed
                    height: 250.0, // Adjust height as needed
                  ),
                ), // Adjust spacing between images
                Expanded(
                  child: Center(
                    child: Text(
                      'Red Wines',
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
                Expanded(
                  child: Image.asset(
                    'assets/images/567.jpg', // Replace with your right image asset
                    width: 200.0, // Adjust width as needed
                    height: 250.0, // Adjust height as needed
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
