import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_us_screen.dart';
import 'checkout_screen.dart';
import 'menu_screen.dart';
import 'rooms_screen.dart';
import 'banner.dart';
import '../data/selected_items_provider.dart';
import '../data/items.dart';

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
          Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                height: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Expanded(
                        child: Column(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Pinot Noir',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                            onPressed: () {
                            // SelectedItemsProvider selectedItemsProvider =
                            // Provider.of<SelectedItemsProvider>(
                            //   context,
                            //   listen: false);
                            
                            // String 'Pinot Noir' = selectedWine;
                            // WineDetails currentWineDetails =
                            //   wineDetailsMap['Pinot Noir']!;

                            //   selectedItemsProvider.addItem(Item(
                            //     itemType: ItemType.wine,
                            //     name: 'Pinot Noir',
                            //     quantity: 1,
                            //     price: currentWineDetails.price,
                            //   ));
                            },
                            child: const Text('Add To Checkout'),
                          ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/902.jpg',
                              width: 250,
                              height: 250,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: Column(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Malbec',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                            onPressed: () {
                            // SelectedItemsProvider selectedItemsProvider =
                            // Provider.of<SelectedItemsProvider>(
                            //   context,
                            //   listen: false);
                            
                            // String 'Malbec' = selectedWine;
                            // WineDetails currentWineDetails =
                            //   wineDetailsMap['Malbec']!;

                            //   selectedItemsProvider.addItem(Item(
                            //     itemType: ItemType.wine,
                            //     name: 'Malbec',
                            //     quantity: 1,
                            //     price: currentWineDetails.price,
                            //  ));
                            },
                            child: const Text('Add To Checkout'),
                          ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/903.jpg',
                              width: 250,
                              height: 250,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: Column(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Provence Rosé ',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                            onPressed: () {
                            // SelectedItemsProvider selectedItemsProvider =
                            // Provider.of<SelectedItemsProvider>(
                            //   context,
                            //   listen: false);
                            
                            // String 'Provence Rosé ' = selectedWine;
                            // WineDetails currentWineDetails =
                            //   wineDetailsMap['Provence Rosé ']!;

                            //   selectedItemsProvider.addItem(Item(
                            //     itemType: ItemType.wine,
                            //     name: 'Provence Rosé ',
                            //     quantity: 1,
                            //     price: currentWineDetails.price,
                             // ));
                            },
                            child: const Text('Add To Checkout'),
                          ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/904.jpg',
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
    );
  }
}
