import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_app/shopping_list/models/grocery_item.dart';

class GroceryList extends StatelessWidget {
  final List<GroceryItem> groceryItems;
  const GroceryList(this.groceryItems, {super.key});

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
