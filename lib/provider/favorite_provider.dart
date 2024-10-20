import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _favoriteRecipes = [];

  List<Map<String, dynamic>> get favoriteRecipes => _favoriteRecipes;

  void toggleFavorite(Map<String, dynamic> recipe) {
    if (_favoriteRecipes.any((item) => item['id'] == recipe['id'])) {
      _favoriteRecipes.removeWhere((item) => item['id'] == recipe['id']);
    } else {
      _favoriteRecipes.add(recipe);
    }
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> recipe) {
    return _favoriteRecipes.any((item) => item['id'] == recipe['id']);
  }
}
