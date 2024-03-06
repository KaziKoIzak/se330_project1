import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checkout_screen.dart';
import 'menu_screen.dart';
import 'rooms_screen.dart';
import 'banner.dart';
import 'package:provider/provider.dart';
import '../data/selected_items_provider.dart';
import '../data/items.dart';

class CharcutterieMenu extends StatefulWidget {
  const CharcutterieMenu({Key? key}) : super(key: key);

  @override
  _CharcutterieScreenState createState() => _CharcutterieScreenState();
}

class _CharcutterieScreenState extends State<CharcutterieMenu> {
  String selectedBoard = 'Classic';

  Map<String, BoardDetails> boardDetailsMap = {
    'Classic': BoardDetails(
      image: 'assets/images/568.jpg',
      paragraph:
          'Our year-round classic board includes our selections of Salami, Smoked Ham, Sliced Baguettes, Various Crackers, Bread Sticks, Buffalo Pimento Cheese, Pecans, and Assortments of Olives, Pickles and Jams.',
      price: 100.0, // Set the price for Classic board
    ),
    'Vegetarian': BoardDetails(
      image: 'assets/images/890.jpg',
      paragraph:
          'Our year-round vegetarian board includes our Pimento Cheese Dip, Carmalized Onion Dip, Marinated Feta, Artichokes, Mushrooms, Olives, Chickpeas, Fig Jam, Carrots, Cucumbers, Radishes, Bell Peppers, Cherry Tomatoes, Brie, Cheddar, Manchego, Rosemary Crackers, and Almonds.',
      price: 75.0, // Set the price for Vegetarian board
    ),
    'Fruit': BoardDetails(
      image: 'assets/images/234.jpg',
      paragraph:
          'Our seasonal fruit board includes our Chocolate-Cream Cheese Dip, Rasperry Yogurt Dip, Cantaloupe, Kiwi, Grapes, Watermelon Slices, Orange Slices, Strawberries, Blueberries, Blackberries, Brie, Manchego, and Honey.',
      price: 50.0, // Set the price for Fruit board
    ),
    'Limited': BoardDetails(
      image: 'assets/images/891.jpg',
      paragraph:
          'Our current limited time board is named "Taco Tuesday" which includes our Fresh Corn Salsa, Seasoned Ground Beef, Refried Black Beans, Mild Salsa, Verde Salsa, Pickled Jalapenos, Iceberg Lettuce, Creme de Fresca, Radishes, and Cilantro. The board also includes both Hard Taco Shells and Soft Flour Tortillas.',
      price: 25.0, // Set the price for Limited board
    ),
  };

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
                      'assets/images/568.jpg',
                      width: 200.0,
                      height: 250.0,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Our Charcuterie Boards',
                        style: GoogleFonts.pacifico(
                          textStyle: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/568.jpg',
                      width: 200.0,
                      height: 250.0,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'We rotate our self-crafted charcuterie boards ',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  boardDetailsMap[selectedBoard]!.image,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton<String>(
                              value: selectedBoard,
                              items: boardDetailsMap.keys.map((String room) {
                                return DropdownMenuItem<String>(
                                  value: room,
                                  child: Text(room),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedBoard = value!;
                                });
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Provider.of<SelectedItemsProvider>(context,
                                        listen: false)
                                    .addItem(
                                  Item(
                                    itemType: ItemType.charcuterie,
                                    name: selectedBoard,
                                    price:
                                        boardDetailsMap[selectedBoard]!.price,
                                    quantity: 1,
                                  ),
                                );
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          boardDetailsMap[selectedBoard]!.paragraph,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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

class BoardDetails {
  final String image;
  final String paragraph;
  final double price;

  BoardDetails({
    required this.image,
    required this.paragraph,
    required this.price,
  });
}
