import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/meals_app/models/meal.dart';
import 'package:second_app/meals_app/providers/favorite_provider.dart';
import 'package:second_app/shared/widgets/spacing.dart';

class MealDetailsScreen extends ConsumerWidget {
  final Meal meal;
  const MealDetailsScreen({super.key, required this.meal});

  void _toggleFavorite(BuildContext context, WidgetRef ref) {
    bool isAdded = ref.read(favoriteMealProvider.notifier).toggleFavorite(meal);
    String message = isAdded ? 'Added to favorites' : 'Removed from favorites';
    _showSnackBar(context, message);
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  bool _isFavorite(WidgetRef ref) {
    return ref.watch(favoriteMealProvider).contains(meal);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              _toggleFavorite(context, ref);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: CurvedAnimation(
                    parent: animation,
                    curve: Curves.elasticInOut,
                  ),
                  child: child,
                );
              },
              child: Icon(
                _isFavorite(ref) ? Icons.star : Icons.star_border,
                key: ValueKey(_isFavorite(ref)),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            verticalSpace(14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            verticalSpace(14),
            for (final ing in meal.ingredients)
              Text(
                ing,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            verticalSpace(14),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            verticalSpace(6),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
