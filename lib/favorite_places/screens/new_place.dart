import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/favorite_places/models/favorite_place.dart';
import 'package:second_app/favorite_places/providers/favorite_place_provider.dart';
import 'package:second_app/favorite_places/widgets/image_input.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _formKey = GlobalKey<FormState>();
  String _enteredTitle = '';
  File? _imageFile;

  String? _nameValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Name should be between 1 to 50 characters';
    }
    return null;
  }

  void _addNewPlace(BuildContext context) {
    if (_formKey.currentState!.validate() && _imageFile != null) {
      _formKey.currentState!.save();
      ref.read(favoritePlaceProvider.notifier).addFavoritePlace(
            FavoritePlace(
              id: DateTime.now().toString(),
              title: _enteredTitle,
              image: _imageFile!
            ),
          );
      Navigator.pop(context);
    }
  }

  void _addImage(File imageFile) {
    _imageFile = imageFile;
  }

  @override
  Widget build(BuildContext context) {
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
                decoration: const InputDecoration(labelText: 'Title'),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                validator: _nameValidator,
                onSaved: (value) {
                  _enteredTitle = value!;
                },
              ),
              const SizedBox(height: 10),
              ImageInput(addImage: _addImage),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _addNewPlace(context);
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
