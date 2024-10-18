import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Default ke tab pertama

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
          margin: EdgeInsets.only(bottom: 10, right: 70),
        child :SizedBox(
          height: 75,
          child: Image.asset('lib/images/logo_flavory.png'),
        ),
        ),
        backgroundColor: const Color(0xFFD9D9D9),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Aksi saat tombol 3 titik ditekan
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'home',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                _onTabTapped(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _onTabTapped(1);
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                _onTabTapped(2);
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                _onTabTapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
