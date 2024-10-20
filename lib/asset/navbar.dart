import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  // Default image path for the logo
  final String imagePath;

  // Default actions for the AppBar
  final List<Widget>? actions;

  const Navbar({
    super.key,
    this.imagePath = 'lib/images/logo_flavory.png', // Default logo path
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Container(
          margin: const EdgeInsets.only(bottom: 10, right: 200),
          child: SizedBox(
            height: 75,
            child: Image.asset(imagePath),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 180, 110),
        elevation: 0,
        actions: actions ??
            [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.black),
                  onPressed: () {
                    // Default action
                  },
                ),
              ),
            ]);
  }

  // This defines the height of the AppBar
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
