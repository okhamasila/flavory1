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
  ];

  // Fungsi untuk menampilkan popup tambah resep
  void _showAddRecipeDialog(BuildContext context) {
    final _nameController = TextEditingController();
    final _servingController = TextEditingController();
    final _descriptionController = TextEditingController();
    String? _imagePath;
    String _selectedCategory = 'Snack'; // Default value for category
    String _selectedServing = '1-2'; // Default value for serving

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Input foto makanan (placeholder)
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        // Logika pemilihan gambar dapat ditambahkan di sini
                        setState(() {
                          _imagePath = "lib/images/default.png";
                        });
                      },
                      icon: const Icon(Icons.image, color: Colors.black),
                      label: const Text('Pilih Foto', style: TextStyle(color: Colors.black)),
                    ),
                    if (_imagePath != null)
                      const Text('Foto Dipilih', style: TextStyle(color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 10),
                // Nama Makanan
                Align(
                alignment: Alignment.centerLeft,
                child: Text('Nama Makanan', style: TextStyle(color: Colors.black)),
              ),                
              TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Jenis Makanan (Dropdown)
                Align(
                alignment: Alignment.centerLeft,
                child: Text('Jenis', style: TextStyle(color: Colors.black)),
                ),                
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  items: [
                    'Snack', 'Makan Pagi', 'Makan Siang', 'Makan Sore', 'Makan Malam', 'Diet', 'Isi Sendiri'
                  ]
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Porsi (Dropdown)
                Align(
                alignment: Alignment.centerLeft,
                child: Text('Porsi', style: TextStyle(color: Colors.black)),
              ),
                DropdownButtonFormField<String>(
                  value: _selectedServing,
                  items: ['1-2', '3-4', '5-6', '>7']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedServing = newValue!;
                    });
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                // Deskripsi Resep
                Align(
                alignment: Alignment.centerLeft,
                child: Text('Deskripsi Resep', style: TextStyle(color: Colors.black)),
              ),
                TextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Batal', style: TextStyle(color: Color(0xFFF58B2A))),
                    ),
                    TextButton(
                      onPressed: () {
                        // Validasi input
                        if (_nameController.text.isNotEmpty) {
                          setState(() {
                            // Tambahkan resep baru ke dalam daftar
                            recipes.add({
                              'id': recipes.length + 1,
                              'imagePath': _imagePath ?? 'lib/images/default.png',
                              'title': _nameController.text,
                              'category': _selectedCategory,
                              'serving': _selectedServing,
                              'isFavorite': false,
                            });
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Tambah', style: TextStyle(color: Color(0xFFF58B2A))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchAndAddBar(
            onAddPressed: () {
              _showAddRecipeDialog(context);
            },
          ),
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

// Widget untuk search bar dan tombol tambah
class SearchAndAddBar extends StatelessWidget {
  final VoidCallback onAddPressed;

  const SearchAndAddBar({super.key, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ElevatedButton.icon(
            onPressed: onAddPressed,
            icon: const Icon(Icons.add),
            label: const Text('Add'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF58B2A),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const Spacer(),
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
