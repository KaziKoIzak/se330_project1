import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se330_project1/widgets/charcutterie_menu.dart';
import 'about_us_screen.dart';
import 'checkout_screen.dart';
import 'rooms_screen.dart';
import 'wine_menu.dart';
import 'banner.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

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
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Menu',
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
                  ],
                )),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'View our fabulous Wine and Charcutterie options by choosing an option below.',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
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
                              builder: (context) => const WineMenu()),
                        );
                      },
                      child: Column(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Wine',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/901.jpg',
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
                              builder: (context) => const CharcutterieMenu()),
                        );
                      },
                      child: Column(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Charcuterie Boards',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/568.jpg',
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
