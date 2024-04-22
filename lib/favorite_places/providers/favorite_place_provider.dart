import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

import 'package:second_app/favorite_places/models/favorite_place.dart';

class FavoritePlaceNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlaceNotifier() : super(const []);

  void addFavoritePlace(FavoritePlace place) async {
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(place.image.path);
    final copiedImage = await place.image.copy('${appDir.path}/$fileName');

    state = [
      FavoritePlace(
        id: place.id,
        title: place.title,
        image: copiedImage,
        location: place.location,
      ),
      ...state
    ];
  }
}

final favoritePlaceProvider =
    StateNotifierProvider<FavoritePlaceNotifier, List<FavoritePlace>>(
  (ref) => FavoritePlaceNotifier(),
);
