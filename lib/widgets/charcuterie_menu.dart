import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checkout_screen.dart';
import 'menu_screen.dart';
import 'rooms_screen.dart';
import 'about_us_screen.dart';
import 'banner.dart';

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
    ),
    'Vegetarian': BoardDetails(
      image: 'assets/images/890.jpg',
      paragraph:
          'Our year-round vegetarian board includes our Pimento Cheese Dip, Carmalized Onion Dip, Marinated Feta, Artichokes, Mushrooms, Olives, Chickpeas, Fig Jam, Carrots, Cucumbers, Radishes, Bell Peppers, Cherry Tomatoes, Brie, Cheddar, Manchego, Rosemary Crackers, and Almonds.',
    ),
    'Fruit': BoardDetails(
      image: 'assets/images/234.jpg',
      paragraph:
          'Our seasonal fruit board includes our Chocolate-Cream Cheese Dip, Rasperry Yogurt Dip, Cantaloupe, Kiwi, Grapes, Watermelon Slices, Orange Slices, Strawberries, Blueberries, Blackberries, Brie, Manchego, and Honey.',
    ),
    'Limited': BoardDetails(
      image: 'assets/images/891.jpg',
      paragraph:
          'Our current limited time board is named "Taco Tuesday" which includes our Fresh Corn Salsa, Seasoned Ground Beef, Refried Black Beans, Mild Salsa, Verde Salsa, Pickled Jalapenos, Iceberg Lettuce, Creme de Fresca, Radishes, and Cilantro. The board also includes both Hard Taco Shells and Soft Flour Tortillas.',
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
                      'assets/images/568.jpg', // Replace with your left image asset
                      width: 200.0, // Adjust width as needed
                      height: 250.0, // Adjust height as needed
                    ),
                  ), // Adjust spacing between images
                  Expanded(
                    child: Center(
                      child: Text(
                        'Our Charcuterie Boards',
                        style: GoogleFonts.pacifico(
                          textStyle: const TextStyle(
                            fontSize: 50, // Set the font size as needed
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
                      'assets/images/568.jpg', // Replace with your right image asset
                      width: 200.0, // Adjust width as needed
                      height: 250.0, // Adjust height as needed
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
                      'We rotate our self-crafted charcutterie boards ',
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
                // 1. Image
                Image.asset(
                  boardDetailsMap[selectedBoard]!.image,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                // 2. Collection of Things
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Component (Top)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Dropdown Box
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
                          ],
                        ),
                        // Second Component (Bottom)
                        const SizedBox(height: 16),
                        // Text
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

  BoardDetails({
    required this.image,
    required this.paragraph,
  });
}
