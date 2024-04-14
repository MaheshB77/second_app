import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilter,
            onChanged: (isActive) {
              setState(() {
                _glutenFreeFilter = isActive;
              });
            },
            title: Text(
              'Gluten-Free',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: theme.textTheme.labelMedium!.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
            activeColor: theme.colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
