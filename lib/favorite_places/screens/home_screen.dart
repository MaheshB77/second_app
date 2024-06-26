import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/favorite_places/models/favorite_place.dart';
import 'package:second_app/favorite_places/providers/favorite_place_provider.dart';
import 'package:second_app/favorite_places/screens/new_place.dart';
import 'package:second_app/favorite_places/screens/place_details.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(favoritePlaceProvider.notifier).loadPlaces();
  }

  void _onAddNew(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const NewPlace(),
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
  Widget build(BuildContext context) {
    final places = ref.watch(favoritePlaceProvider);
    var fallBack = Center(
      child: Text(
        'No places added yet!',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );

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
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: _placesFuture,
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView.builder(
                          itemCount: places.length,
                          itemBuilder: (ctx, index) => ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: FileImage(places[index].image),
                            ),
                            title: Text(places[index].title),
                            subtitle: Text(places[index].location),
                            onTap: () {
                              _goToDetails(context, places[index]);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
