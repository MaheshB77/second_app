import 'package:flutter/material.dart';
// import 'package:second_app/theme/app_theme.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:second_app/expense_tracker/expense_tracker.dart';

// import 'package:second_app/meals_app/meals_app.dart';
// import 'package:second_app/meals_app/theme/meal_app_theme.dart';

import 'package:second_app/shopping_list/theme/shopping_list_app_theme.dart';
import 'package:second_app/shopping_list/shopping_list_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: appTheme,
      // darkTheme: appDarkTheme,
      // home: const DiceApp(),
      // home: const QuizApp(),
      // home: const ExpenseTracker(),
      
      // theme: mealAppTheme,
      // home: const MealsApp(),

      theme: shoppingListAppTheme,
      home: const ShoppingListApp(),
    );
  }
}
