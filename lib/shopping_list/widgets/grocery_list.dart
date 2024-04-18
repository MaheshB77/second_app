import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_app/shopping_list/data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: groceryItems[index].category.color,
          ),
        ),
        title: Text(groceryItems[index].name),
        trailing: Text(groceryItems[index].quantity.toString()),
      ),
    );
  }
}
