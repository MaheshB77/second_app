import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/favorite_places/models/favorite_place.dart';

class PlaceDetails extends ConsumerWidget {
  final FavoritePlace favoritePlace;
  const PlaceDetails({super.key, required this.favoritePlace});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place details'),
      ),
      body: Center(
        child: Text(
          favoritePlace.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer
          ),
        ),
      ),
    );
  }
}
