import 'package:flavory/asset/card.dart';
import 'package:flavory/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> recipes = [
    {
      'id': 1,
      'imagePath': 'lib/images/cookies_nutella.png',
      'title': 'Cookies Nutella',
      'category': 'Cemilan',
      'serving': '2-3 Orang',
      'isFavorite': false,
    },
    {
      'id': 2,
      'imagePath': 'lib/images/spaghetti_bolognese.png',
      'title': 'Spaghetti Bolognese',
      'category': 'Makanan Utama',
      'serving': '4-5 Orang',
      'isFavorite': false,
    },
    {
      'id': 3,
      'imagePath': 'lib/images/pancakes_maple.png',
      'title': 'Pancakes Maple Syrup',
      'category': 'Sarapan',
      'serving': '2-3 Orang',
      'isFavorite': false,
    },
    {
      'id': 4,
      'imagePath': 'lib/images/chicken_salad.png',
      'title': 'Chicken Salad',
      'category': 'Salad',
      'serving': '1-2 Orang',
      'isFavorite': false,
    },
    {
      'id': 5,
      'imagePath': 'lib/images/mango_smoothie.png',
      'title': 'Mango Smoothie',
      'category': 'Minuman',
      'serving': '1 Orang',
      'isFavorite': false,
    },
    {
      'id': 6,
      'imagePath': 'lib/images/steak.png',
      'title': 'Grilled Steak',
      'category': 'Makanan Utama',
      'serving': '2-3 Orang',
      'isFavorite': false,
    },
    {
      'id': 7,
      'imagePath': 'lib/images/cheese_cake.png',
      'title': 'Cheesecake',
      'category': 'Dessert',
      'serving': '6-8 Orang',
      'isFavorite': false,
    },
    {
      'id': 8,
      'imagePath': 'lib/images/sushi.png',
      'title': 'Sushi',
      'category': 'Makanan Utama',
      'serving': '2-4 Orang',
      'isFavorite': false,
    },
    {
      'id': 9,
      'imagePath': 'lib/images/chicken_soup.png',
      'title': 'Chicken Soup',
      'category': 'Soup',
      'serving': '3-4 Orang',
      'isFavorite': false,
    },
    {
      'id': 10,
      'imagePath': 'lib/images/spring_rolls.png',
      'title': 'Spring Rolls',
      'category': 'Cemilan',
      'serving': '2-3 Orang',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SearchAndAddBar(),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                // Access the provider to determine if the recipe is a favorite
                final isFavorite =
                    Provider.of<FavoriteProvider>(context).isFavorite(recipe);
                return RecipeCard(
                  imagePath: recipe['imagePath']!,
                  title: recipe['title']!,
                  category: recipe['category']!,
                  serving: recipe['serving']!,
                  isFavorite: isFavorite,
                  onFavoriteToggle: () {
                    // Use the provider to toggle the favorite state
                    Provider.of<FavoriteProvider>(context, listen: false)
                        .toggleFavorite(recipe);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for the search bar and add button
class SearchAndAddBar extends StatelessWidget {
  const SearchAndAddBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Add Button
          ElevatedButton.icon(
            onPressed: () {
              // Handle add button action
            },
            icon: const Icon(Icons.add),
            label: const Text('Add'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF58B2A),
              foregroundColor: Colors.white, // Set text color to white
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const Spacer(), // This pushes the search field to the right
          // Search Field
          SizedBox(
            width: 200,
            height: 43,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Resep',
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
