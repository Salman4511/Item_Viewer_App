import 'package:flutter/material.dart';
import 'package:item_viewer_app/controllers/item_provider.dart';
import 'package:item_viewer_app/views/detail_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/item_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ItemProvider>(context, listen: false).fetchItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () =>
                Provider.of<ItemProvider>(context, listen: false).toggleTheme(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (value) {
                Provider.of<ItemProvider>(context, listen: false)
                    .filterItems(value);
              },
            ),
          ),
          Expanded(
            child: Consumer<ItemProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (provider.hasError) {
                  return const Center(child: Text('Failed to load items.'));
                } else if (provider.filteredItems.isEmpty) {
                  return const Center(child: Text('No items found.'));
                }
                return RefreshIndicator(
                  onRefresh: provider.fetchItems,
                  child: ListView.builder(
                    itemCount: provider.filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = provider.filteredItems[index];
                      return ItemTile(
                        item: item,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(item: item),
                            ),
                          );
                        },
                      );
                    },
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
