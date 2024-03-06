import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se330_project1/widgets/red_wine_menu.dart';
import 'package:se330_project1/widgets/white_wine_menu.dart';
import 'about_us_screen.dart';
import 'menu_screen.dart';
import 'checkout_screen.dart';
import 'rooms_screen.dart';
import 'banner.dart';

class WineMenu extends StatelessWidget {
  const WineMenu({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/346.jpg', // Replace with your left image asset
                      width: 200.0, // Adjust width as needed
                      height: 250.0, // Adjust height as needed
                    ),
                  ), // Adjust spacing between images
                  Expanded(
                    child: Center(
                      child: Text(
                        'Our Wines',
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
                      'assets/images/346.jpg', // Replace with your right image asset
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
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                height: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        side: const BorderSide(width: 2, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RedWineScreen()),
                        );
                      },
                      child: Column(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Red Wine',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/567.jpg',
                              width: 250,
                              height: 250,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        side: const BorderSide(width: 2, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WhiteWineScreen()),
                        );
                      },
                      child: Column(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                'White Wine',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/679.jpg',
                              width: 250,
                              height: 250,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
