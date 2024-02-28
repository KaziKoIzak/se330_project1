import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onRoomsPressed;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onAboutUsPressed;
  final VoidCallback? onContactPressed;

  const CustomAppBar({
    Key? key,
    this.onRoomsPressed,
    this.onMenuPressed,
    this.onAboutUsPressed,
    this.onContactPressed,
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
                  child: const Text('Rooms', style: TextStyle(fontSize: 24)),
                ),
                TextButton(
                  onPressed: onMenuPressed,
                  child: const Text('Menu', style: TextStyle(fontSize: 24)),
                ),
                TextButton(
                  onPressed: onAboutUsPressed,
                  child: const Text('About Us', style: TextStyle(fontSize: 24)),
                ),
                TextButton(
                  onPressed: onContactPressed,
                  child: const Text('Contact', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Rhapsody in Rose', style: TextStyle(fontSize: 36)),
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
