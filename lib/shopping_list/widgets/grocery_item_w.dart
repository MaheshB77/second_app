import 'package:flutter/material.dart';
import 'package:second_app/shopping_list/models/grocery_item.dart';

class GroceryItemW extends StatelessWidget {
  final GroceryItem groceryItem;
  const GroceryItemW({super.key, required this.groceryItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 20,
        width: 20,
        decoration: const BoxDecoration(
          color: Colors.lightBlue,
        ),
      ),
      title: Row(
        children: [
          Text(groceryItem.name),
          const Spacer(),
          Text(groceryItem.quantity.toString()),
        ],
      ),
    );
  }
}
