import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_us_screen.dart';
import 'checkout_screen.dart';
import 'menu_screen.dart';
import 'banner.dart';
import '../data/selected_items_provider.dart';
import '../data/items.dart';

// RoomDetails class with price property
class RoomDetails {
  final String image;
  final String paragraph;
  final double price; // Add the price property

  RoomDetails({
    required this.image,
    required this.paragraph,
    required this.price,
  });
}

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  String selectedRoom = 'Room 1'; // Default selected room

  // Map to associate rooms with their respective images, paragraphs, and prices
  Map<String, RoomDetails> roomDetailsMap = {
    'Room 1': RoomDetails(
      image: 'assets/images/124.jpg',
      paragraph:
          'Step into our charming room at Rhapsody in Rose, where comfort meets class in the most welcoming way. Nestled with two cozy chairs and shelves stacked with an array of wines, this space is like a warm hug for good times. It'
          's the perfect spot for a laid-back gathering or a catch-up session with friends—no wine expertise required, just a good sense of humor and a love for relaxed conversations. Imagine settling into those comfy chairs with a glass of your favorite red or white, sharing stories, and creating memories. Whether it'
          's a small reunion or a low-key celebration, this room sets the stage for an inviting and easygoing event, tailor-made for middle-aged and older folks who appreciate the finer things in life without the fuss. Cheers to good company and great wine in a room that feels just like home.',
      price: 150.25, // Add the price for Room 1
    ),
    'Room 2': RoomDetails(
      image: 'assets/images/345.jpg',
      paragraph:
          'Step into the heart of conviviality at Rhapsody in Rose, where our inviting room beckons with four chairs gathered around a table, forming a haven for shared moments and laughter. The atmosphere is one of warmth and camaraderie, perfect for gatherings with friends or family. Surrounding the room, wine cabinets stand as guardians of an extensive selection, offering a variety that caters to every palate. The charm lies in the accessibility; this space is a celebration of simplicity and shared joy. It'
          's not just a room; it'
          's an invitation to unwind, connect, and savor the simple pleasures of life. Whether it'
          's a casual evening with friends or a family get-together, the appeal of this room lies in its ability to foster connection and create lasting memories, making it a favorite among consumers seeking a genuine and delightful experience.',
      price: 250.50, // Add the price for Room 2
    ),
    'Room 3': RoomDetails(
      image: 'assets/images/457.jpg',
      paragraph:
          'Discover the cozy embrace of our two-seated room at Rhapsody in Rose, where the charm of natural wood accents creates an inviting ambiance. The room features two comfortable chairs nestled around a table, set against a backdrop of warm, wooden tones that evoke a sense of homely comfort. Surrounded by wine cabinets showcasing a curated selection, this space is an intimate retreat for couples or close friends looking to share a quiet moment. The natural elements bring a touch of rustic elegance, making it a favorite for those who appreciate the authenticity of materials and the soothing presence of nature. It'
          's the ideal spot for a romantic date night or a close-knit conversation, providing a cozy escape that feels both intimate and welcoming. In this room, the allure lies in the simplicity of design and the warmth of natural wood, creating a haven for connection and relaxation.',
      price: 350.75, // Add the price for Room 3
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
        onCheckoutPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckoutScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // First Image
                  Image.asset(
                    'assets/images/123.jpg',
                    height: 175,
                    width: 175,
                    fit: BoxFit.cover,
                  ),
                  // Text
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Header Text
                          Text(
                            'Room Selections',
                            style: GoogleFonts.pacifico(
                              textStyle: const TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Caption Text
                          const Text(
                            'Step into the captivating world of Rhapsody in Rose'
                            's room selection screen—a tableau of refined elegance. Our curated spaces are an ode to indulgence, adorned in the soft hues of rose-inspired decor and bathed in inviting light. Whether for an intimate rendezvous or a lavish celebration, each room is a testament to the perfect blend of sophistication and comfort, ensuring an unforgettable experience at our wine and charcuterie haven. Choose your haven and let the enchantment begin.',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Second Image
                  Image.asset(
                    'assets/images/123.jpg',
                    height: 175,
                    width: 175,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // 1. Image
                  Image.asset(
                    roomDetailsMap[selectedRoom]!.image,
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
                                value: selectedRoom,
                                items: roomDetailsMap.keys.map((String room) {
                                  return DropdownMenuItem<String>(
                                    value: room,
                                    child: Text(room),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedRoom = value!;
                                  });
                                },
                              ),
                              // Submit Button
                              ElevatedButton(
                                onPressed: () {
                                  // Handle submit button press
                                  // Get the SelectedItemsProvider
                                  SelectedItemsProvider selectedItemsProvider =
                                      Provider.of<SelectedItemsProvider>(
                                          context,
                                          listen: false);

                                  // Determine the current room based on the selectedRoom
                                  String currentRoom = selectedRoom;

                                  // Add the selected item to the provider
                                  selectedItemsProvider.addItem(Item(
                                    itemType: ItemType.room,
                                    name: currentRoom,
                                    quantity:
                                        1, // You can adjust the quantity as needed
                                    price:
                                        2554.123, // Replace with the actual price
                                  ));
                                },
                                child: const Text('Submit'),
                              ),
                            ],
                          ),
                          // Second Component (Bottom)
                          const SizedBox(height: 16),
                          // Text
                          Text(
                            roomDetailsMap[selectedRoom]!.paragraph,
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
      ),
    );
  }
}
