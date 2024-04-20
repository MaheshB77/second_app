import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/shopping_list/data/categories.dart';
import 'package:second_app/shopping_list/models/grocery_item.dart';
import 'package:second_app/shopping_list/providers/auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class CategoryService {
  Future<List<GroceryItem>> getGroceries() async {
    print('GETTING GROCERY ITEMS');
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

  FutureOr<PostgrestFilterBuilder?> saveGroceryItem(
    GroceryItem groceryItem,
    WidgetRef ref,
  ) async {
    PostgrestFilterBuilder? result;
    print('ADDING GROCERY ITEM');
    try {
      result = await supabase.from('grocery_item').insert(
        [
          {
            'name': groceryItem.name,
            'quantity': groceryItem.quantity,
            'category': groceryItem.category.title,
            'user_id': ref.read(authProvider)!.id
          },
        ],
      );
    } catch (e) {
      print('Error :: ${e.toString()}');
      rethrow;
    }
    return result;
  }

  FutureOr<PostgrestFilterBuilder?> deleteGroceryItem(
    GroceryItem groceryItem,
  ) async {
    print('DELETING GROCERY ITEM');
    try {
      return await supabase
          .from('grocery_item')
          .delete()
          .eq('id', groceryItem.id);
    } catch (e) {
      print('Error :: ${e.toString()}');
      rethrow;
    }
  }
}
