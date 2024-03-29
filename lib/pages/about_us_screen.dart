import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checkout_screen.dart';
import 'menu_screen.dart';
import 'rooms_screen.dart';
import '../widgets/banner.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/235.jpg', // Replace with your left image asset
                        width: 200.0, // Adjust width as needed
                        height: 250.0, // Adjust height as needed
                      ),
                    ), // Adjust spacing between images
                    Expanded(
                      child: Center(
                        child: Text(
                          'About Us',
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
                        'assets/images/235.jpg', // Replace with your right image asset
                        width: 200.0, // Adjust width as needed
                        height: 250.0, // Adjust height as needed
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  height: 250,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/345.jpg', // Replace with your left image asset
                        width: 350.0, // Adjust width as needed
                        height: 300.0, // Adjust height as needed
                      ),
                      const SizedBox(
                          width:
                              8.0), // Adjust spacing between image and sentences
                      const Expanded(
                        child: Text(
                          'Here at Rhapsody in Rose, we are dedicated to provide our patrons with the the best gathering space in town. The way we do it is simple: great wine, great food, and even greater people!',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
