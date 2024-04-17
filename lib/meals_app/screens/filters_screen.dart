import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/meals_app/providers/filter_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _vegetarianFilter = false;
  bool _veganFilter = false;

  @override
  void initState() {
    super.initState();
    final filters = ref.read(filtersProvider);
    _glutenFreeFilter = filters[Filter.glutenFree]!;
    _lactoseFreeFilter = filters[Filter.lactoseFree]!;
    _vegetarianFilter = filters[Filter.vegetarian]!;
    _veganFilter = filters[Filter.vegan]!;
  }

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
      body: PopScope(
        canPop: true,
        onPopInvoked: (bool didPop) {
          ref.read(filtersProvider.notifier).updateFilters({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarian: _vegetarianFilter,
            Filter.vegan: _veganFilter,
          });
        },
        child: Column(
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
