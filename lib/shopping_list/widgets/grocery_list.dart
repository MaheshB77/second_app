import 'package:flutter/material.dart';
import 'package:second_app/shopping_list/models/grocery_item.dart';

class GroceryList extends StatelessWidget {
  final List<GroceryItem> groceryItems;
  const GroceryList(this.groceryItems, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(groceryItems[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: Theme.of(context).cardTheme.margin, 
        ),
        child: ListTile(
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
      ),
    );
  }
}
