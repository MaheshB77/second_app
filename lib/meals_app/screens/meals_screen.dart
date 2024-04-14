import 'package:flutter/material.dart';
import 'package:second_app/meals_app/models/meal.dart';
import 'package:second_app/meals_app/screens/meal_detail_screen.dart';
import 'package:second_app/meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;

  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
  });

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (meal) {
          _selectMeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals present',
              style: getBodyTextStyle(context),
            ),
          ],
        ),
      );
    }

    if (title != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    }

    return content;

  }
}

// Utility methods
TextStyle getBodyTextStyle(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .bodyLarge!
      .copyWith(color: Theme.of(context).primaryColorLight);
}
