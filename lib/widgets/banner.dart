import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 119, 196),
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        children: [
          // Your app bar content goes here
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Rooms', style: TextStyle(fontSize: 12)),
                Text('Menu', style: TextStyle(fontSize: 12)),
                Text('About Us', style: TextStyle(fontSize: 12)),
                Text('Contact', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Rhapsody in Rose', style: TextStyle(fontSize: 18)),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 100,
              maxWidth: 200,
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
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      shadowColor: Colors.grey[400],
    );
  }
}
