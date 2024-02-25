import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 119, 196),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ), // Set icon color to white
          title: Row(
            children: [
              // Left side - Four equally spaced out Texts
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Rooms',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Menu',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'About Us',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Contact',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),

              // Middle - Title (Centered)
              const Expanded(
                child: Center(
                  child: Text(
                    'Rhapsody in Rose',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              // Right side - Search bar with min and max size
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100, // Adjust the minimum width as needed
                  maxWidth: 200, // Adjust the maximum width as needed
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
            ],
          ),
          elevation: 4, // Set the elevation to control the shadow depth
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10), // Adjust the border radius as needed
            ),
          ),
          shadowColor: Colors.grey[400], // Set the shadow color
        ),
      ),
    );
  }
}
