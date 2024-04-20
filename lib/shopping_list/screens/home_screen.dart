import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/shopping_list/models/grocery_item.dart';
import 'package:second_app/shopping_list/providers/auth_provider.dart';
import 'package:second_app/shopping_list/screens/new_item_screen.dart';
import 'package:second_app/shopping_list/widgets/grocery_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<GroceryItem> groceryItems = [];
  void _addItem() async {
    final newItem = await Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(
        builder: (ctx) => const NewItemScreen(),
      ),
    );

    if (newItem == null) {
      return;
    }
    
    setState(() {
      groceryItems.add(newItem);
    });
  }

  void _logOut() async {
    ref.watch(authProvider.notifier).signOut();
    if (!context.mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: _logOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: GroceryList(groceryItems),
    );
  }
}
