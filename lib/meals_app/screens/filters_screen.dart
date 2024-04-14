import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _vegetarianFilter = false;
  bool _veganFilter = false;

  void _updateFilter(bool isActive, String filter) {
    if (filter == 'Gluten-Free') {
      setState(() {
        _glutenFreeFilter = isActive;
      });
    } else if (filter == 'Lactose-Free') {
      setState(() {
        _lactoseFreeFilter = isActive;
      });
    } else if (filter == 'Vegetarian') {
      setState(() {
        _vegetarianFilter = isActive;
      });
    } else if (filter == 'Vegan') {
      setState(() {
        _veganFilter = isActive;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          FilterTile(
            value: _glutenFreeFilter,
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals',
            onUpdateFilter: _updateFilter,
          ),
          FilterTile(
            value: _lactoseFreeFilter,
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals',
            onUpdateFilter: _updateFilter,
          ),
          FilterTile(
            value: _vegetarianFilter,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            onUpdateFilter: _updateFilter,
          ),
          FilterTile(
            value: _veganFilter,
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            onUpdateFilter: _updateFilter,
          ),
        ],
      ),
    );
  }
}

class FilterTile extends StatelessWidget {
  final bool value;
  final String title;
  final String subtitle;
  final void Function(bool isActive, String filter) onUpdateFilter;

  const FilterTile({
    super.key,
    required this.value,
    required this.title,
    required this.subtitle,
    required this.onUpdateFilter,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SwitchListTile(
      value: value,
      onChanged: (isActive) {
        onUpdateFilter(isActive, title);
      },
      title: Text(
        title,
        style: theme.textTheme.titleLarge!.copyWith(
          color: theme.colorScheme.onBackground,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.labelMedium!.copyWith(
          color: theme.colorScheme.onBackground,
        ),
      ),
      activeColor: theme.colorScheme.tertiary,
    );
  }
}
