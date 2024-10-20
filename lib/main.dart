import 'package:flavory/asset/menu.dart';
import 'package:flavory/asset/navbar.dart';
import 'package:flavory/pages/favorite.dart';
import 'package:flavory/pages/home.dart';
import 'package:flavory/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  // Define your pages here
  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const Center(
      child: Text(
        'Shopping Cart',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const FavoritePage(),
    const Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 24),
      ),
    ),
    // Add more pages as needed
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: const Navbar(),
        body: _pages[_selectedIndex],
        bottomNavigationBar: Menu(
          onTabTapped: _onTabTapped,
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }
}
