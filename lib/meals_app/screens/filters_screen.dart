import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/meals_app/providers/filter_provider.dart';
import 'package:second_app/meals_app/widgets/filter_tile.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          FilterTile(
            value: filters[Filter.glutenFree]!,
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals',
            filter: Filter.glutenFree,
          ),
          FilterTile(
            value: filters[Filter.lactoseFree]!,
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals',
            filter: Filter.lactoseFree,
          ),
          FilterTile(
            value: filters[Filter.vegetarian]!,
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            filter: Filter.vegetarian,
          ),
          FilterTile(
            value: filters[Filter.vegan]!,
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            filter: Filter.vegan,
          ),
        ],
      ),
    );
  }
}
