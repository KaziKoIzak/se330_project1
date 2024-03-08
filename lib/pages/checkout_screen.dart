import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_us_screen.dart';
import 'menu_screen.dart';
import 'rooms_screen.dart';
import '../widgets/done_screen.dart';
import '../widgets/banner.dart';
import 'package:provider/provider.dart';
import '../data/selected_items_provider.dart';
import '../data/items.dart';

// Define a model class for the user details
class UserDetails {
  String firstName = '';
  String lastName = '';
  String billingAddress = '';
  String email = '';
  String cardNumber = '';
  String phoneNumber = '';
  String cvv = '';
  String expirationDate = '';
  String comments = '';
}

class DiscountCheckbox extends StatefulWidget {
  final String label;
  final void Function(bool?) onChanged;

  const DiscountCheckbox({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  _DiscountCheckboxState createState() => _DiscountCheckboxState();
}

class _DiscountCheckboxState extends State<DiscountCheckbox> {
  bool isChecked = false;

  // Create a GlobalKey for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Create an instance of the UserDetails class
  UserDetails userDetails = UserDetails();

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
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<double> discounts = [0.0, 0.0, 0.0, 0.0]; // Initial discounts
  bool hasHiddenDiscount = false;

  // Create a GlobalKey for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Create an instance of the UserDetails class
  UserDetails userDetails = UserDetails();

  Future<void> _showConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Submission'),
          content: const Text('Are you sure you want to submit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // If 'Cancel' is pressed, close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // If 'Submit' is pressed, close the dialog and navigate to DoneScreen
                Navigator.of(context).pop();
                _submitForm();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _submitForm() {
    // Validate the form before submission
    if (_formKey.currentState?.validate() ?? false) {
      _checkHiddenDiscounts();

      // Save form data or perform other actions before navigating to DoneScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DoneScreen()),
      );
    }
  }

  void _checkHiddenDiscounts() {
    // Check for hidden discounts based on selected items
    final selectedItemsProvider =
        Provider.of<SelectedItemsProvider>(context, listen: false);

    // Check for four wines, three rooms, and two Charcuterie boards
    int wineCount = selectedItemsProvider.selectedItems
        .where((item) => item.itemType == ItemType.wine)
        .length;
    int roomCount = selectedItemsProvider.selectedItems
        .where((item) => item.itemType == ItemType.room)
        .length;
    int charcuterieCount = selectedItemsProvider.selectedItems
        .where((item) => item.itemType == ItemType.charcuterie)
        .length;

    hasHiddenDiscount = false;

    if (wineCount == 4) {
      // Apply 10% hidden discount for four wines
      hasHiddenDiscount = true;
      discounts[0] += 0.1;
    } else if (roomCount == 3) {
      // Apply 20% hidden discount for three rooms
      hasHiddenDiscount = true;
      discounts[1] += 0.2;
    } else if (charcuterieCount == 2) {
      // Apply 30% hidden discount for two Charcuterie boards
      hasHiddenDiscount = true;
      discounts[2] += 0.3;
    }
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
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

// Calculate total price with updated quantities
                          double totalPrice = selectedItemsProvider
                              .selectedItems
                              .map((item) => item.price * item.quantity)
                              .reduce((value, element) => value + element);

                          // Apply discounts
                          double discountedTotal = totalPrice -
                              (totalPrice * discounts.reduce((a, b) => a + b));

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // List of Checked-Out Items with Bigger Font
                              Expanded(
                                  child: // Inside your CheckoutScreen class
                                      ListView.builder(
                                itemCount:
                                    selectedItemsProvider.selectedItems.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final selectedItem = selectedItemsProvider
                                      .selectedItems[index];

                                  // Define a TextStyle variable
                                  TextStyle itemTextStyle;

                                  // Conditionally set the text style based on itemType
                                  switch (selectedItem.itemType) {
                                    case ItemType.charcuterie:
                                    case ItemType.wine:
                                      // Use a smaller font size and not bold for Charcuterie and Wine
                                      itemTextStyle = const TextStyle(
                                        fontSize: 18,
                                      );
                                      break;
                                    default:
                                      // Use the default style (bold and larger font size) for other items
                                      itemTextStyle = const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      );
                                      break;
                                  }

                                  return ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedItem.name,
                                          style:
                                              itemTextStyle, // Apply the defined text style
                                        ),
                                        Text(
                                          "${selectedItem.quantity}",
                                          style:
                                              itemTextStyle, // Apply the defined text style
                                        ),
                                        Text(
                                          '\$${selectedItem.price.toStringAsFixed(2)}',
                                          style:
                                              itemTextStyle, // Apply the defined text style
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.remove_circle),
                                          onPressed: () {
                                            setState(() {
                                              if (selectedItem.quantity > 1) {
                                                selectedItem.quantity -= 1;
                                              } else {
                                                selectedItemsProvider
                                                    .removeItem(selectedItem);
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),

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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // First Row
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('First Name'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'First Name is required';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        userDetails.firstName = value ?? '';
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('Last Name'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Last Name is required';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        userDetails.lastName = value ?? '';
                                      },
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
                                    const Text('Billing Address'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Billing Address is required';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        userDetails.billingAddress =
                                            value ?? '';
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('Email'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Email is required';
                                        } else if (!RegExp(
                                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                            .hasMatch(value)) {
                                          return 'Enter a valid email address';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        userDetails.email = value ?? '';
                                      },
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
                                    const Text('Card Number'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Card Number is required';
                                        } else if (!RegExp(r'^(\d{4}[\s]?){4}$')
                                            .hasMatch(value)) {
                                          return 'Card Number must contain exactly 16 numbers with spaces between each four numbers';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        // Remove spaces from the card number before saving
                                        userDetails.cardNumber =
                                            value?.replaceAll(' ', '') ?? '';
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('Phone Number'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Phone Number is required';
                                        } else if (!RegExp(r'^\+?[0-9]+$')
                                            .hasMatch(value)) {
                                          return 'Enter a valid phone number';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        userDetails.phoneNumber = value ?? '';
                                      },
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
                                    const Text('CVV'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'CVV is required';
                                        } else if (!RegExp(r'^[0-9]{3}$')
                                            .hasMatch(value)) {
                                          return 'CVV must contain exactly 3 numbers';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        userDetails.cvv = value ?? '';
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('Expiration Date'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Expiration Date is required';
                                        } else if (!RegExp(
                                                r'^(0[1-9]|1[0-2])\/[0-9]{4}$')
                                            .hasMatch(value)) {
                                          return 'Enter a valid expiration date in mm/yyyy format';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        userDetails.expirationDate =
                                            value ?? '';
                                      },
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
                                    const Text('Comments'),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      // Comments are not required
                                      onSaved: (value) {
                                        userDetails.comments = value ?? '';
                                      },
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
                    const Spacer(), // Add a spacer to push the submit button to the right
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Show the confirmation dialog when the button is pressed
                          _showConfirmationDialog();
                        },
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
