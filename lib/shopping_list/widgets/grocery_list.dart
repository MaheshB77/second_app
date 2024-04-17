import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_app/shopping_list/data/dummy_items.dart';
import 'package:second_app/shopping_list/widgets/grocery_item_w.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: groceryItems
          .map(
            (item) => GroceryItemW(groceryItem: item),
          )
          .toList(),
    );
  }
}
