import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/meals_app/models/meal.dart';
import 'package:second_app/meals_app/providers/favorite_provider.dart';
import 'package:second_app/meals_app/providers/filter_provider.dart';
import 'package:second_app/meals_app/providers/meals_provider.dart';
import 'package:second_app/meals_app/screens/category_screen.dart';
import 'package:second_app/meals_app/screens/filters_screen.dart';
import 'package:second_app/meals_app/screens/meals_screen.dart';
import 'package:second_app/meals_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedTabIndex = 0;
  Widget? _selectedScreen;
  String _title = 'Pick your category';

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _selectScreen() {
    final favoriteMeals = ref.watch(favoriteMealProvider);
    final filteredMeals = _getFilteredMeals();
    if (_selectedTabIndex == 1) {
      _title = 'Favorite Meals';
      _selectedScreen = MealsScreen(meals: favoriteMeals);
    } else {
      _selectedScreen = CategoryScreen(availableMeals: filteredMeals);
      _title = 'Pick your category';
    }
  }

  List<Meal> _getFilteredMeals() {
    final meals = ref.watch(mealsProvider);
    final filters = ref.watch(filtersProvider);
    return meals.where((meal) {
      if (filters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (filters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (filters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  void _selectSideOption(String option) {
    Navigator.of(context).pop();
    if (option == 'filters') {
      Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _selectScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: MainDrawer(
        onSelectSideOption: _selectSideOption,
      ),
      body: _selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        currentIndex: _selectedTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
