import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/about_us_screen.dart';
import 'widgets/checkout_screen.dart';
import 'widgets/menu_screen.dart';
import 'widgets/rooms_screen.dart';
import './widgets/banner.dart';
import 'data/selected_items_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SelectedItemsProvider(),
      child: const MyApp(),
    ),
  );
}

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
        onCheckoutPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckoutScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image with fixed height of 200 pixels
            Image.asset(
              'assets/images/678.jpg',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 50),

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

            const SizedBox(height: 50),
            // Centered Text with "How may we help you?" in a large font
            const Center(
              child: Text(
                'How may we help you?',
                style: TextStyle(
                  fontSize: 36, // Set the font size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Row with four styled square buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RoomsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 210, 251),
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ).copyWith(
                      fixedSize:
                          MaterialStateProperty.all(const Size(150, 50))),
                  child: const Text(
                    'Rooms',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 210, 251),
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ).copyWith(
                      fixedSize:
                          MaterialStateProperty.all(const Size(150, 50))),
                  child: const Text(
                    'Menu',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutUsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 210, 251),
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ).copyWith(
                      fixedSize:
                          MaterialStateProperty.all(const Size(150, 50))),
                  child: const Text(
                    'About Us',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckoutScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 210, 251),
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ).copyWith(
                      fixedSize:
                          MaterialStateProperty.all(const Size(150, 50))),
                  child: const Text(
                    'Contact',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
