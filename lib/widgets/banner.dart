import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left items
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      // Handle home button press
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.mail),
                    onPressed: () {
                      // Handle mail button press
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notifications button press
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      // Handle menu button press
                    },
                  ),
                ],
              ),

              // Title in the middle
              Text(
                'Rhapsody in Rose',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),

              // Right items
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Handle search button press
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('Your App Body'),
        ),
      ),
    );
  }
}
