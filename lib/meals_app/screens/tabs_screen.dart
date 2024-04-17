import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/meals_app/models/meal.dart';
import 'package:second_app/meals_app/providers/favorite_provider.dart';
import 'package:second_app/meals_app/providers/meals_provider.dart';
import 'package:second_app/meals_app/screens/category_screen.dart';
import 'package:second_app/meals_app/screens/filters_screen.dart';
import 'package:second_app/meals_app/screens/meals_screen.dart';
import 'package:second_app/meals_app/widgets/main_drawer.dart';

Map<Filter, bool> kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedTabIndex = 0;
  Widget? _selectedScreen;
  String _title = 'Pick your category';
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _selectScreen() {
    final favoriteMeals = ref.watch(favoriteMealProvider);
    if (_selectedTabIndex == 1) {
      _title = 'Favorite Meals';
      _selectedScreen = MealsScreen(
        meals: favoriteMeals
      );
    } else {
      _selectedScreen = CategoryScreen(
        availableMeals: _getAvailableMeals(),
      );
      _title = 'Pick your category';
    }
  }

  List<Meal> _getAvailableMeals() {
    final meals = ref.watch(mealsProvider);
    return meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  void _selectSideOption(String option) async {
    Navigator.of(context).pop();
    if (option == 'filters') {
      var result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            filters: _selectedFilters,
          ),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
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
