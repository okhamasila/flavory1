import 'package:flavory/asset/card.dart';
import 'package:flavory/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      body: favoriteProvider.favoriteRecipes.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: favoriteProvider.favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteProvider.favoriteRecipes[index];
                return RecipeCard(
                  imagePath: recipe['imagePath']!,
                  title: recipe['title']!,
                  category: recipe['category']!,
                  serving: recipe['serving']!,
                  isFavorite: true,
                  onFavoriteToggle: () {
                    favoriteProvider.toggleFavorite(recipe);
                  },
                );
              },
            ),
    );
  }
}
