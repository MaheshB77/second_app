import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

class ImageInput extends StatefulWidget {
  final void Function(File imageFile) addImage;
  const ImageInput({super.key, required this.addImage});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final capturedImage = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600,
    );

    if (capturedImage == null) return;

    setState(() {
      _selectedImage = File(capturedImage.path);
      widget.addImage(_selectedImage!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? content;
    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    } else {
      content = TextButton.icon(
        onPressed: _takePicture,
        icon: const Icon(Icons.camera_alt_outlined),
        label: const Text('Take a picture'),
      );
    }

    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: content,
    );
  }
}
