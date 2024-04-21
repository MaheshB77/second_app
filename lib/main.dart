import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// import 'package:second_app/theme/app_theme.dart';
// import 'package:second_app/expense_tracker/expense_tracker.dart';

// import 'package:second_app/meals_app/meals_app.dart';
// import 'package:second_app/meals_app/theme/meal_app_theme.dart';

// import 'package:second_app/shopping_list/theme/shopping_list_app_theme.dart';
// import 'package:second_app/shopping_list/shopping_list_app.dart';

import 'package:second_app/favorite_places/favorite_places_app.dart';
import 'package:second_app/favorite_places/theme/favorite_places_app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

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

      // theme: shoppingListAppTheme,
      // home: const ShoppingListApp(),

      theme: favoritePlacesAppTheme,
      home: const FavoritePlacesApp(),
    );
  }
}
