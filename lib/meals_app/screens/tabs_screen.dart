import 'package:flutter/material.dart';
import 'package:second_app/meals_app/data/dummy_data.dart';
import 'package:second_app/meals_app/models/meal.dart';
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

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;
  Widget? _selectedScreen;
  String _title = 'Pick your category';
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  @override
  void initState() {
    _selectedScreen = CategoryScreen(
      onToggleFavorite: _toggleFavoriteMeal,
      availableMeals: _getAvailableMeals(),
    );
    super.initState();
  }

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _toggleFavoriteMeal(Meal meal) {
    final mealPresent = _favoriteMeals.contains(meal);

    setState(() {
      if (mealPresent) {
        _favoriteMeals.remove(meal);
        _showSnackBar('Meal removed from favorites');
      } else {
        _favoriteMeals.add(meal);
        _showSnackBar('Meal added to favorites!');
      }
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _selectScreen() {
    print('Selecting the screen :: ${_getAvailableMeals().length}');
    if (_selectedTabIndex == 1) {
      _title = 'Favorite Meals';
      _selectedScreen = MealsScreen(
        meals: _favoriteMeals, // To be removed
        onToggleFavorite: _toggleFavoriteMeal,
      );
    } else {
      _selectedScreen = CategoryScreen(
        onToggleFavorite: _toggleFavoriteMeal,
        availableMeals: _getAvailableMeals(),
      );
      _title = 'Pick your category';
    }
  }

  List<Meal> _getAvailableMeals() {
    return dummyMeals.where((meal) {
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
