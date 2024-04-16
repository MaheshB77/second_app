import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/meals_app/data/dummy_data.dart';
import 'package:second_app/meals_app/models/meal.dart';

final mealsProvider = Provider<List<Meal>>((ref) {
  return dummyMeals;
});