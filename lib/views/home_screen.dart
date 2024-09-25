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
      body: Consumer<ItemProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.hasError) {
            return const Center(child: Text('Failed to load items.'));
          } else if (provider.items.isEmpty) {
            return const Center(child: Text('No items found.'));
          }
          return RefreshIndicator(
            onRefresh: provider.fetchItems,
            child: ListView.builder(
              itemCount: provider.items.length,
              itemBuilder: (context, index) {
                final item = provider.items[index];
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
    );
  }
}
