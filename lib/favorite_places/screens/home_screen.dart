import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/favorite_places/models/favorite_place.dart';
import 'package:second_app/favorite_places/providers/favorite_place_provider.dart';
import 'package:second_app/favorite_places/screens/new_place.dart';
import 'package:second_app/favorite_places/screens/place_details.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _onAddNew(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => NewPlace(),
      ),
    );
  }

  void _goToDetails(BuildContext context, FavoritePlace favoritePlace) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => PlaceDetails(favoritePlace: favoritePlace),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(favoritePlaceProvider);
    var fallBack = const Center(child: Text('No places added yet!'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            onPressed: () {
              _onAddNew(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: places.isEmpty
          ? fallBack
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (ctx, index) => ListTile(
                      title: Text(places[index].title),
                      onTap: () {
                        _goToDetails(context, places[index]);
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
