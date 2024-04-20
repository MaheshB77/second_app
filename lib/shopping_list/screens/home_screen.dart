import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/shopping_list/models/grocery_item.dart';
import 'package:second_app/shopping_list/providers/auth_provider.dart';
import 'package:second_app/shopping_list/screens/new_item_screen.dart';
import 'package:second_app/shopping_list/services/category_service.dart';
import 'package:second_app/shopping_list/widgets/grocery_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<GroceryItem> _groceryItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getGroceries();
  }

  void _addItem() async {
    await Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(
        builder: (ctx) => const NewItemScreen(),
      ),
    );
    _getGroceries();
  }

  void _deleteGroceryItem(GroceryItem groceryItem) async {
    final index = _groceryItems.indexOf(groceryItem);
    try {
      setState(() {
        _groceryItems.removeAt(index);
      });
      await CategoryService().deleteGroceryItem(groceryItem);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Something went wrong!')),
        );
        setState(() {
          _groceryItems.insert(index, groceryItem); // Undo from UI
        });
      }
    }
  }

  void _logOut() async {
    ref.watch(authProvider.notifier).signOut();
    if (!context.mounted) return;
    Navigator.pop(context);
  }

  void _getGroceries() async {
    setState(() {
      _isLoading = true;
    });
    final result = await CategoryService().getGroceries();
    setState(() {
      _groceryItems = [...result];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final content = _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GroceryList(
            _groceryItems,
            deleteGroceryItem: _deleteGroceryItem,
          );

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
      body: content,
    );
  }
}
