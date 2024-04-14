import 'package:flutter/material.dart';
import 'package:second_app/meals_app/screens/category_screen.dart';
import 'package:second_app/meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;
  Widget _selectedScreen = CategoryScreen();
  String _title = 'Pick your category';

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
      if (_selectedTabIndex == 1) {
        _title = 'Favorite Meals';
        _selectedScreen = const MealsScreen(
          meals: [], // To be removed
        );
      } else {
        _selectedScreen = CategoryScreen();
        _title = 'Pick your category';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
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
