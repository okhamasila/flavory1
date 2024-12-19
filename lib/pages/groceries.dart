import 'package:flutter/material.dart';

class GroceryItem {
  String name;
  bool isChecked;

  GroceryItem({required this.name, this.isChecked = false});
}

class GroceriesApp extends StatelessWidget {
  const GroceriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroceriesScreen(),
    );
  }
}

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen({super.key});

  @override
  _GroceriesScreenState createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  final List<GroceryItem> _groceries = [];
  final TextEditingController _controller = TextEditingController();

  void _addGroceryItem(String name) {
    setState(() {
      _groceries.add(GroceryItem(name: name));
    });
    _controller.clear();
  }

  void _removeGroceryItem(int index) {
    setState(() {
      _groceries.removeAt(index);
    });
  }

  void _toggleGroceryItem(int index) {
    setState(() {
      _groceries[index].isChecked = !_groceries[index].isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 272,
                  height: 41,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      // hintText: '  Tambahkan kebutuhan belanja',
                      contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                      // fillColor: Colors.white,
                      // filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton.icon(
                  onPressed: () => _addGroceryItem(_controller.text),
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
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _groceries.length,
              itemBuilder: (context, index) {
                final grocery = _groceries[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color.fromARGB(255, 24, 22, 20)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: grocery.isChecked,
                      onChanged: (_) => _toggleGroceryItem(index),
                    ),
                    title: Text(grocery.name),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeGroceryItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}