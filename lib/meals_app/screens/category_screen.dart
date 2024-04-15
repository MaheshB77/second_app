import 'package:flutter/material.dart';
import 'package:second_app/meals_app/data/dummy_data.dart';
import 'package:second_app/meals_app/models/category.dart';
import 'package:second_app/meals_app/models/meal.dart';
import 'package:second_app/meals_app/screens/meals_screen.dart';
import 'package:second_app/meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  const CategoryScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  void _selectCategory(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: _getMealsForCategory(category),
          title: category.title,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  List<Meal> _getMealsForCategory(Category category) {
    return availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map(
            (category) => CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
          )
          .toList(),
    );
  }
}
