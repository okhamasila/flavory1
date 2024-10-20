import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String category;
  final String serving;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const RecipeCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.category,
    required this.serving,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Recipe Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16.0),
            // Recipe Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      // Category Tag
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          category,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      // Serving Tag
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          serving,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Favorite Icon
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: onFavoriteToggle,
            ),
          ],
        ),
      ),
    );
  }
}
