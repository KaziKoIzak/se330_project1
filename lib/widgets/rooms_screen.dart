import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_us_screen.dart';
import 'contact_screen.dart';
import 'menu_screen.dart';
import 'banner.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  String selectedRoom = 'Room 1'; // Default selected room

  // Map to associate rooms with their respective images and paragraphs
  Map<String, RoomDetails> roomDetailsMap = {
    'Room 1': RoomDetails(
      image: 'assets/images/124.jpg',
      paragraph: 'Your Room 1 paragraph goes here.',
    ),
    'Room 2': RoomDetails(
      image: 'assets/images/345.jpg',
      paragraph: 'Your Room 2 paragraph goes here.',
    ),
    'Room 3': RoomDetails(
      image: 'assets/images/457.jpg',
      paragraph: 'Your Room 3 paragraph goes here.',
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
        onContactPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ContactScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // First Image
                Image.asset(
                  roomDetailsMap[selectedRoom]!.image,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                // Text
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          's room selection screen—a tableau of refined elegance...',
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
                  roomDetailsMap[selectedRoom]!.image,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                // 1. Image
                Image.asset(
                  'assets/images/457.jpg',
                  height: 450,
                  width: 450,
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
    );
  }
}

class RoomDetails {
  final String image;
  final String paragraph;

  RoomDetails({
    required this.image,
    required this.paragraph,
  });
}
