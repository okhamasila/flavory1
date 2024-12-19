import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final Function(int) onTabTapped;
  final int selectedIndex;

  const Menu({
    super.key,
    required this.onTabTapped,
    required this.selectedIndex,
  });

  // Define the list of pages here
  static final List<Widget> pages = [
    const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        'Shopping Cart',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        'Favorites',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 24),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            color: selectedIndex == 0 ? const Color(0xFFF58B2A) : Colors.grey,
            onPressed: () {
              onTabTapped(0);
            },
          ),
          IconButton(
            icon: const Icon(Icons.local_grocery_store),
            color: selectedIndex == 1 ? const Color(0xFFF58B2A) : Colors.grey,
            onPressed: () {
              onTabTapped(1);
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            color: selectedIndex == 2 ? const Color(0xFFF58B2A) : Colors.grey,
            onPressed: () {
              onTabTapped(2);
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            color: selectedIndex == 3 ? const Color(0xFFF58B2A) : Colors.grey,
            onPressed: () {
              onTabTapped(3);
            },
          ),
        ],
      ),
    );
  }
}
