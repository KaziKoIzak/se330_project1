import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_us_screen.dart';
import 'menu_screen.dart';
import 'rooms_screen.dart';
import 'banner.dart';
import 'package:provider/provider.dart';
import '../data/selected_items_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

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
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/567.jpg',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Checkout',
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
                    'assets/images/567.jpg',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              // First Child - Large Vertical Box
              Expanded(
                child: Container(
                  height: 500,
                  margin: const EdgeInsets.only(left: 60, right: 60),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(12.0), // Border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 2.0, // Spread radius
                        blurRadius: 5.0, // Blur radius
                        offset: const Offset(0, 2), // Offset (x, y)
                      ),
                    ],
                  ),
                  child: Consumer<SelectedItemsProvider>(
                    builder: (context, selectedItemsProvider, _) {
                      // Use the selectedItemsProvider.selectedItems list
                      return ListView.builder(
                        itemCount: selectedItemsProvider.selectedItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          // Replace with your widget for each selected item
                          return ListTile(
                            title: Text(selectedItemsProvider
                                .selectedItems[index].name),
                            // Additional details or actions for each item can be added here
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              // Second Child - Column with 5 Rows
              Expanded(
                child: Column(
                  children: [
                    // First Row
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            height: 50.0,
                            // Replace with content for the first child in the first row
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.green,
                            height: 50.0,
                            // Replace with content for the second child in the first row
                          ),
                        ),
                      ],
                    ),
                    // Second Row
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.orange,
                            height: 50.0,
                            // Replace with content for the first child in the second row
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.red,
                            height: 50.0,
                            // Replace with content for the second child in the second row
                          ),
                        ),
                      ],
                    ),
                    // Third Row
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.purple,
                            height: 50.0,
                            // Replace with content for the first child in the third row
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.yellow,
                            height: 50.0,
                            // Replace with content for the second child in the third row
                          ),
                        ),
                      ],
                    ),
                    // Fourth Row
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.teal,
                            height: 50.0,
                            // Replace with content for the first child in the fourth row
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.brown,
                            height: 50.0,
                            // Replace with content for the second child in the fourth row
                          ),
                        ),
                      ],
                    ),
                    // Fifth Row (Single Child)
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey,
                            height: 50.0,
                            // Replace with content for the single child in the fifth row
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
