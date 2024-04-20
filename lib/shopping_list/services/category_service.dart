import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/shopping_list/data/categories.dart';
import 'package:second_app/shopping_list/models/grocery_item.dart';
import 'package:second_app/shopping_list/providers/auth_provider.dart';
import 'package:second_app/shopping_list/screens/login_screen.dart';

class CategoryService {
  Future<List<GroceryItem>> getGroceries() async {
    final response = await supabase.from('grocery_item').select('*');
    return response.map((itemMap) {
      final category = categories.entries
          .firstWhere(
            (ctgry) =>
                ctgry.value.title.toUpperCase() ==
                itemMap['category'].toString().toUpperCase(),
          )
          .value;
      return GroceryItem(
        id: itemMap['id'],
        name: itemMap['name'],
        quantity: itemMap['quantity'],
        category: category,
      );
    }).toList();
  }

  void saveGroceryItem(GroceryItem groceryItem, WidgetRef ref) async {
    await supabase.from('grocery_item').insert(
      [
        {
          'name': groceryItem.name,
          'quantity': groceryItem.quantity,
          'category': groceryItem.category.title,
          'user_id': ref.read(authProvider)!.id
        },
      ],
    );
  }
}
