import 'dart:io';

class FavoritePlace {
  final String id;
  final String title;
  final File image;
  final String location;

  FavoritePlace({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
  });
}
