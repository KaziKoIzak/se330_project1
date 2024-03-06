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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    width: 300,
                    margin: const EdgeInsets.only(left: 60, right: 60),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Consumer<SelectedItemsProvider>(
                      builder: (context, selectedItemsProvider, _) {
                        if (selectedItemsProvider.selectedItems.isEmpty) {
                          // If no items are selected, display a message or any desired content
                          return const Center(
                            child: Text(
                              'No Room Selected',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }

                        // Calculate total price
                        double totalPrice = selectedItemsProvider.selectedItems
                            .map((item) => item.price)
                            .reduce((value, element) => value + element);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // List of Checked-Out Items with Bigger Font
                            Expanded(
                              child: ListView.builder(
                                itemCount:
                                    selectedItemsProvider.selectedItems.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final selectedItem = selectedItemsProvider
                                      .selectedItems[index];

                                  return ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedItem.name,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$${selectedItem.price.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Additional details or actions for each item can be added here
                                  );
                                },
                              ),
                            ),

                            // Total Price at Bottom Right
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'Total:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$${totalPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                // Second Child - Column with 5 Rows
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // First Row
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text('First Name'),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Last Name'),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Second Row
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Billing Address'),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Email'),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Third Row
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Card Number'),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Phone Number'),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Fourth Row
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text('CVV'),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Expiration Date'),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Fifth Row
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Comments'),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
