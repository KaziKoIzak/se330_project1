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

class WhiteWineScreen extends StatelessWidget {
  const WhiteWineScreen({Key? key}) : super(key: key);

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
                    'assets/images/679.jpg', // Replace with your left image asset
                    width: 200.0, // Adjust width as needed
                    height: 250.0, // Adjust height as needed
                  ),
                ), // Adjust spacing between images
                Expanded(
                  child: Center(
                    child: Text(
                      'White Wines',
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
                    'assets/images/679.jpg', // Replace with your right image asset
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
                                'Chardonay',
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
                            
                            // String 'Chardonay' = selectedWine;
                            // WineDetails currentWineDetails =
                            //   wineDetailsMap['Chardonay']!;

                            //   selectedItemsProvider.addItem(Item(
                            //     itemType: ItemType.wine,
                            //     name: 'Chardonay',
                            //     quantity: 1,
                            //     price: currentWineDetails.price,
                            //   ));
                            },
                            child: const Text('Add To Checkout'),
                          ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/905.jpg',
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
                                'Pinot Grigio',
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
                            
                            // String 'Pinot Grigio' = selectedWine;
                            // WineDetails currentWineDetails =
                            //   wineDetailsMap['Pinot Grigio']!;

                            //   selectedItemsProvider.addItem(Item(
                            //     itemType: ItemType.wine,
                            //     name: 'Pinot Grigio',
                            //     quantity: 1,
                            //     price: currentWineDetails.price,
                            //  ));
                            },
                            child: const Text('Add To Checkout'),
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
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: Column(
                        children: [
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Sauvignon Blanc',
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
                            
                            // String 'Sauvignon Blancé ' = selectedWine;
                            // WineDetails currentWineDetails =
                            //   wineDetailsMap['Sauvignon Blanc ']!;

                            //   selectedItemsProvider.addItem(Item(
                            //     itemType: ItemType.wine,
                            //     name: 'Sauvignon Blanc ',
                            //     quantity: 1,
                            //     price: currentWineDetails.price,
                             // ));
                            },
                            child: const Text('Add To Checkout'),
                          ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/906.jpg',
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
