import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_us_screen.dart';
import 'menu_screen.dart';
import 'rooms_screen.dart';
import 'banner.dart';
import 'package:provider/provider.dart';
import '../data/selected_items_provider.dart';

class DiscountCheckbox extends StatefulWidget {
  final String label;
  final void Function(bool?) onChanged;

  const DiscountCheckbox({
    required this.label,
    required this.onChanged,
  });

  @override
  _DiscountCheckboxState createState() => _DiscountCheckboxState();
}

class _DiscountCheckboxState extends State<DiscountCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
              widget.onChanged(value);
            });
          },
        ),
        Text(widget.label),
      ],
    );
  }
}

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<double> discounts = [0.0, 0.0, 0.0, 0.0]; // Initial discounts

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

                        // Apply discounts
                        double discountedTotal = totalPrice -
                            (totalPrice * discounts.reduce((a, b) => a + b));

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
                                  '\$${discountedTotal.toStringAsFixed(2)}',
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
            ),
// Wrap the Row with Center
            Container(
              margin: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  DiscountCheckbox(
                    label: 'Military',
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          discounts[0] = value
                              ? 0.1
                              : 0.0; // Set your desired discount value
                        });
                      }
                    },
                  ),
                  DiscountCheckbox(
                    label: 'Senior',
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          discounts[1] = value
                              ? 0.2
                              : 0.0; // Set your desired discount value
                        });
                      }
                    },
                  ),
                  DiscountCheckbox(
                    label: 'Early Bird',
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          discounts[2] = value
                              ? 0.3
                              : 0.0; // Set your desired discount value
                        });
                      }
                    },
                  ),
                  DiscountCheckbox(
                    label: 'Student',
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          discounts[3] = value
                              ? 0.4
                              : 0.0; // Set your desired discount value
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
