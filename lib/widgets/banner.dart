import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onRoomsPressed;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onAboutUsPressed;
  final VoidCallback? onCheckoutPressed;

  const CustomAppBar({
    Key? key,
    this.onRoomsPressed,
    this.onMenuPressed,
    this.onAboutUsPressed,
    this.onCheckoutPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 182, 223),
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        children: [
          // Your app bar content goes here
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: onRoomsPressed,
                  child: const Text('Rooms', style: TextStyle(fontSize: 22)),
                ),
                TextButton(
                  onPressed: onMenuPressed,
                  child: const Text('Menu', style: TextStyle(fontSize: 22)),
                ),
                TextButton(
                  onPressed: onAboutUsPressed,
                  child: const Text('About Us', style: TextStyle(fontSize: 22)),
                ),
                TextButton(
                  onPressed: onCheckoutPressed,
                  child: const Text('Checkout', style: TextStyle(fontSize: 22)),
                ),
              ],
            ),
          ),
          // Wrap the Text widget with GestureDetector
          GestureDetector(
            onTap: () {
              // Navigate to the home page when the text is tapped
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Expanded(
              child: Center(
                child: Text('Rhapsody in Rose', style: TextStyle(fontSize: 30)),
              ),
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
      toolbarHeight: 150.0,
    );
  }
}
