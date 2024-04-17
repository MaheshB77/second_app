
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/meals_app/providers/filter_provider.dart';

class FilterTile extends ConsumerWidget {
  final bool value;
  final String title;
  final String subtitle;
  final Filter filter;

  const FilterTile({
    super.key,
    required this.value,
    required this.title,
    required this.subtitle,
    required this.filter,
  });

  void _onUpdateFilter(bool isActive, WidgetRef ref) {
    ref.watch(filtersProvider.notifier).updateFilter(filter, isActive);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);
    return SwitchListTile(
      value: value,
      onChanged: (isActive) {
        _onUpdateFilter(isActive, ref);
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
