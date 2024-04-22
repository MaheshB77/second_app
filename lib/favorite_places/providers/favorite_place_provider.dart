import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import 'package:second_app/favorite_places/models/favorite_place.dart';

class FavoritePlaceNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlaceNotifier() : super(const []);

  void addFavoritePlace(FavoritePlace place) async {
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(place.image.path);
    final copiedImage = await place.image.copy('${appDir.path}/$fileName');
    final placeToSave = FavoritePlace(
      id: place.id,
      title: place.title,
      image: copiedImage,
      location: place.location,
    );

    final db = await _getDatabase();
    await db.insert('user_places', {
      'id': placeToSave.id,
      'title': placeToSave.title,
      'image': placeToSave.image.path,
      'location': placeToSave.location,
    });

    state = [placeToSave, ...state];
  }

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final rows = await db.query('user_places');
    final places = rows
        .map(
          (row) => FavoritePlace(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String),
            location: row['location'] as String,
          ),
        )
        .toList();
    state = places;
  }
}

final favoritePlaceProvider =
    StateNotifierProvider<FavoritePlaceNotifier, List<FavoritePlace>>(
  (ref) => FavoritePlaceNotifier(),
);

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  const createQuery =
      'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, location TEXT)';
  return await sql.openDatabase(
    path.join(dbPath, 'favorite_places.db'),
    onCreate: (db, version) {
      return db.execute(createQuery);
    },
    version: 1,
  );
}
