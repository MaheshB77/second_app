import 'package:flutter/material.dart';
import 'package:second_app/shopping_list/widgets/grocery_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your groceries'),
      ),
      body: const GroceryList(),
    );
  }
}