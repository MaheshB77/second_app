import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/favorite_places/models/favorite_place.dart';

class FavoritePlaceNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlaceNotifier() : super(const []);

  void addFavoritePlace(FavoritePlace favoritePlace) {
    state = [...state, favoritePlace];
  }
}

 final favoritePlaceProvider =
    StateNotifierProvider<FavoritePlaceNotifier, List<FavoritePlace>>(
  (ref) => FavoritePlaceNotifier(),
);