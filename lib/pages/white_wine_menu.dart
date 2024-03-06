import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checkout_screen.dart';
import 'menu_screen.dart';
import 'rooms_screen.dart';
import '../widgets/banner.dart';
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
                    'assets/images/679.jpg',
                    width: 200.0,
                    height: 250.0,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'White Wines',
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
                    'assets/images/679.jpg',
                    width: 200.0,
                    height: 250.0,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
              height: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: buildWineColumn(
                      'Chardonnay',
                      'assets/images/905.jpg',
                      845.23,
                      context,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: buildWineColumn(
                      'Pinot Grigio',
                      'assets/images/679.jpg',
                      123.23,
                      context,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: buildWineColumn(
                      'Sauvignon Blanc',
                      'assets/images/906.jpg',
                      234.45,
                      context,
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

  // Helper method to build each wine column
  Widget buildWineColumn(String wineName, String imagePath, double priceHeight,
      BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // When the button is pressed, add the wine item to selectedItems
            Provider.of<SelectedItemsProvider>(context, listen: false).addItem(
              Item(
                  itemType: ItemType.wine,
                  name: wineName,
                  quantity: 1,
                  price: priceHeight // Set the price for the wine item,
                  ),
            );
          },
          child: Text(
            'Select $wineName',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              wineName,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            imagePath,
            width: 250,
            height: 250,
          ),
        ),
      ],
    );
  }
}
