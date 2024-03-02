import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'aboutUsScreen.dart';
import 'contactScreen.dart';
import 'menuScreen.dart';
import 'banner.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key}) : super(key: key);

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // First Image
              Image.asset(
                'assets/images/235.jpg',
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
                            fontSize: 48, // Adjust the font size as needed
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
                          fontFamily: 'Helvetica', // Specify Helvetica font
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ), // Adjust the font weight), // Adjust the font size as needed
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              // Second Image
              Image.asset(
                'assets/images/235.jpg',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              // 1. Image
              Image.asset(
                'assets/images/457.jpg',
                height: 450, // Adjust the height as needed
                width: 450, // Adjust the width as needed
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
                            // Dropdown options go here
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'Option 1',
                                child: Text('Option 1'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Option 2',
                                child: Text('Option 2'),
                              ),
                              // Add more items as needed
                            ],
                            onChanged: (value) {
                              // Handle dropdown value change
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
                      const SizedBox(
                          height: 16), // Add spacing between the two components
                      // Text
                      const Text(
                        'Step into our charming room at Rhapsody in Rose, where comfort meets class in the most welcoming way. Nestled with two cozy chairs and shelves stacked with an array of wines, this space is like a warm hug for good times. It'
                        's the perfect spot for a laid-back gathering or a catch-up session with friends—no wine expertise required, just a good sense of humor and a love for relaxed conversations. Imagine settling into those comfy chairs with a glass of your favorite red or white, sharing stories, and creating memories. Whether it'
                        's a small reunion or a low-key celebration, this room sets the stage for an inviting and easygoing event, tailor-made for middle-aged and older folks who appreciate the finer things in life without the fuss. Cheers to good company and great wine in a room that feels just like home.',
                        style: TextStyle(
                          fontSize: 18, // Adjust the font size as needed
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
    );
  }
}
