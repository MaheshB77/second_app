import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/favorite_places/models/favorite_place.dart';
import 'package:second_app/favorite_places/providers/favorite_place_provider.dart';

class NewPlace extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  String _enteredTitle = '';
  NewPlace({super.key});

  String? _nameValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Name should be between 1 to 50 characters';
    }
    return null;
  }

  void _addNewPlace(BuildContext context, WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(favoritePlaceProvider.notifier).addFavoritePlace(FavoritePlace(
            id: DateTime.now().toString(),
            title: _enteredTitle,
          ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  focusColor: Colors.white
                ),
                validator: _nameValidator,
                onSaved: (value) {
                  _enteredTitle = value!;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _addNewPlace(context, ref);
                },
                child: const Text('Add Place'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
